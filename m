From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 May 2015 21:41:10 +0200
Subject: [Buildroot] [git commit] php: enable opcache extension in php.ini
	if selected
Message-ID: <20150519200603.B18D781DCF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ccbeeb8a8cf1157eaf01550d4d6b479883bbcae7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a line to load the opcache extension in php.ini, at the
bottom of the "dynamic extensions" section.

Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php/php.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/php/php.mk b/package/php/php.mk
index bc3794a..6e0e216 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -301,6 +301,9 @@ define PHP_INSTALL_FIXUP
 		$(TARGET_DIR)/etc/php.ini
 	$(SED) 's%;date.timezone =.*%date.timezone = $(PHP_LOCALTIME)%' \
 		$(TARGET_DIR)/etc/php.ini
+	$(if $(BR2_PACKAGE_PHP_EXT_OPCACHE),
+		$(SED) '/;extension=php_xsl.dll/azend_extension=opcache.so' \
+		$(TARGET_DIR)/etc/php.ini)
 endef
 
 PHP_POST_INSTALL_TARGET_HOOKS += PHP_INSTALL_FIXUP
