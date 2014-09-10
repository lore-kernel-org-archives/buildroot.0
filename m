From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 10 Sep 2014 16:07:29 -0300
Subject: [Buildroot] [PATCH 1/2] exfat: bump to version 1.1.0
Message-ID: <1410376050-21735-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use gentoo distfiles since the download infra can't handle google docs
URLs.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/exfat/exfat.mk | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/exfat/exfat.mk b/package/exfat/exfat.mk
index 3c0dece..279c6a0 100644
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
+		$(TARGET_CONFIGURE_OPTS) CCFLAGS="-std=c99" $(SCONS))
 endef
 
 define EXFAT_INSTALL_TARGET_CMDS
 	(cd $(@D); \
-		$(TARGET_CONFIGURE_OPTS) $(SCONS) \
+		$(TARGET_CONFIGURE_OPTS) CCFLAGS="-std=c99" $(SCONS) \
 		DESTDIR=$(TARGET_DIR)/usr/sbin install)
 endef
 
-- 
1.8.5.5
