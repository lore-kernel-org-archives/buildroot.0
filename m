From: Benjamin Calderon <benj.calderon@gmail.com>
Date: Fri, 21 Sep 2018 11:15:15 -0400
Subject: [Buildroot] [PATCH 1/1] font-awesome compatible with fontconfig
 [FIXED]
Message-ID: <20180921151515.5128-1-benj.calderon@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit installs font-awesome in the standard fonts directory
making it available systemwide.

The extra folders (css, less, scss) together with the webfonts (*.eot,
*.woff*, etc) are also left out since they are useless in this context.

CSS and webfonts files are usually delivered via CDN or need to be in
the webroot of an http server in order to serve any purpose thus having those
files installed with this package is pointless.

Thanks to baruch for his technical critique.

Signed-off-by: Benjamin Calderon <benj.calderon@gmail.com>
---
 package/font-awesome/font-awesome.mk | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/font-awesome/font-awesome.mk b/package/font-awesome/font-awesome.mk
index f39401041a..1bf41c6020 100644
--- a/package/font-awesome/font-awesome.mk
+++ b/package/font-awesome/font-awesome.mk
@@ -6,13 +6,11 @@
 
 FONT_AWESOME_VERSION = v4.7.0
 FONT_AWESOME_SITE = $(call github,FortAwesome,Font-Awesome,$(FONT_AWESOME_VERSION))
-FONT_AWESOME_LICENSE = OFL-1.1 (font), MIT (CSS, LESS and Sass files)
-FONT_AWESOME_DIRECTORIES_LIST = css fonts less scss
+FONT_AWESOME_LICENSE = OFL-1.1
 
 define FONT_AWESOME_INSTALL_TARGET_CMDS
-	mkdir -p $(TARGET_DIR)/usr/share/font-awesome/
-	$(foreach d,$(FONT_AWESOME_DIRECTORIES_LIST),\
-		cp -dpfr $(@D)/$(d) $(TARGET_DIR)/usr/share/font-awesome$(sep))
+	mkdir -p $(TARGET_DIR)/usr/share/fonts/font-awesome/
+	cp $(@D)/fonts/FontAwesome.otf $(TARGET_DIR)/usr/share/fonts/font-awesome/FontAwesome.otf
 endef
 
 $(eval $(generic-package))
-- 
2.19.0
