From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon,  7 May 2012 22:32:02 +0200
Subject: [Buildroot] [PATCH v5 0/2] u-boot additions for OMAP processors
Message-ID: <1336422724-7384-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

here's a resubmit (plus Arnout's Acked-by tag) of my previously-sent patches.

Changed in v5:
 - Added Arnout's Acked-by tag.

Changed in v4:
 - more verbose help text for config options;
 - remove unneeded ifeq around the definition for UBOOT_BIN_IFT;
 - produce an error message if the user-specified cfg file does not exist;
 - use http URL, for helping people whose firewalls block git;
 - do not skip installation if the files are already installed.

New in v3:
 - update to the user-visible host packages policy discussed in
   mailing-list (Config.in.host etc) and listed in the Host Tools menu
 - update to current GENTARGETS infrastructure
 - bump to the latest git snapshot, which fixes compilation with host gcc 4.6

New in v2:
 - xxx_SOURCE is useless with the git download method, remove it;
 - OMAP_U_BOOT_UTILS_TARGETS is used only once, hardcoded it.

Luca

The following changes since commit 057c729c2438107b426576121bcf83f792734a6f:

  external-toolchain: add support for Linaro 2012.04 (2012-05-07 17:08:37 +0200)

are available in the git repository at:
  git://github.com/lucaceresoli/buildroot.git omap-u-boot-utils

Luca Ceresoli (2):
  omap-u-boot-utils: add new host package
  u-boot: build signed image for OMAP processors

 boot/uboot/Config.in                           |   32 ++++++++++++++++++++++++
 boot/uboot/uboot.mk                            |   25 ++++++++++++++++++
 package/Config.in.host                         |    1 +
 package/omap-u-boot-utils/Config.in.host       |    8 ++++++
 package/omap-u-boot-utils/omap-u-boot-utils.mk |   21 +++++++++++++++
 5 files changed, 87 insertions(+), 0 deletions(-)
 create mode 100644 package/omap-u-boot-utils/Config.in.host
 create mode 100644 package/omap-u-boot-utils/omap-u-boot-utils.mk

-- 
1.7.5.4
