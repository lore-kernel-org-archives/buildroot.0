From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 25 Feb 2020 17:33:43 +0100
Subject: [Buildroot] [PATCH/next v2,
 1/1] package/font-awesome: make it compatible with fontconfig
Message-ID: <20200225163343.120504-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit installs font-awesome in the standard fonts directory
making it available systemwide.

Thanks to baruch for his technical critique.
Signed-off-by: Benjamin Calderon <benj.calderon@gmail.com>
Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Arnout Vandecappelle):
 - Keep only install of otf file and don't remove install of other files

 package/font-awesome/font-awesome.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/font-awesome/font-awesome.mk b/package/font-awesome/font-awesome.mk
index 666346be0e..85e5a239c5 100644
--- a/package/font-awesome/font-awesome.mk
+++ b/package/font-awesome/font-awesome.mk
@@ -10,6 +10,8 @@ FONT_AWESOME_LICENSE = OFL-1.1 (font), MIT (CSS, LESS and Sass files)
 FONT_AWESOME_DIRECTORIES_LIST = css fonts less scss
 
 define FONT_AWESOME_INSTALL_TARGET_CMDS
+	mkdir -p $(TARGET_DIR)/usr/share/fonts/font-awesome/
+	cp $(@D)/fonts/*.otf $(TARGET_DIR)/usr/share/fonts/font-awesome
 	mkdir -p $(TARGET_DIR)/usr/share/font-awesome/
 	$(foreach d,$(FONT_AWESOME_DIRECTORIES_LIST),\
 		cp -dpfr $(@D)/$(d) $(TARGET_DIR)/usr/share/font-awesome$(sep))
-- 
2.25.0
