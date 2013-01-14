From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 14 Jan 2013 11:17:22 +0100
Subject: [Buildroot] [git commit] cairo: script backend needs png
Message-ID: <20130114101736.1458E9A0A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1a5ae24549afa4f374770b58b3008bb5a32e2b9a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.org/results/7b21c60d7ba1a8df8910d104e21d4545cb37a4c6

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/cairo/Config.in |    2 +-
 package/cairo/cairo.mk  |    1 -
 2 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/package/cairo/Config.in b/package/cairo/Config.in
index 3a3fb88..89bd315 100644
--- a/package/cairo/Config.in
+++ b/package/cairo/Config.in
@@ -30,7 +30,7 @@ config BR2_PACKAGE_CAIRO_PNG
 
 config BR2_PACKAGE_CAIRO_SCRIPT
 	bool "script support"
-	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_CAIRO_PNG
 
 config BR2_PACKAGE_CAIRO_SVG
 	bool "svg support"
diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
index 8885ab0..b3fc438 100644
--- a/package/cairo/cairo.mk
+++ b/package/cairo/cairo.mk
@@ -86,7 +86,6 @@ endif
 
 ifeq ($(BR2_PACKAGE_CAIRO_SCRIPT),y)
 	CAIRO_CONF_OPT += --enable-script
-	CAIRO_DEPENDENCIES += zlib
 else
 	CAIRO_CONF_OPT += --disable-script
 endif
