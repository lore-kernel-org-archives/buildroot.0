From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 14 Feb 2016 10:29:34 +0100
Subject: [Buildroot] [PATCH/next 2/4] package/libnfs: bump version to 1.10.0
In-Reply-To: <1455442176-31448-1-git-send-email-bernd.kuhls@t-online.de>
References: <1455442176-31448-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1455442176-31448-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed m4-hack after upstream adding m4/ to its repo:
https://github.com/sahlberg/libnfs/commit/8338c7e27f4fa3a120d8ee901611aaa3e390d576

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libnfs/libnfs.hash | 2 +-
 package/libnfs/libnfs.mk   | 8 +-------
 2 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/package/libnfs/libnfs.hash b/package/libnfs/libnfs.hash
index 14d304f..27a9e5d 100644
--- a/package/libnfs/libnfs.hash
+++ b/package/libnfs/libnfs.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	e95af693e763a504eee72dacf3dc6c1001d83e40b807e7e1d0be2eaf48af779c	libnfs-libnfs-1.9.8.tar.gz
+sha256	7f6c62a05c7e0f0749f2b13f178a4ed7aaf17bd09e65a10bb147bfe9807da272	libnfs-libnfs-1.10.0.tar.gz
diff --git a/package/libnfs/libnfs.mk b/package/libnfs/libnfs.mk
index 40d5ceb..e49656b 100644
--- a/package/libnfs/libnfs.mk
+++ b/package/libnfs/libnfs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNFS_VERSION = libnfs-1.9.8
+LIBNFS_VERSION = libnfs-1.10.0
 LIBNFS_SITE = $(call github,sahlberg,libnfs,$(LIBNFS_VERSION))
 LIBNFS_INSTALL_STAGING = YES
 LIBNFS_AUTORECONF = YES
@@ -17,10 +17,4 @@ ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
 LIBNFS_DEPENDENCIES += libtirpc
 endif
 
-# Needed for autoreconf
-define LIBNFS_MAKE_M4_DIR
-	mkdir $(@D)/m4
-endef
-LIBNFS_POST_EXTRACT_HOOKS += LIBNFS_MAKE_M4_DIR
-
 $(eval $(autotools-package))
-- 
2.7.0
