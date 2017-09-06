From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Sep 2017 23:31:20 +0200
Subject: [Buildroot] [git commit] mmc-utils: use upstream provided install
	target
Message-ID: <20170906212426.92A4181999@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=371d3a7ab8d10e73243f33c564218306aec54a97
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Cc: S??bastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mmc-utils/mmc-utils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mmc-utils/mmc-utils.mk b/package/mmc-utils/mmc-utils.mk
index 0b9a6d1..9aeaf5c 100644
--- a/package/mmc-utils/mmc-utils.mk
+++ b/package/mmc-utils/mmc-utils.mk
@@ -13,7 +13,7 @@ define MMC_UTILS_BUILD_CMDS
 endef
 
 define MMC_UTILS_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/mmc $(TARGET_DIR)/usr/bin/mmc
+	$(MAKE) -C $(@D) prefix=/usr DESTDIR=$(TARGET_DIR) install
 endef
 
 $(eval $(generic-package))
