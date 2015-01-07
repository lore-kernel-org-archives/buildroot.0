From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 7 Jan 2015 21:54:00 +0100
Subject: [Buildroot] [git commit] package/lockdev: use LOCKDEV_MAJOR to
	create symbolic links
Message-ID: <20150107210039.7A79C80811@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e8302f95fe57e6c36c983e228a68c617f55de925
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Thanks to Baruch Siach for the suggestion.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lockdev/lockdev.mk |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/lockdev/lockdev.mk b/package/lockdev/lockdev.mk
index 11142e6..8d2c760 100644
--- a/package/lockdev/lockdev.mk
+++ b/package/lockdev/lockdev.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-LOCKDEV_VERSION = 1.0.3
+LOCKDEV_MAJOR = 1
+LOCKDEV_VERSION = $(LOCKDEV_MAJOR).0.3
 LOCKDEV_SOURCE = lockdev_$(LOCKDEV_VERSION).orig.tar.gz
 LOCKDEV_PATCH = lockdev_$(LOCKDEV_VERSION)-1.6.diff.gz
 LOCKDEV_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/l/lockdev
@@ -26,11 +27,11 @@ endif
 ifeq ($(BR2_SHARED_STATIC_LIBS)$(BR2_SHARED_LIBS),y)
 define LOCKDEV_CREATE_LINKS_STAGING
 	ln -sf liblockdev.$(LOCKDEV_VERSION).so $(STAGING_DIR)/usr/lib/liblockdev.so
-	ln -sf liblockdev.$(LOCKDEV_VERSION).so $(STAGING_DIR)/usr/lib/liblockdev.so.1
+	ln -sf liblockdev.$(LOCKDEV_VERSION).so $(STAGING_DIR)/usr/lib/liblockdev.so.$(LOCKDEV_MAJOR)
 endef
 
 define LOCKDEV_CREATE_LINKS_TARGET
-	ln -sf liblockdev.$(LOCKDEV_VERSION).so $(TARGET_DIR)/usr/lib/liblockdev.so.1
+	ln -sf liblockdev.$(LOCKDEV_VERSION).so $(TARGET_DIR)/usr/lib/liblockdev.so.$(LOCKDEV_MAJOR)
 endef
 endif
 
