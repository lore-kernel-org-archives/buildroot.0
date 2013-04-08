From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon,  8 Apr 2013 18:50:14 +0200
Subject: [Buildroot] [PATCH v2 1/3] post-build: show each script filename
	before execution
In-Reply-To: <1365439816-6935-1-git-send-email-luca@lucaceresoli.net>
References: <1365439816-6935-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1365439816-6935-2-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This also simplifies code by removing the ifneq/endif clauses.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 Makefile |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index c95bb1e..75f0f0c 100644
--- a/Makefile
+++ b/Makefile
@@ -509,11 +509,9 @@ endif
 			$${dir}/ $(TARGET_DIR); \
 	done
 
-ifneq ($(BR2_ROOTFS_POST_BUILD_SCRIPT),"")
-	@$(call MESSAGE,"Executing post-build script\(s\)")
 	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_BUILD_SCRIPT)), \
+		$(call MESSAGE,"Executing  post-build script $(s)"); \
 		$(s) $(TARGET_DIR)$(sep))
-endif
 
 ifeq ($(BR2_ENABLE_LOCALE_PURGE),y)
 LOCALE_WHITELIST=$(BUILD_DIR)/locales.nopurge
-- 
1.7.10.4
