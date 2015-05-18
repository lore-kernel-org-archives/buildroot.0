From: Floris Bos <bos@je-eigen-domein.nl>
Date: Mon, 18 May 2015 21:51:59 +0200
Subject: [Buildroot] [PATCH 1/6] php: delete /usr/lib/php/build instead of
	/usr/lib/php
Message-ID: <1431978724-25081-1-git-send-email-bos@je-eigen-domein.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

External PHP modules like the OPcache may live in
/usr/lib/php/extensions, so only delete /usr/lib/php/build

Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
---
 package/php/php.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/php/php.mk b/package/php/php.mk
index 47811ff..c36a80c 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -290,7 +290,7 @@ endef
 PHP_POST_INSTALL_TARGET_HOOKS += PHP_EXTENSIONS_FIXUP
 
 define PHP_INSTALL_FIXUP
-	rm -rf $(TARGET_DIR)/usr/lib/php
+	rm -rf $(TARGET_DIR)/usr/lib/php/build
 	rm -f $(TARGET_DIR)/usr/bin/phpize
 	$(INSTALL) -D -m 0755 $(PHP_DIR)/php.ini-production \
 		$(TARGET_DIR)/etc/php.ini
-- 
2.1.4
