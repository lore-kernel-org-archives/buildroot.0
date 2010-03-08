From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump encodings to 1.0.3
Message-ID: <20100308133709.23B6A776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=f6b3f5f7221fd87101923a2df550736756627d4c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xfont_encodings/Config.in            |    2 +-
 .../xfont_encodings-1.0.2-mkfontscale-bug.patch    |   21 --------------------
 package/x11r7/xfont_encodings/xfont_encodings.mk   |    2 +-
 3 files changed, 2 insertions(+), 23 deletions(-)
 delete mode 100644 package/x11r7/xfont_encodings/xfont_encodings-1.0.2-mkfontscale-bug.patch

diff --git a/package/x11r7/xfont_encodings/Config.in b/package/x11r7/xfont_encodings/Config.in
index b6e142c..5b22eda 100644
--- a/package/x11r7/xfont_encodings/Config.in
+++ b/package/x11r7/xfont_encodings/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_XFONT_ENCODINGS
 	bool "encodings"
 	help
-	  encodings 1.0.2
+	  encodings 1.0.3
 	  No description available
diff --git a/package/x11r7/xfont_encodings/xfont_encodings-1.0.2-mkfontscale-bug.patch b/package/x11r7/xfont_encodings/xfont_encodings-1.0.2-mkfontscale-bug.patch
deleted file mode 100644
index 5075549..0000000
--- a/package/x11r7/xfont_encodings/xfont_encodings-1.0.2-mkfontscale-bug.patch
+++ /dev/null
@@ -1,21 +0,0 @@
---- encodings-1.0.2/large/Makefile.am.orig	2007-06-08 16:28:01.000000000 +0200
-+++ encodings-1.0.2/large/Makefile.am	2007-06-08 16:28:15.000000000 +0200
-@@ -37,6 +37,6 @@
- 	@GZIP@ -c < $< > $@
- 
- encodings.dir: $(DATA_FILES)
--	@MKFONTSCALE@ -b -s -l -n -r -p $(encodingsdir) -e . .
-+	$(MKFONTSCALE) -b -s -l -n -r -p $(encodingsdir) -e . .
- 
- encodings_DATA = $(DATA_FILES) encodings.dir
---- encodings-1.0.2/Makefile.am.orig	2007-06-08 16:28:36.000000000 +0200
-+++ encodings-1.0.2/Makefile.am	2007-06-08 16:28:43.000000000 +0200
-@@ -56,7 +56,7 @@
- 	@GZIP@ -c < $< > $@
- 
- encodings.dir: $(DATA_FILES)
--	@MKFONTSCALE@ -b -s -l -n -r -p $(encodingsdir) -e . -e large .
-+	$(MKFONTSCALE) -b -s -l -n -r -p $(encodingsdir) -e . -e large .
- 
- encodings_DATA = $(DATA_FILES) encodings.dir
- 
diff --git a/package/x11r7/xfont_encodings/xfont_encodings.mk b/package/x11r7/xfont_encodings/xfont_encodings.mk
index 9097735..20a192b 100644
--- a/package/x11r7/xfont_encodings/xfont_encodings.mk
+++ b/package/x11r7/xfont_encodings/xfont_encodings.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XFONT_ENCODINGS_VERSION = 1.0.2
+XFONT_ENCODINGS_VERSION = 1.0.3
 XFONT_ENCODINGS_SOURCE = encodings-$(XFONT_ENCODINGS_VERSION).tar.bz2
 XFONT_ENCODINGS_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_ENCODINGS_AUTORECONF = NO
-- 
1.6.3.3
