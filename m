From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Mon,  7 May 2018 12:57:34 +0200
Subject: [Buildroot] [RFC PATCH 0/7] Add pkg-meson infrastructure
Message-ID: <20180507105741.31747-1-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series adds an infrastructure for Meson-based packages and converts the
existing ones.

Eric Le Bihan (7):
  pkg-meson: new infrastructure
  docs/manual: document pkg-meson infra
  libmpdclient: convert to pkg-meson infra
  systemd: convert to pkg-meson infra
  ncmpc: convert to pkg-meson infra
  mpd-mpc: convert to pkg-meson infra
  enlightenment: convert to pkg-meson infra

 DEVELOPERS                             |   1 +
 docs/manual/adding-packages-meson.txt  | 107 ++++++++++-------------
 package/Makefile.in                    |   1 +
 package/enlightenment/enlightenment.mk |  30 ++-----
 package/libmpdclient/libmpdclient.mk   |  32 +------
 package/mpd-mpc/mpd-mpc.mk             |  26 +-----
 package/ncmpc/ncmpc.mk                 |  27 +-----
 package/pkg-meson.mk                   | 153 +++++++++++++++++++++++++++++++++
 package/systemd/systemd.mk             |  32 +------
 9 files changed, 217 insertions(+), 192 deletions(-)
 create mode 100644 package/pkg-meson.mk

--
2.14.3
