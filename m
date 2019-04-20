From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 20 Apr 2019 12:25:27 +0200
Subject: [Buildroot] [PATCH 1/2] package/neon: add NLS dependencies
Message-ID: <20190420102528.8559-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

neon checks for bind_textdomain_codeset

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/neon/neon.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/neon/neon.mk b/package/neon/neon.mk
index 1b8eb368c2..6b9e90d8d6 100644
--- a/package/neon/neon.mk
+++ b/package/neon/neon.mk
@@ -11,7 +11,7 @@ NEON_LICENSE_FILES = src/COPYING.LIB test/COPYING README
 NEON_INSTALL_STAGING = YES
 NEON_CONF_OPTS = --without-gssapi --disable-rpath
 NEON_CONFIG_SCRIPTS = neon-config
-NEON_DEPENDENCIES = host-pkgconf
+NEON_DEPENDENCIES = host-pkgconf $(TARGET_NLS_DEPENDENCIES)
 
 ifeq ($(BR2_PACKAGE_NEON_ZLIB),y)
 NEON_CONF_OPTS += --with-zlib=$(STAGING_DIR)
-- 
2.20.1
