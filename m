From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 1 May 2012 10:56:45 +0200
Subject: [Buildroot] [git commit] cups: fixup php extension build
Message-ID: <20120501090031.B398696C44@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1069f8276585131cef852603e93b883e16f11058
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/cups/cups.mk |   14 ++++----------
 1 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index 2357306..c19ae0c 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -28,17 +28,11 @@ ifeq ($(BR2_PACKAGE_XORG7),y)
 endif
 
 ifeq ($(BR2_PACKAGE_PHP),y)
-	CUPS_CFLAGS += 		-I$(STAGING_DIR)/usr/include/php
-	CUPS_CFLAGS += 		-I$(STAGING_DIR)/usr/include/php/main
-	CUPS_CFLAGS += 		-I$(STAGING_DIR)/usr/include/php/regex
-	CUPS_CFLAGS += 		-I$(STAGING_DIR)/usr/include/php/TSRM
-	CUPS_CFLAGS += 		-I$(STAGING_DIR)/usr/include/php/Zend
-	CUPS_CFLAGS += 		-I$(STAGING_DIR)/usr/include/php/ext
-	CUPS_CONF_ENV +=	ac_cv_path_php=$(STAGING_DIR)/usr/bin/php
-	CUPS_CONF_OPT +=	--with-php
-	CUPS_DEPENDENCIES +=	php
+	CUPS_CONF_ENV += ac_cv_path_PHPCONFIG=$(STAGING_DIR)/usr/bin/php-config
+	CUPS_CONF_OPT += --with-php
+	CUPS_DEPENDENCIES += php
 else
-	CUPS_CONF_OPT +=	--without-php
+	CUPS_CONF_OPT += --without-php
 endif
 
 ifeq ($(BR2_PACKAGE_PYTHON),y)
