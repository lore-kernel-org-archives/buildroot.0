From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 25 Apr 2020 21:21:35 +0200
Subject: [Buildroot] [git commit] package/libarchive: add zstd optional
 dependency
Message-ID: <20200425190707.9EDFC9002A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4bcc34446485d27efd41de70a86355a0e3798838
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

zstd is available since version 3.3.3 and
https://github.com/libarchive/libarchive/commit/26838cf5c17642f57192753cc5c3880b16b65ba3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libarchive/libarchive.mk | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index 20863f9ba9..516d929763 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -111,6 +111,13 @@ else
 LIBARCHIVE_CONF_OPTS += --without-zlib
 endif
 
+ifeq ($(BR2_PACKAGE_ZSTD),y)
+LIBARCHIVE_CONF_OPTS += --with-zstd
+LIBARCHIVE_DEPENDENCIES += zstd
+else
+LIBARCHIVE_CONF_OPTS += --without-zstd
+endif
+
 # libarchive requires LZMA with thread support in the toolchain
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS)$(BR2_PACKAGE_XZ),yy)
 LIBARCHIVE_DEPENDENCIES += xz
@@ -143,7 +150,8 @@ HOST_LIBARCHIVE_CONF_OPTS = \
 	--without-mbedtls \
 	--without-nettle \
 	--without-openssl \
-	--without-lzma
+	--without-lzma \
+	--without-zstd
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
