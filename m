From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 12 Nov 2018 18:33:15 +0100
Subject: [Buildroot] [PATCH 5/6 v2] fs: allow user provided permissions to
 override packages permissions
In-Reply-To: <cover.1542043922.git.yann.morin.1998@free.fr>
References: <cover.1542043922.git.yann.morin.1998@free.fr>
Message-ID: <724e6b0dd8761b23a3ab4b71fe22d5f9551ee49c.1542043922.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Reported-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Matthew Weber <matthew.weber@rockwellcollins.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 fs/common.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/common.mk b/fs/common.mk
index e406554914..d50698078b 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -69,10 +69,10 @@ ifeq ($(BR2_ROOTFS_DEVICE_CREATION_STATIC),y)
 endif
 endif
 
+	$(call PRINTF,$(PACKAGES_PERMISSIONS_TABLE)) >> $(ROOTFS_FINAL_PERMISSIONS_TABLE)
 ifneq ($(ROOTFS_PERMISSIONS_TABLES),)
 	cat $(ROOTFS_PERMISSIONS_TABLES) >>$(ROOTFS_FINAL_PERMISSIONS_TABLE)
 endif
-	$(call PRINTF,$(PACKAGES_PERMISSIONS_TABLE)) >> $(ROOTFS_FINAL_PERMISSIONS_TABLE)
 
 
 rootfs-common-show-depends:
-- 
2.14.1
