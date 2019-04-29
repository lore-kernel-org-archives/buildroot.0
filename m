From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 29 Apr 2019 18:44:25 +0200
Subject: [Buildroot] [PATCH 1/1] package/subversion: fix build with NLS
Message-ID: <20190429164425.20887-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/098a05b397ba1b05df561b6872b39e17a2bf27df

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/subversion/subversion.mk | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/subversion/subversion.mk b/package/subversion/subversion.mk
index db7e36a638..0e26cfd4be 100644
--- a/package/subversion/subversion.mk
+++ b/package/subversion/subversion.mk
@@ -9,7 +9,14 @@ SUBVERSION_SOURCE = subversion-$(SUBVERSION_VERSION).tar.bz2
 SUBVERSION_SITE = http://mirror.catn.com/pub/apache/subversion
 SUBVERSION_LICENSE = Apache-2.0
 SUBVERSION_LICENSE_FILES = LICENSE
-SUBVERSION_DEPENDENCIES = host-pkgconf apr apr-util expat zlib sqlite
+SUBVERSION_DEPENDENCIES = \
+	host-pkgconf \
+	apr \
+	apr-util \
+	expat \
+	zlib \
+	sqlite \
+	$(TARGET_NLS_DEPENDENCIES)
 SUBVERSION_AUTORECONF = YES
 SUBVERSION_CONF_OPTS = \
 	--with-expat=$(STAGING_DIR)/usr/include:$(STAGING_DIR)/usr/lib: \
@@ -22,5 +29,6 @@ SUBVERSION_CONF_OPTS = \
 	--without-sasl \
 	--without-gnome-keyring \
 	--without-libmagic
+SUBVERSION_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
 
 $(eval $(autotools-package))
-- 
2.20.1
