From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 23 Dec 2019 09:22:53 -0300
Subject: [Buildroot] [PATCH 2/2] board/imx6-sabresd: Remove unneeded
 CONFIG_VIDEO_CODA fragment
In-Reply-To: <20191223122253.8238-1-festevam@gmail.com>
References: <20191223122253.8238-1-festevam@gmail.com>
Message-ID: <20191223122253.8238-2-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since kernel commit a5a56f07c272 ("ARM: imx_v6_v7_defconfig: Select the
coda driver as module") the VPU coda driver is selected as module, so it can
be safely removed from linux_qt5.fragment.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
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
-- 
2.17.1
