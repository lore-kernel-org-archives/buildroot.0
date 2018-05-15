From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Tue, 15 May 2018 21:51:51 +0200
Subject: [Buildroot] [RFC PATCH v2 0/8] Add pkg-meson infrastructure
Message-ID: <20180515195159.6694-1-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series adds an infrastructure for Meson-based packages and converts the
existing ones.

v1->v2:

- drop use of package variables for program paths and options.
- fix host variant support.
- fix RPATH stripping.
- improve documentation.

Eric Le Bihan (8):
  pkg-meson: new infrastructure
  docs/manual: document pkg-meson infra
  meson: prevent RPATH stripping
  libmpdclient: convert to pkg-meson infra
  systemd: convert to pkg-meson infra
  ncmpc: convert to pkg-meson infra
  mpd-mpc: convert to pkg-meson infra
  enlightenment: convert to pkg-meson infra

 DEVELOPERS                                         |   1 +
 docs/manual/adding-packages-meson.txt              | 117 +++++++--------
 package/Makefile.in                                |   1 +
 package/enlightenment/enlightenment.mk             |  30 +---
 package/libmpdclient/libmpdclient.mk               |  32 +---
 ...y-fix-RPATH-if-install_rpath-is-not-empty.patch |  32 ++++
 package/mpd-mpc/mpd-mpc.mk                         |  26 +---
 package/ncmpc/ncmpc.mk                             |  27 +---
 package/pkg-meson.mk                               | 166 +++++++++++++++++++++
 package/systemd/systemd.mk                         |  32 +---
 10 files changed, 271 insertions(+), 193 deletions(-)
 create mode 100644 package/meson/0001-Only-fix-RPATH-if-install_rpath-is-not-empty.patch
 create mode 100644 package/pkg-meson.mk

-- 
2.14.3
