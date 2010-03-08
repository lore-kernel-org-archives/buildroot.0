From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump font-util to 1.1.1
Message-ID: <20100308133651.62774776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=1d3a4763864b63e45e0374e17d61e9af08b037cf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xfont_font-util/Config.in          |    2 +-
 package/x11r7/xfont_font-util/post-install.sh    |    2 +-
 package/x11r7/xfont_font-util/xfont_font-util.mk |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xfont_font-util/Config.in b/package/x11r7/xfont_font-util/Config.in
index 568fb86..932ba29 100644
--- a/package/x11r7/xfont_font-util/Config.in
+++ b/package/x11r7/xfont_font-util/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_XFONT_FONT_UTIL
 	bool "font-util"
 	help
-	  font-util 1.0.1
+	  font-util 1.1.1
 	  No description available
diff --git a/package/x11r7/xfont_font-util/post-install.sh b/package/x11r7/xfont_font-util/post-install.sh
index c4888e2..2cb54da 100755
--- a/package/x11r7/xfont_font-util/post-install.sh
+++ b/package/x11r7/xfont_font-util/post-install.sh
@@ -3,7 +3,7 @@
 	STAGING_DIR=$1
 
 	# fix the fontutil pkgconfig file to cross-compile fonts after fontutil is installed
-	sed "s,^mapdir=.*,mapdir=${STAGING_DIR}/usr/lib/X11/fonts/util,g" \
+	sed "s,^mapdir=.*,mapdir=${STAGING_DIR}/usr/share/fonts/X11/util,g" \
 		${STAGING_DIR}/usr/lib/pkgconfig/fontutil.pc > ${STAGING_DIR}/usr/lib/pkgconfig/fontutil.pc.new
 	mv ${STAGING_DIR}/usr/lib/pkgconfig/fontutil.pc.new ${STAGING_DIR}/usr/lib/pkgconfig/fontutil.pc
 	
diff --git a/package/x11r7/xfont_font-util/xfont_font-util.mk b/package/x11r7/xfont_font-util/xfont_font-util.mk
index cd777af..3f59b17 100644
--- a/package/x11r7/xfont_font-util/xfont_font-util.mk
+++ b/package/x11r7/xfont_font-util/xfont_font-util.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XFONT_FONT_UTIL_VERSION = 1.0.1
+XFONT_FONT_UTIL_VERSION = 1.1.1
 XFONT_FONT_UTIL_SOURCE = font-util-$(XFONT_FONT_UTIL_VERSION).tar.bz2
 XFONT_FONT_UTIL_SITE = http://xorg.freedesktop.org/releases/individual/font
 XFONT_FONT_UTIL_DEPENDENCIES = host-pkg-config
-- 
1.6.3.3
