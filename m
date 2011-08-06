From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 6 Aug 2011 12:06:41 +0200
Subject: [Buildroot] [git commit] xfont_font-misc-misc: remove mapfiles
	workaround
Message-ID: <20110806100732.D1E388B7F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=2c85cb9308ed907a8a8e487be8c7ab971a1fb126
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Not needed anymore after the recent pkg-config mapfiles fix.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../xfont_font-misc-misc/xfont_font-misc-misc.mk   |    6 ------
 1 files changed, 0 insertions(+), 6 deletions(-)

diff --git a/package/x11r7/xfont_font-misc-misc/xfont_font-misc-misc.mk b/package/x11r7/xfont_font-misc-misc/xfont_font-misc-misc.mk
index 64e14d2..f6a5564 100644
--- a/package/x11r7/xfont_font-misc-misc/xfont_font-misc-misc.mk
+++ b/package/x11r7/xfont_font-misc-misc/xfont_font-misc-misc.mk
@@ -12,11 +12,5 @@ XFONT_FONT_MISC_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(
 XFONT_FONT_MISC_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_MISC_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
-define XFONT_FONT_MISC_MISC_MAPFILES_PATH_FIX
-	$(SED) 's|UTIL_DIR = |UTIL_DIR = $(STAGING_DIR)|' $(@D)/Makefile
-endef
-
-XFONT_FONT_MISC_MISC_POST_CONFIGURE_HOOKS += XFONT_FONT_MISC_MISC_MAPFILES_PATH_FIX
-
 $(eval $(call AUTOTARGETS,package/x11r7,xfont_font-misc-misc))
 
-- 
1.7.3.4
