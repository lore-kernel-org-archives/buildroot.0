From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  9 Mar 2016 13:25:22 -0300
Subject: [Buildroot] [PATCH] icu: remove dev files
Message-ID: <1457540722-19623-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove files that aren't used for runtime purposes.

Size savings delta +450 KB.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/icu/icu.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/icu/icu.mk b/package/icu/icu.mk
index b4574e5..68ea1ff 100644
--- a/package/icu/icu.mk
+++ b/package/icu/icu.mk
@@ -44,5 +44,12 @@ endef
 ICU_POST_PATCH_HOOKS += ICU_COPY_CUSTOM_DATA
 endif
 
+define ICU_REMOVE_DEV_FILES
+	rm -f $(addprefix $(TARGET_DIR)/usr/bin/,derb genbrk gencfu gencnval gendict genrb icuinfo makeconv uconv)
+	rm -f $(addprefix $(TARGET_DIR)/usr/sbin/,genccode gencmn gennorm2 gensprep icupkg)
+	rm -rf $(TARGET_DIR)/usr/share/icu
+endef
+ICU_POST_INSTALL_TARGET_HOOKS += ICU_REMOVE_DEV_FILES
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.4.10
