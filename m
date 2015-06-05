From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  4 Jun 2015 21:28:47 -0300
Subject: [Buildroot] [PATCH] gcc/gcc-final: install libatomic via
	HOST_GCC_FINAL_GCC_LIB_DIR
Message-ID: <1433464127-10834-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Otherwise it's a no-op for sh4.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gcc/gcc-final/gcc-final.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index 8d7009b..16bf4ee 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -131,9 +131,9 @@ endef
 HOST_GCC_FINAL_POST_INSTALL_HOOKS += HOST_GCC_FINAL_INSTALL_LIBGCC
 
 define HOST_GCC_FINAL_INSTALL_LIBATOMIC
-	-cp -dpf $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/lib*/libatomic* \
+	-cp -dpf $(HOST_GCC_FINAL_GCC_LIB_DIR)/libatomic* \
 		$(STAGING_DIR)/lib/
-	-cp -dpf $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/lib*/libatomic* \
+	-cp -dpf $(HOST_GCC_FINAL_GCC_LIB_DIR)/libatomic* \
 		$(TARGET_DIR)/lib/
 endef
 
-- 
2.3.6
