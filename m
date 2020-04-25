From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 25 Apr 2020 21:21:03 +0200
Subject: [Buildroot] [git commit] package/libarchive: add lz4 optional
 dependency
Message-ID: <20200425190707.95C479004D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9a514c72cd42419b8a8db5092cd705547775a6a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

lz4 is available since version 3.2.0 and
https://github.com/libarchive/libarchive/commit/724f3f918e509ddca60ce62fad696d7621d3623d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libarchive/libarchive.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index 94f974e7d1..20863f9ba9 100644
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
@@ -131,6 +138,7 @@ HOST_LIBARCHIVE_CONF_OPTS = \
 	--without-expat \
 	--without-libiconv-prefix \
 	--without-xml2 \
+	--without-lz4 \
 	--without-lzo2 \
 	--without-mbedtls \
 	--without-nettle \
