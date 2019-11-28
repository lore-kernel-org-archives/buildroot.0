From: Pascal de Bruijn <p.debruijn@unilogic.nl>
Date: Thu, 28 Nov 2019 14:03:16 +0100
Subject: [Buildroot] [PATCH] package/php: remove sample config in new
 location
Message-ID: <20191128130316.6004-1-p.debruijn@unilogic.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Pascal de Bruijn <pmjdebruijn@pcode.nl>

the upstream php-fpm sample configuration is placed in

  /etc/php-fpm.d/www.conf.default

in recent version of php, so adjust the build cleanup
accordingly

Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
---
 package/php/php.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/php/php.mk b/package/php/php.mk
index 007b8a6..c83f04a 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -346,7 +346,7 @@ endef
 define PHP_INSTALL_FPM_CONF
 	$(INSTALL) -D -m 0644 package/php/php-fpm.conf \
 		$(TARGET_DIR)/etc/php-fpm.conf
-	rm -f $(TARGET_DIR)/etc/php-fpm.conf.default
+	rm -rf $(TARGET_DIR)/etc/php-fpm.d
 	# remove unused sample status page /usr/php/php/fpm/status.html
 	rm -rf $(TARGET_DIR)/usr/php
 endef
-- 
2.7.4
