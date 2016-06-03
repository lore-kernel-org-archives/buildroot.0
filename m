From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Jun 2016 14:25:42 +0200
Subject: [Buildroot] [git commit] webp: minor improvements
Message-ID: <20160603124259.12E6A805E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=82c19697b4aa9a761461024228087089e4bb8304
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Following commit e47638f8dca29b0d9b729edbaeaa11a08f9957fa, this commit
makes a few additional cosmetic improvements to the webp package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/webp/Config.in | 11 +++++++----
 package/webp/webp.mk   |  2 ++
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/package/webp/Config.in b/package/webp/Config.in
index 7c4722f..646eb9e 100644
--- a/package/webp/Config.in
+++ b/package/webp/Config.in
@@ -6,10 +6,13 @@ config BR2_PACKAGE_WEBP
 
 	  https://developers.google.com/speed/webp/
 
+if BR2_PACKAGE_WEBP
+
 config BR2_PACKAGE_WEBP_DEMUX
 	bool "webpdemux"
-	depends on BR2_PACKAGE_WEBP
 	help
-	  "Demux" is a part of WebPMux for extraction and manipulation of an
-	  extended format WebP file, which can have features like color profile,
-	  metadata and animation.
+	  Demux is a part of WebPMux for extraction and manipulation
+	  of an extended format WebP file, which can have features
+	  like color profile, metadata and animation.
+
+endif
diff --git a/package/webp/webp.mk b/package/webp/webp.mk
index b609024..8d9ca8f 100644
--- a/package/webp/webp.mk
+++ b/package/webp/webp.mk
@@ -19,6 +19,8 @@ WEBP_CONF_OPTS += \
 
 ifeq ($(BR2_PACKAGE_WEBP_DEMUX),y)
 WEBP_CONF_OPTS += --enable-libwebpdemux
+else
+WEBP_CONF_OPTS += --disable-libwebpdemux
 endif
 
 ifeq ($(BR2_PACKAGE_LIBPNG),y)
