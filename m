From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Sun, 29 Dec 2013 18:31:27 +0100
Subject: [Buildroot] [PATCH 1/1] lockdev: Fix TARGET_DIR link
Message-ID: <BLU0-SMTP1038BCF760A4FE2F4B22DA2D9CF0@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
---
 package/lockdev/lockdev.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lockdev/lockdev.mk b/package/lockdev/lockdev.mk
index 004b637..0c10341 100644
--- a/package/lockdev/lockdev.mk
+++ b/package/lockdev/lockdev.mk
@@ -34,7 +34,7 @@ endef
 
 define LOCKDEV_INSTALL_TARGET_CMDS
 	$(MAKE1) basedir=$(TARGET_DIR)/usr -C $(@D) install_run
-	ln -sf liblockdev.$(LOCKDEV_VERSION).so $(STAGING_DIR)/usr/lib/liblockdev.so.1
+	ln -sf liblockdev.$(LOCKDEV_VERSION).so $(TARGET_DIR)/usr/lib/liblockdev.so.1
 endef
 endif # BR2_PREFER_STATIC_LIB
 
-- 
1.7.9.5
