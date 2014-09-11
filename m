From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 11 Sep 2014 22:43:16 +0200
Subject: [Buildroot] [git commit] exfat: bump to version 1.1.0
Message-ID: <20140911204621.DFC4A9D5A5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6b20237391971ceb94251952c1501c9197b90203
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use gentoo distfiles since the download infra can't handle google docs
URLs.

[Peter: also pass TARGET_CFLAGS in CCFLAGS]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/exfat/exfat.mk |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/exfat/exfat.mk b/package/exfat/exfat.mk
index 3c0dece..097c3ac 100644
--- a/package/exfat/exfat.mk
+++ b/package/exfat/exfat.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-EXFAT_VERSION = 1.0.1
-EXFAT_SITE = http://exfat.googlecode.com/files
+EXFAT_VERSION = 1.1.0
+EXFAT_SITE = http://distfiles.gentoo.org/distfiles
 EXFAT_SOURCE = fuse-exfat-$(EXFAT_VERSION).tar.gz
 EXFAT_DEPENDENCIES = host-scons libfuse
 EXFAT_LICENSE = GPLv3+
@@ -13,12 +13,12 @@ EXFAT_LICENSE_FILES = COPYING
 
 define EXFAT_BUILD_CMDS
 	(cd $(@D); \
-		$(TARGET_CONFIGURE_OPTS) $(SCONS))
+		$(TARGET_CONFIGURE_OPTS) CCFLAGS="$(TARGET_CFLAGS) -std=c99" $(SCONS))
 endef
 
 define EXFAT_INSTALL_TARGET_CMDS
 	(cd $(@D); \
-		$(TARGET_CONFIGURE_OPTS) $(SCONS) \
+		$(TARGET_CONFIGURE_OPTS) CCFLAGS="$(TARGET_CFLAGS) -std=c99" $(SCONS) \
 		DESTDIR=$(TARGET_DIR)/usr/sbin install)
 endef
 
