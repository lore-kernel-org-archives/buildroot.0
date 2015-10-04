From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 4 Oct 2015 13:28:47 +0100
Subject: [Buildroot] [PATCH v2 07/18] imx-vpu: remove now-redundant ccache
	handling
In-Reply-To: <1443961738-12149-1-git-send-email-arnout@mind.be>
References: <1443961738-12149-1-git-send-email-arnout@mind.be>
Message-ID: <1443961738-12149-8-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: Romain Naour <romain.naour@openwide.fr>
---
v2: Rebased on master
---
 package/freescale-imx/imx-vpu/imx-vpu.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/freescale-imx/imx-vpu/imx-vpu.mk b/package/freescale-imx/imx-vpu/imx-vpu.mk
index 3606857..571cc40 100644
--- a/package/freescale-imx/imx-vpu/imx-vpu.mk
+++ b/package/freescale-imx/imx-vpu/imx-vpu.mk
@@ -13,7 +13,7 @@ IMX_VPU_INSTALL_STAGING = YES
 IMX_VPU_MAKE_ENV = \
 	$(TARGET_MAKE_ENV) \
 	$(TARGET_CONFIGURE_OPTS) \
-	CROSS_COMPILE="$(CCACHE) $(TARGET_CROSS)" \
+	CROSS_COMPILE="$(TARGET_CROSS)" \
 	PLATFORM=$(BR2_PACKAGE_FREESCALE_IMX_PLATFORM)
 
 IMX_VPU_LICENSE = Freescale Semiconductor Software License Agreement
-- 
2.5.3
