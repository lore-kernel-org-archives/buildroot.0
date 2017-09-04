From: Baruch Siach <baruch@tkos.co.il>
Date: Mon,  4 Sep 2017 10:40:40 +0300
Subject: [Buildroot] [PATCH] mmc-utils: use upstream provided install target
Message-ID: <458a66622f1ede03edf340d7f05d52f971eabc79.1504510840.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cc: S?bastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/mmc-utils/mmc-utils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mmc-utils/mmc-utils.mk b/package/mmc-utils/mmc-utils.mk
index 0b9a6d14193d..7292c029f5a2 100644
--- a/package/mmc-utils/mmc-utils.mk
+++ b/package/mmc-utils/mmc-utils.mk
@@ -13,7 +13,7 @@ define MMC_UTILS_BUILD_CMDS
 endef
 
 define MMC_UTILS_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/mmc $(TARGET_DIR)/usr/bin/mmc
+	prefix=$(TARGET_DIR) $(MAKE) -C $(@D) install
 endef
 
 $(eval $(generic-package))
-- 
2.14.1
