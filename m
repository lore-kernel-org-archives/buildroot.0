From: Floris Bos <bos@je-eigen-domein.nl>
Date: Mon, 18 May 2015 21:52:01 +0200
Subject: [Buildroot] [PATCH 3/6] php: enable opcache extension in php.ini if
	selected
In-Reply-To: <1431978724-25081-1-git-send-email-bos@je-eigen-domein.nl>
References: <1431978724-25081-1-git-send-email-bos@je-eigen-domein.nl>
Message-ID: <1431978724-25081-3-git-send-email-bos@je-eigen-domein.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a line to load the opcache extension in php.ini, at the
bottom of the "dynamic extensions" section.

Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
---
 package/php/php.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/php/php.mk b/package/php/php.mk
index c36a80c..65d5015 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -296,6 +296,9 @@ define PHP_INSTALL_FIXUP
 		$(TARGET_DIR)/etc/php.ini
 	$(SED) 's%;date.timezone =.*%date.timezone = $(PHP_LOCALTIME)%' \
 		$(TARGET_DIR)/etc/php.ini
+	$(if $(BR2_PACKAGE_PHP_EXT_OPCACHE),
+		$(SED) '/;extension=php_xsl.dll/azend_extension=opcache.so' \
+		$(TARGET_DIR)/etc/php.ini)
 endef
 
 PHP_POST_INSTALL_TARGET_HOOKS += PHP_INSTALL_FIXUP
-- 
2.1.4
