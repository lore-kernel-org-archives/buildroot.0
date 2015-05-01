From: Floris Bos <bos@je-eigen-domein.nl>
Date: Fri,  1 May 2015 20:12:32 +0200
Subject: [Buildroot] [PATCH] php.ini: set date.timezone to UTC
Message-ID: <1430503955-24928-1-git-send-email-bos@je-eigen-domein.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Prevent a warning being logged each time a PHP date/time method is
used by setting UTC as (default) timezone in php.ini

Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
---
 package/php/php.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/php/php.mk b/package/php/php.mk
index 3b9a117..7bd3f63 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -288,6 +288,7 @@ define PHP_INSTALL_FIXUP
 	rm -f $(TARGET_DIR)/usr/bin/phpize
 	$(INSTALL) -D -m 0755 $(PHP_DIR)/php.ini-production \
 		$(TARGET_DIR)/etc/php.ini
+	$(SED) 's/;date.timezone =/date.timezone = UTC/' $(TARGET_DIR)/etc/php.ini
 endef
 
 PHP_POST_INSTALL_TARGET_HOOKS += PHP_INSTALL_FIXUP
-- 
2.1.4
