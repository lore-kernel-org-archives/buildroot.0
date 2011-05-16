From: Vasily Khoruzhick <anarsoul@gmail.com>
Date: Mon, 16 May 2011 22:54:37 +0200
Subject: [Buildroot] [git commit] font-misc-misc: Don't pull fonts encodings
	from host system
Message-ID: <20110516210341.42A078352F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=5276dec0e053c3dfd667281f037fa4221a9d6148
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use encodings from staging dir.

Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../xfont_font-misc-misc/xfont_font-misc-misc.mk   |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/x11r7/xfont_font-misc-misc/xfont_font-misc-misc.mk b/package/x11r7/xfont_font-misc-misc/xfont_font-misc-misc.mk
index f6a5564..64e14d2 100644
--- a/package/x11r7/xfont_font-misc-misc/xfont_font-misc-misc.mk
+++ b/package/x11r7/xfont_font-misc-misc/xfont_font-misc-misc.mk
@@ -12,5 +12,11 @@ XFONT_FONT_MISC_MISC_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) MKFONTSCALE=$(
 XFONT_FONT_MISC_MISC_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) MKFONTSCALE=$(HOST_DIR)/usr/bin/mkfontscale MKFONTDIR=$(HOST_DIR)/usr/bin/mkfontdir install-data
 XFONT_FONT_MISC_MISC_DEPENDENCIES = xfont_font-util host-xfont_font-util host-xapp_mkfontscale host-xapp_mkfontdir host-xapp_bdftopcf
 
+define XFONT_FONT_MISC_MISC_MAPFILES_PATH_FIX
+	$(SED) 's|UTIL_DIR = |UTIL_DIR = $(STAGING_DIR)|' $(@D)/Makefile
+endef
+
+XFONT_FONT_MISC_MISC_POST_CONFIGURE_HOOKS += XFONT_FONT_MISC_MISC_MAPFILES_PATH_FIX
+
 $(eval $(call AUTOTARGETS,package/x11r7,xfont_font-misc-misc))
 
-- 
1.7.3.4
