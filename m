From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 28 Feb 2020 23:12:35 +0100
Subject: [Buildroot] [PATCH v2,
 2/3] package/libarchive: add lz4 optional dependency
In-Reply-To: <20200228221236.1982482-1-fontaine.fabrice@gmail.com>
References: <20200228221236.1982482-1-fontaine.fabrice@gmail.com>
Message-ID: <20200228221236.1982482-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

lz4 is available since version 3.2.0 and
https://github.com/libarchive/libarchive/commit/724f3f918e509ddca60ce62fad696d7621d3623d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libarchive/libarchive.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index b7ae5fb0cf..d07f0776a6 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -78,6 +78,12 @@ else
 LIBARCHIVE_CONF_OPTS += --without-xml2
 endif
 
+ifeq ($(BR2_PACKAGE_LZ4),y)
+LIBARCHIVE_DEPENDENCIES += lz4
+else
+LIBARCHIVE_CONF_OPTS += --without-lz4
+endif
+
 ifeq ($(BR2_PACKAGE_LZO),y)
 LIBARCHIVE_DEPENDENCIES += lzo
 else
@@ -130,6 +136,7 @@ HOST_LIBARCHIVE_CONF_OPTS = \
 	--without-expat \
 	--without-libiconv-prefix \
 	--without-xml2 \
+	--without-lz4 \
 	--without-lzo2 \
 	--without-mbedtls \
 	--without-nettle \
-- 
2.25.0
