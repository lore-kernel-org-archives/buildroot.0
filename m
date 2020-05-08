From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 8 May 2020 12:05:26 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/libarchive: add
 lz4 optional dependency
Message-ID: <20200508143236.279FA8D4D8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cebf537751e7fe3689ea1067a62aa9ad7528d1e4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

lz4 is available since version 3.2.0 and
https://github.com/libarchive/libarchive/commit/724f3f918e509ddca60ce62fad696d7621d3623d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 9a514c72cd42419b8a8db5092cd705547775a6a5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libarchive/libarchive.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index 60838eea0a..b98ec32af1 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -79,6 +79,13 @@ else
 LIBARCHIVE_CONF_OPTS += --without-xml2
 endif
 
+ifeq ($(BR2_PACKAGE_LZ4),y)
+LIBARCHIVE_CONF_OPTS += --with-lz4
+LIBARCHIVE_DEPENDENCIES += lz4
+else
+LIBARCHIVE_CONF_OPTS += --without-lz4
+endif
+
 ifeq ($(BR2_PACKAGE_LZO),y)
 LIBARCHIVE_DEPENDENCIES += lzo
 else
@@ -124,6 +131,7 @@ HOST_LIBARCHIVE_CONF_OPTS = \
 	--without-expat \
 	--without-libiconv-prefix \
 	--without-xml2 \
+	--without-lz4 \
 	--without-lzo2 \
 	--without-mbedtls \
 	--without-nettle \
