From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 30 Jan 2011 21:08:10 +0100
Subject: [Buildroot] [git commit master 1/1] xfont_font-util: remove
	mapfiles workaround
Message-ID: <20110130200835.2034D8E280@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=a52509a4ddabba26b1c927551cea209c4432b693
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Not needed (in fact breaks the build) now pkg-config --variable= does the
right thing.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/xfont_font-util/xfont_font-util.mk |    8 --------
 1 files changed, 0 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xfont_font-util/xfont_font-util.mk b/package/x11r7/xfont_font-util/xfont_font-util.mk
index 3ca51ac..82b66a5 100644
--- a/package/x11r7/xfont_font-util/xfont_font-util.mk
+++ b/package/x11r7/xfont_font-util/xfont_font-util.mk
@@ -13,13 +13,5 @@ XFONT_FONT_UTIL_INSTALL_TARGET = NO
 
 HOST_XFONT_FONT_UTIL_DEPENDENCIES = host-pkg-config
 
-define XFONT_FONT_UTIL_POST_INSTALL_FIXES
-	sed "s,^mapdir=.*,mapdir=$(STAGING_DIR)/usr/share/fonts/X11/util,g" \
-		$(STAGING_DIR)/usr/lib/pkgconfig/fontutil.pc > $(STAGING_DIR)/usr/lib/pkgconfig/fontutil.pc.new
-	mv $(STAGING_DIR)/usr/lib/pkgconfig/fontutil.pc.new $(STAGING_DIR)/usr/lib/pkgconfig/fontutil.pc
-endef
-
-XFONT_FONT_UTIL_POST_INSTALL_STAGING_HOOKS += XFONT_FONT_UTIL_POST_INSTALL_FIXES
-
 $(eval $(call AUTOTARGETS,package/x11r7,xfont_font-util))
 $(eval $(call AUTOTARGETS,package/x11r7,xfont_font-util,host))
-- 
1.7.3.4
