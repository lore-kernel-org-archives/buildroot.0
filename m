From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 2 Apr 2018 20:00:25 +0200
Subject: [Buildroot] [git commit] sam-ba: use HOST_SAM_BA_DL_DIR instead of
 SAM_BA_DL_DIR
Message-ID: <20180402180453.DF8D4818C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=78b729291507a6a92abf43d388cc29d01c086876
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The infrastructure only provides HOST_SAM_BA_DL_DIR, because this
package is host only. Ideally the infra should provide SAM_BA_DL_DIR,
but it doesn't currently, and that requires more significant changes.

Fixes:

  http://autobuild.buildroot.net/results/a7c76138a1cf068868904acb6678403e3b25fcb3/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sam-ba/sam-ba.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sam-ba/sam-ba.mk b/package/sam-ba/sam-ba.mk
index acc03a3b6b..11dbb7eef0 100644
--- a/package/sam-ba/sam-ba.mk
+++ b/package/sam-ba/sam-ba.mk
@@ -13,7 +13,7 @@ SAM_BA_LICENSE_FILES = doc/license.txt tcl_lib/boards.tcl \
 		applets/sam4c/libraries/libchip_sam4c/include/sam4c/sam4c32e-1.h
 
 define HOST_SAM_BA_EXTRACT_CMDS
-	$(UNZIP) -d $(BUILD_DIR) $(SAM_BA_DL_DIR)/$(SAM_BA_SOURCE)
+	$(UNZIP) -d $(BUILD_DIR) $(HOST_SAM_BA_DL_DIR)/$(SAM_BA_SOURCE)
 	mv $(BUILD_DIR)/sam-ba_cdc_linux/* $(@D)
 	rmdir $(BUILD_DIR)/sam-ba_cdc_linux/
 endef
