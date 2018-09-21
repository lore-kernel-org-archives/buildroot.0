From: Benjamin Calderon <benj.calderon@gmail.com>
Date: Thu, 20 Sep 2018 23:16:41 -0400
Subject: [Buildroot] [PATCH 1/1] font-awesome compatible with fontconfig
Message-ID: <20180921031640.2238-1-benj.calderon@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit installs font-awesome in the standard fonts directory
making it available systemwide.

Signed-off-by: Benjamin Calderon <benj.calderon@gmail.com>
---
 package/font-awesome/font-awesome.mk | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/font-awesome/font-awesome.mk b/package/font-awesome/font-awesome.mk
index f39401041a..b1026b3c4d 100644
--- a/package/font-awesome/font-awesome.mk
+++ b/package/font-awesome/font-awesome.mk
@@ -7,12 +7,10 @@
 FONT_AWESOME_VERSION = v4.7.0
 FONT_AWESOME_SITE = $(call github,FortAwesome,Font-Awesome,$(FONT_AWESOME_VERSION))
 FONT_AWESOME_LICENSE = OFL-1.1 (font), MIT (CSS, LESS and Sass files)
-FONT_AWESOME_DIRECTORIES_LIST = css fonts less scss
 
 define FONT_AWESOME_INSTALL_TARGET_CMDS
-	mkdir -p $(TARGET_DIR)/usr/share/font-awesome/
-	$(foreach d,$(FONT_AWESOME_DIRECTORIES_LIST),\
-		cp -dpfr $(@D)/$(d) $(TARGET_DIR)/usr/share/font-awesome$(sep))
+	mkdir -p $(TARGET_DIR)/usr/share/fonts/font-awesome/
+	cp $(@D)/fonts/FontAwesome.otf $(TARGET_DIR)/usr/share/fonts/font-awesome
 endef
 
 $(eval $(generic-package))
-- 
2.19.0
