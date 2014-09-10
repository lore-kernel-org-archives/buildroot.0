From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 10 Sep 2014 16:07:30 -0300
Subject: [Buildroot] [PATCH 2/2] exfat-utils: bump to version 1.1.0
In-Reply-To: <1410376050-21735-1-git-send-email-gustavo@zacarias.com.ar>
References: <1410376050-21735-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1410376050-21735-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use gentoo distfiles since the download infra can't handle google docs
URLs.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/exfat-utils/exfat-utils.mk | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/exfat-utils/exfat-utils.mk b/package/exfat-utils/exfat-utils.mk
index a3a80f2..7a1f33f 100644
--- a/package/exfat-utils/exfat-utils.mk
+++ b/package/exfat-utils/exfat-utils.mk
@@ -4,20 +4,20 @@
 #
 ################################################################################
 
-EXFAT_UTILS_VERSION = 1.0.1
-EXFAT_UTILS_SITE = http://exfat.googlecode.com/files
+EXFAT_UTILS_VERSION = 1.1.0
+EXFAT_UTILS_SITE = http://distfiles.gentoo.org/distfiles
 EXFAT_UTILS_DEPENDENCIES = host-scons
 EXFAT_UTILS_LICENSE = GPLv3+
 EXFAT_UTILS_LICENSE_FILES = COPYING
 
 define EXFAT_UTILS_BUILD_CMDS
 	(cd $(@D); \
-		$(TARGET_CONFIGURE_OPTS) $(SCONS))
+		$(TARGET_CONFIGURE_OPTS) CCFLAGS="-std=c99" $(SCONS))
 endef
 
 define EXFAT_UTILS_INSTALL_TARGET_CMDS
 	(cd $(@D); \
-		$(TARGET_CONFIGURE_OPTS) $(SCONS) \
+		$(TARGET_CONFIGURE_OPTS) CCFLAGS="-std=c99" $(SCONS) \
 		DESTDIR=$(TARGET_DIR)/usr/bin install)
 endef
 
-- 
1.8.5.5
