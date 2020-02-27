From: unixmania at gmail.com <unixmania@gmail.com>
Date: Thu, 27 Feb 2020 17:08:11 -0300
Subject: [Buildroot] [PATCH v2 0/4] adapt openrc "modules" script to busybox
 modprobe
Message-ID: <20200227200815.26613-1-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

The busybox modprobe does not have a "--first-time" option, "--verbose" is
just "-v" and "--use-blacklist" is just "-b". Also the blacklist support is
not selected in the default busybox configuration. So we need to patch the
modules scripts accordingly.

Patch 1 adds SED_QUIET, used by the KCONFIG_GET_OPT macro, in patch 2.

Patch 2 adds a KCONFIG_GET_OPT macro. Given a config name and a file, it
returns the config value, if set; otherwise returns an empty string.

Patch 3 adapts the "modules" init script to busybox "modprobe".

Patch 4 documents the use of busybox.mk variables in openrc.mk.

Carlos Santos (4):
  Makefile: add SED_QUIET
  package/pkg-utils.mk: add KCONFIG_GET_OPT macro
  package/openrc: adapt "modules" init script to busybox "modprobe"
  package/busybox.mk: document the use of variables in openrc.mk

 Makefile                   |  4 +++-
 package/busybox/busybox.mk |  4 ++++
 package/openrc/openrc.mk   | 28 +++++++++++++++++++++++++---
 package/pkg-utils.mk       |  4 ++++
 4 files changed, 36 insertions(+), 4 deletions(-)

-- 
2.18.2
