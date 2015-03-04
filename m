From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Wed,  4 Mar 2015 23:31:16 +0100
Subject: [Buildroot] [PATCH 1/2] lockdev: change the name of variable
	LOCKDEV_MAJOR to LOCKDEV_VERSION_MAJOR
In-Reply-To: <1425508277-11723-1-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1425508277-11723-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <1425508277-11723-2-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/lockdev/lockdev.mk | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

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
 
-- 
1.9.1
