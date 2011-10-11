From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 11 Oct 2011 09:27:25 +0200
Subject: [Buildroot] [git commit] neon: cleanup
Message-ID: <20111011075632.11D3A8E2F8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=66e09abc57f88bfea7bebd50b9dff7d56e99689e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Whitespace fixes / removal of redundant lines. No functional change.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/neon/neon.mk |   55 ++++++++++++++++++++++++-------------------------
 1 files changed, 27 insertions(+), 28 deletions(-)

diff --git a/package/neon/neon.mk b/package/neon/neon.mk
index 95664d7..272d5e0 100644
--- a/package/neon/neon.mk
+++ b/package/neon/neon.mk
@@ -3,46 +3,45 @@
 # neon
 #
 #############################################################
-NEON_VERSION:=0.29.6
-NEON_SITE:=http://www.webdav.org/neon/
-NEON_INSTALL_STAGING:=YES
-NEON_CONF_OPT:=--without-gssapi --disable-rpath
+NEON_VERSION= 0.29.6
+NEON_SITE = http://www.webdav.org/neon/
+NEON_INSTALL_STAGING = YES
+NEON_CONF_OPT = --without-gssapi --disable-rpath
 
-NEON_DEPENDENCIES:=host-pkg-config
+NEON_DEPENDENCIES = host-pkg-config
 
-ifeq ($(BR2_PACKAGE_NEON_LIBXML2),y)
-NEON_CONF_OPT+=--with-libxml2=yes
-NEON_CONF_OPT+=--with-expat=no
-NEON_CONF_ENV+=ac_cv_prog_XML2_CONFIG=$(STAGING_DIR)/usr/bin/xml2-config
-NEON_DEPENDENCIES+=libxml2
-endif
 ifeq ($(BR2_PACKAGE_NEON_ZLIB),y)
-NEON_CONF_OPT+=--with-zlib=$(STAGING_DIR)
-NEON_DEPENDENCIES+=zlib
+NEON_CONF_OPT += --with-zlib=$(STAGING_DIR)
+NEON_DEPENDENCIES += zlib
 else
-NEON_CONF_OPT+=--without-zlib
+NEON_CONF_OPT += --without-zlib
 endif
+
 ifeq ($(BR2_PACKAGE_NEON_SSL),y)
-NEON_CONF_OPT+=--with-ssl
-NEON_DEPENDENCIES+=openssl
+NEON_CONF_OPT += --with-ssl
+NEON_DEPENDENCIES += openssl
 else
-NEON_CONF_OPT+=--without-ssl
+NEON_CONF_OPT += --without-ssl
 endif
+
 ifeq ($(BR2_PACKAGE_NEON_EXPAT),y)
-NEON_CONF_OPT+=--with-expat=$(STAGING_DIR)/usr/lib/libexpat.la
-NEON_CONF_OPT+=--with-libxml2=no
-NEON_DEPENDENCIES+=expat
-endif
-ifeq ($(BR2_PACKAGE_NEON_NOXML),y)
-# webdav needs xml support
-NEON_CONF_OPT+=--disable-webdav
+NEON_CONF_OPT += --with-expat=$(STAGING_DIR)/usr/lib/libexpat.la
+NEON_DEPENDENCIES += expat
+else
+NEON_CONF_OPT += --with-expat=no
 endif
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
-NEON_CONF_OPT+=--with-ssl
-NEON_DEPENDENCIES+=openssl
+ifeq ($(BR2_PACKAGE_NEON_LIBXML2),y)
+NEON_CONF_OPT += --with-libxml2=yes
+NEON_CONF_ENV += ac_cv_prog_XML2_CONFIG=$(STAGING_DIR)/usr/bin/xml2-config
+NEON_DEPENDENCIES += libxml2
 else
-NEON_CONF_OPT+=--without-ssl
+NEON_CONF_OPT += --with-libxml2=no
+endif
+
+ifeq ($(BR2_PACKAGE_NEON_NOXML),y)
+# webdav needs xml support
+NEON_CONF_OPT += --disable-webdav
 endif
 
 define NEON_REMOVE_CONFIG_SCRIPTS
