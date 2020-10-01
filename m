From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu,  1 Oct 2020 22:26:26 +0200
Subject: [Buildroot] [PATCH 3/3] package/freetype: add brotli optional
 dependency
In-Reply-To: <20201001202626.1354496-1-fontaine.fabrice@gmail.com>
References: <20201001202626.1354496-1-fontaine.fabrice@gmail.com>
Message-ID: <20201001202626.1354496-3-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

brotli is an optional dependency (enabled by default) since version
2.10.2 and
https://git.savannah.gnu.org/cgit/freetype/freetype2.git/commit/?id=9443a1bc3e6cfa315db976ff80f6c5e91b12b387

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/freetype/freetype.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index b0aba78c51..e6463c30b6 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -16,6 +16,7 @@ FREETYPE_CONFIG_SCRIPTS = freetype-config
 
 HOST_FREETYPE_DEPENDENCIES = host-pkgconf
 HOST_FREETYPE_CONF_OPTS = \
+	--without-brotli \
 	--without-bzip2 \
 	--without-harfbuzz \
 	--without-png \
@@ -32,6 +33,13 @@ else
 FREETYPE_CONF_OPTS += --without-zlib
 endif
 
+ifeq ($(BR2_PACKAGE_BROTLI),y)
+FREETYPE_DEPENDENCIES += brotli
+FREETYPE_CONF_OPTS += --with-brotli
+else
+FREETYPE_CONF_OPTS += --without-brotli
+endif
+
 ifeq ($(BR2_PACKAGE_BZIP2),y)
 FREETYPE_DEPENDENCIES += bzip2
 FREETYPE_CONF_OPTS += --with-bzip2
-- 
2.28.0
