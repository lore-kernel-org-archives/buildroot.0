From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Mon, 13 Oct 2014 13:10:12 +0200
Subject: [Buildroot] [PATCH v2 02/13] gpu-viv-bin-mx6q: provide libopenvg
In-Reply-To: <1413198623-22373-1-git-send-email-jezz@sysmic.org>
References: <1413198623-22373-1-git-send-email-jezz@sysmic.org>
Message-ID: <1413198623-22373-3-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 package/freescale-imx/gpu-viv-bin-mx6q/Config.in           | 4 ++++
 package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/freescale-imx/gpu-viv-bin-mx6q/Config.in b/package/freescale-imx/gpu-viv-bin-mx6q/Config.in
index 864c605..4e83dd3 100644
--- a/package/freescale-imx/gpu-viv-bin-mx6q/Config.in
+++ b/package/freescale-imx/gpu-viv-bin-mx6q/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_GPU_VIV_BIN_MX6Q
 	bool "gpu-viv-bin-mx6q"
 	select BR2_PACKAGE_HAS_LIBEGL
 	select BR2_PACKAGE_HAS_LIBGLES
+	select BR2_PACKAGE_HAS_LIBOPENVG
 	select BR2_PACKAGE_XLIB_LIBXDAMAGE if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_XORG7
 	depends on BR2_arm # Only relevant for i.MX6
@@ -30,6 +31,9 @@ config BR2_PACKAGE_PROVIDES_LIBEGL
 config BR2_PACKAGE_PROVIDES_LIBGLES
 	default "gpu-viv-bin-mx6q"
 
+config BR2_PACKAGE_PROVIDES_LIBOPENVG
+	default "gpu-viv-bin-mx6q"
+
 config BR2_PACKAGE_GPU_VIV_BIN_MX6Q_EXAMPLES
 	bool "install examples"
 	help
diff --git a/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk b/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
index 60060d3..aef16a3 100644
--- a/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
+++ b/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
@@ -23,7 +23,7 @@ GPU_VIV_BIN_MX6Q_LICENSE = Freescale Semiconductor Software License Agreement
 # for which a separate license is needed...
 GPU_VIV_BIN_MX6Q_REDISTRIBUTE = NO
 
-GPU_VIV_BIN_MX6Q_PROVIDES = libegl libgles
+GPU_VIV_BIN_MX6Q_PROVIDES = libegl libgles libopenvg
 
 # DirectFB is not supported (wrong version)
 ifeq ($(BR2_PACKAGE_XORG7),y)
-- 
1.9.1
