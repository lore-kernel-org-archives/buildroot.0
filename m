From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 20 Sep 2015 20:41:33 +0200
Subject: [Buildroot] [PATCH 07/18] imx-vpu: remove now-redundant ccache
	handling
In-Reply-To: <1442774504-22799-1-git-send-email-arnout@mind.be>
References: <1442774504-22799-1-git-send-email-arnout@mind.be>
Message-ID: <1442774504-22799-8-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/freescale-imx/imx-vpu/imx-vpu.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/freescale-imx/imx-vpu/imx-vpu.mk b/package/freescale-imx/imx-vpu/imx-vpu.mk
index 4c4a031..7c41c9d 100644
--- a/package/freescale-imx/imx-vpu/imx-vpu.mk
+++ b/package/freescale-imx/imx-vpu/imx-vpu.mk
@@ -15,7 +15,7 @@ IMX_VPU_DEPENDENCIES += linux
 IMX_VPU_MAKE_ENV = \
 	$(TARGET_MAKE_ENV) \
 	$(TARGET_CONFIGURE_OPTS) \
-	CROSS_COMPILE="$(CCACHE) $(TARGET_CROSS)" \
+	CROSS_COMPILE="$(TARGET_CROSS)" \
 	PLATFORM=$(BR2_PACKAGE_FREESCALE_IMX_PLATFORM) \
 	INCLUDE="-idirafter $(LINUX_DIR)/include"
 
-- 
2.5.3
