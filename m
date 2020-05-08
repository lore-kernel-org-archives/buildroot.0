From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 8 May 2020 12:05:56 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/libarchive: add
 zstd optional dependency
Message-ID: <20200508143236.34C1891051@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=beb89fd77f2425b68bb89ee56463041ddbb43570
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

zstd is available since version 3.3.3 and
https://github.com/libarchive/libarchive/commit/26838cf5c17642f57192753cc5c3880b16b65ba3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 4bcc34446485d27efd41de70a86355a0e3798838)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libarchive/libarchive.mk | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index b98ec32af1..99360eaf3c 100644
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
@@ -136,7 +143,8 @@ HOST_LIBARCHIVE_CONF_OPTS = \
 	--without-mbedtls \
 	--without-nettle \
 	--without-openssl \
-	--without-lzma
+	--without-lzma \
+	--without-zstd
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
