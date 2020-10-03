From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 Oct 2020 08:33:46 +0200
Subject: [Buildroot] [git commit branch/2020.08.x] package/freetype: add
 brotli optional dependency
Message-ID: <20201003064010.9B44E8FBB1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=96bd44e093ef066ed0694dc5b4df3702cd757a81
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

brotli is an optional dependency (enabled by default) since version
2.10.2 and
https://git.savannah.gnu.org/cgit/freetype/freetype2.git/commit/?id=9443a1bc3e6cfa315db976ff80f6c5e91b12b387

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 81ada4dff4334a6fbb7ae3a547de4cf6aab54a91)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
