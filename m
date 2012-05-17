From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu, 17 May 2012 22:11:29 +0200
Subject: [Buildroot] [PATCH v6 0/2] u-boot additions for OMAP processors
Message-ID: <1337285491-3563-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit 56901908c63ed7b2aedffaa4b2143ce87a15d837:

  wpa_supplicant: explicitly disable libnl by default (2012-05-16 15:26:48 +0200)

are available in the git repository at:

  git at github.com:lucaceresoli/buildroot.git tags/omap-u-boot-utils-v6

for you to fetch changes up to 26d59393521b31d18671396f3dc71a6d076fe7da:

  u-boot: build signed image for OMAP processors (2012-05-17 16:11:20 +0200)

----------------------------------------------------------------
Luca Ceresoli (2):
      omap-u-boot-utils: add new host package
      u-boot: build signed image for OMAP processors

 boot/uboot/Config.in                           |   32 ++++++++++++++++++++++++
 boot/uboot/uboot.mk                            |   25 ++++++++++++++++++
 package/Config.in.host                         |    1 +
 package/omap-u-boot-utils/Config.in.host       |    8 ++++++
 package/omap-u-boot-utils/omap-u-boot-utils.mk |   21 ++++++++++++++++
 5 files changed, 87 insertions(+)
 create mode 100644 package/omap-u-boot-utils/Config.in.host
 create mode 100644 package/omap-u-boot-utils/omap-u-boot-utils.mk

----------------------------------------------------------------
Changed in v6:
 - use $() instead of ${} for make variables to be consistent with the
   Buildroot coding style.

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

-- 
1.7.9.5
