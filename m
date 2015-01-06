From: Romain Naour <romain.naour@openwide.fr>
Date: Wed,  7 Jan 2015 00:06:04 +0100
Subject: [Buildroot] [PATCH v2 2/2] package/lockdev: use LOCKDEV_MAJOR to
	create symbolic links
In-Reply-To: <1420585564-7921-1-git-send-email-romain.naour@openwide.fr>
References: <1420585564-7921-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1420585564-7921-2-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks to Baruch Siach for the suggestion.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/lockdev/lockdev.mk | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

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
 
-- 
1.9.3
