From: Simon Dawson <spdawson@gmail.com>
Date: Wed, 26 Feb 2014 17:59:12 +0000
Subject: [Buildroot] [PATCH] giblib: remove unnecessary autoreconf options
Message-ID: <1393437552-21879-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The default $(PKG)_AUTORECONF_OPT already includes the -i flag,
so there is no point in specifying this in the package makefile.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/giblib/giblib.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/giblib/giblib.mk b/package/giblib/giblib.mk
index b955943..6d1ebb8 100644
--- a/package/giblib/giblib.mk
+++ b/package/giblib/giblib.mk
@@ -9,7 +9,6 @@ GIBLIB_SITE = http://linuxbrit.co.uk/downloads/
 GIBLIB_INSTALL_STAGING = YES
 GIBLIB_DEPENDENCIES = imlib2
 GIBLIB_AUTORECONF = YES
-GIBLIB_AUTORECONF_OPT = --install
 GIBLIB_CONF_OPT = --with-imlib2-prefix=$(STAGING_DIR)/usr \
 		  --with-imlib2-exec-prefix=$(STAGING_DIR)/usr
 GIBLIB_CONFIG_SCRIPTS = giblib-config
-- 
1.8.3.2
