From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 11 Sep 2014 22:44:33 +0200
Subject: [Buildroot] [git commit] exfat-utils: bump to version 1.1.0
Message-ID: <20140911204621.E7E1F9D669@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c37ad316975dac3bf4efd58121d4c178fd3c381f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use gentoo distfiles since the download infra can't handle google docs
URLs.

[Peter: also pass TARGET_CFLAGS in CCFLAGS]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/exfat-utils/exfat-utils.mk |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/exfat-utils/exfat-utils.mk b/package/exfat-utils/exfat-utils.mk
index a3a80f2..a7e90dd 100644
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
+		$(TARGET_CONFIGURE_OPTS) CCFLAGS="$(TARGET_CFLAGS) -std=c99" $(SCONS))
 endef
 
 define EXFAT_UTILS_INSTALL_TARGET_CMDS
 	(cd $(@D); \
-		$(TARGET_CONFIGURE_OPTS) $(SCONS) \
+		$(TARGET_CONFIGURE_OPTS) CCFLAGS="$(TARGET_CFLAGS) -std=c99" $(SCONS) \
 		DESTDIR=$(TARGET_DIR)/usr/bin install)
 endef
 
