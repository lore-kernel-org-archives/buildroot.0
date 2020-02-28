From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 28 Feb 2020 23:12:36 +0100
Subject: [Buildroot] [PATCH v2,
 3/3] package/libarchive: add zstd optional dependency
In-Reply-To: <20200228221236.1982482-1-fontaine.fabrice@gmail.com>
References: <20200228221236.1982482-1-fontaine.fabrice@gmail.com>
Message-ID: <20200228221236.1982482-3-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

zstd is available since version 3.3.3 and
https://github.com/libarchive/libarchive/commit/26838cf5c17642f57192753cc5c3880b16b65ba3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libarchive/libarchive.mk | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index d07f0776a6..c3fe63526a 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -116,6 +116,12 @@ else
 LIBARCHIVE_CONF_OPTS += --without-zlib
 endif
 
+ifeq ($(BR2_PACKAGE_ZSTD),y)
+LIBARCHIVE_DEPENDENCIES += zstd
+else
+LIBARCHIVE_CONF_OPTS += --without-zstd
+endif
+
 # libarchive requires LZMA with thread support in the toolchain
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS)$(BR2_PACKAGE_XZ),yy)
 LIBARCHIVE_DEPENDENCIES += xz
@@ -141,7 +147,8 @@ HOST_LIBARCHIVE_CONF_OPTS = \
 	--without-mbedtls \
 	--without-nettle \
 	--without-openssl \
-	--without-lzma
+	--without-lzma \
+	--without-zstd
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.25.0
