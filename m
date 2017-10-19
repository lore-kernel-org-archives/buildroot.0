From: Adam Duskett <aduskett@gmail.com>
Date: Thu, 19 Oct 2017 17:46:03 -0400
Subject: [Buildroot] [PATCH 1/1] setools: change sepol library directory
Message-ID: <20171019214603.5402-1-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

setools currently points the libsepol library directory to
$(STAGING_DIR)/lib/ when it should be $(STAGING_DIR)/usr/lib

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
 package/setools/setools.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/setools/setools.mk b/package/setools/setools.mk
index 80d58235d3..8b93ccf45e 100644
--- a/package/setools/setools.mk
+++ b/package/setools/setools.mk
@@ -24,7 +24,7 @@ endif
 define SETOOLS_FIX_SETUP
 	# By default, setup.py will look for libsepol.a in the host machines
 	# /usr/lib directory. This needs to be changed to the staging directory.
-	$(SED) "s at base_lib_dirs =.*@base_lib_dirs = ['$(STAGING_DIR)/lib']@g" \
+	$(SED) "s at base_lib_dirs =.*@base_lib_dirs = ['$(STAGING_DIR)/usr/lib']@g" \
 		$(@D)/setup.py
 endef
 SETOOLS_POST_PATCH_HOOKS += SETOOLS_FIX_SETUP
-- 
2.13.6
