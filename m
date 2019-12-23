From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 23 Dec 2019 20:56:42 +0100
Subject: [Buildroot] [git commit] board/freescale/imx6-sabresd: Remove
 unneeded CONFIG_VIDEO_CODA fragment
Message-ID: <20191223195041.BDA238E04A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=857c365fc4938d53e298d7938d5ab135bbb88a7b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since kernel commit a5a56f07c272 ("ARM: imx_v6_v7_defconfig: Select the
coda driver as module") the VPU coda driver is selected as module, so it can
be safely removed from linux_qt5.fragment.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/freescale/imx6-sabresd/linux_qt5.fragment | 1 -
 1 file changed, 1 deletion(-)

diff --git a/board/freescale/imx6-sabresd/linux_qt5.fragment b/board/freescale/imx6-sabresd/linux_qt5.fragment
index d4f26b163c..ffa5f63eab 100644
--- a/board/freescale/imx6-sabresd/linux_qt5.fragment
+++ b/board/freescale/imx6-sabresd/linux_qt5.fragment
@@ -2,4 +2,3 @@
 # ondemand governor with a mainline kernel.
 # CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND is not set
 CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE=y
-CONFIG_VIDEO_CODA=m
