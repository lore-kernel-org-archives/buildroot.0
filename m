From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@freescale.com>
Date: Mon, 12 Oct 2015 17:03:14 +0200
Subject: [Buildroot] [PATCH] imx-gpu-viv: install g2d library and header
Message-ID: <1444662194-17583-1-git-send-email-vincent.stehle@freescale.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Freescale gpu-viv binaries archive supplies the libraries and headers
for accelerated OpenGL ES, OpenCL and OpenVG on i.MX6 platforms.

This binaries archive also supplies a g2d library and its header, which
allow to perform accelerated 2D operations on i.MX6 platforms in a
simpler manner. Install those as well, as it is useful for some
packages, such as e.g. kodi.

Signed-off-by: Vincent Stehl? <vincent.stehle@freescale.com>
Cc: Gary Bisson <gary.bisson@boundarydevices.com>
---
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
index aa1e3b6..bba2934 100644
--- a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
+++ b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
@@ -64,6 +64,7 @@ endif
 
 define IMX_GPU_VIV_INSTALL_STAGING_CMDS
 	cp -r $(@D)/gpu-core/usr/* $(STAGING_DIR)/usr
+	cp -r $(@D)/g2d/usr/* $(STAGING_DIR)/usr
 	$(IMX_GPU_VIV_FIXUP_FB_HEADERS)
 	for lib in egl glesv2 vg; do \
 		$(INSTALL) -m 0644 -D \
@@ -85,6 +86,7 @@ endif
 define IMX_GPU_VIV_INSTALL_TARGET_CMDS
 	$(IMX_GPU_VIV_INSTALL_EXAMPLES)
 	cp -a $(@D)/gpu-core/usr/lib $(TARGET_DIR)/usr
+	cp -a $(@D)/g2d/usr/lib $(TARGET_DIR)/usr
 	for lib in EGL GAL VIVANTE GLESv2; do \
 		for f in $(TARGET_DIR)/usr/lib/lib$${lib}-*.so; do \
 			case $$f in \
-- 
2.5.3
