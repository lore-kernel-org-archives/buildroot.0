From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Apr 2015 12:21:01 +0200
Subject: [Buildroot] [git commit] lockdev: change the name of variable
	LOCKDEV_MAJOR to LOCKDEV_VERSION_MAJOR
Message-ID: <20150406102119.2917781938@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d9e12fb31d340cb936280c0ce645afc7b4b16288
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lockdev/lockdev.mk |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/lockdev/lockdev.mk b/package/lockdev/lockdev.mk
index 8d2c760..e40a407 100644
--- a/package/lockdev/lockdev.mk
+++ b/package/lockdev/lockdev.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LOCKDEV_MAJOR = 1
-LOCKDEV_VERSION = $(LOCKDEV_MAJOR).0.3
+LOCKDEV_VERSION_MAJOR = 1
+LOCKDEV_VERSION = $(LOCKDEV_VERSION_MAJOR).0.3
 LOCKDEV_SOURCE = lockdev_$(LOCKDEV_VERSION).orig.tar.gz
 LOCKDEV_PATCH = lockdev_$(LOCKDEV_VERSION)-1.6.diff.gz
 LOCKDEV_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/l/lockdev
@@ -27,11 +27,11 @@ endif
 ifeq ($(BR2_SHARED_STATIC_LIBS)$(BR2_SHARED_LIBS),y)
 define LOCKDEV_CREATE_LINKS_STAGING
 	ln -sf liblockdev.$(LOCKDEV_VERSION).so $(STAGING_DIR)/usr/lib/liblockdev.so
-	ln -sf liblockdev.$(LOCKDEV_VERSION).so $(STAGING_DIR)/usr/lib/liblockdev.so.$(LOCKDEV_MAJOR)
+	ln -sf liblockdev.$(LOCKDEV_VERSION).so $(STAGING_DIR)/usr/lib/liblockdev.so.$(LOCKDEV_VERSION_MAJOR)
 endef
 
 define LOCKDEV_CREATE_LINKS_TARGET
-	ln -sf liblockdev.$(LOCKDEV_VERSION).so $(TARGET_DIR)/usr/lib/liblockdev.so.$(LOCKDEV_MAJOR)
+	ln -sf liblockdev.$(LOCKDEV_VERSION).so $(TARGET_DIR)/usr/lib/liblockdev.so.$(LOCKDEV_VERSION_MAJOR)
 endef
 endif
 
