From: Floris Bos <bos@je-eigen-domein.nl>
Date: Mon, 18 May 2015 21:52:04 +0200
Subject: [Buildroot] [PATCH 6/6] php: fpm: remove sample status page
In-Reply-To: <1431978724-25081-1-git-send-email-bos@je-eigen-domein.nl>
References: <1431978724-25081-1-git-send-email-bos@je-eigen-domein.nl>
Message-ID: <1431978724-25081-6-git-send-email-bos@je-eigen-domein.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

php-fpm installs a sample status page to $datadir/fpm/status.html
It is not of any use in that directory, so remove it from target.
If someone wants to use it, he can copy it to webroot manually.

Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
---
 package/php/php.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/php/php.mk b/package/php/php.mk
index 2fcf783..af90b03 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -276,6 +276,8 @@ define PHP_INSTALL_FPM_CONF
 	$(INSTALL) -D -m 0644 package/php/php-fpm.conf \
 		$(TARGET_DIR)/etc/php-fpm.conf
 	rm -f $(TARGET_DIR)/etc/php-fpm.conf.default
+	# remove unused sample status page /usr/php/php/fpm/status.html
+	rm -rf $(TARGET_DIR)/usr/php
 endef
 
 PHP_POST_INSTALL_TARGET_HOOKS += PHP_INSTALL_FPM_CONF
-- 
2.1.4
