From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 2 Feb 2011 15:54:50 +0100
Subject: [Buildroot] [git commit master 1/1] Makefile: savedefconfig: save
	in O= directory for out-of-tree builds
Message-ID: <20110202145519.3732F8CA55@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=35ac32d15028e65641e343aa13006871ec625c5e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index 3ecc597..9563740 100644
--- a/Makefile
+++ b/Makefile
@@ -603,7 +603,7 @@ defconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 
 savedefconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@mkdir -p $(BUILD_DIR)/buildroot-config
-	@$(COMMON_CONFIG_ENV) $< --savedefconfig=$(TOPDIR)/defconfig $(CONFIG_CONFIG_IN)
+	@$(COMMON_CONFIG_ENV) $< --savedefconfig=$(CONFIG_DIR)/defconfig $(CONFIG_CONFIG_IN)
 
 # check if download URLs are outdated
 source-check: allyesconfig
-- 
1.7.3.4
