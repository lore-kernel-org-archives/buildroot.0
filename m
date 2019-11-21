From: Changming Huang <jerry.huang@nxp.com>
Date: Thu, 21 Nov 2019 18:23:22 +0800
Subject: [Buildroot] [PATCH v2 08/10]
 package/freescale-qoriq/fsl-qoriq-rcw:Enable IIC5_PMUX and CLK_OUT_PMUX for
 GPIO
In-Reply-To: <20191121102324.35225-1-jerry.huang@nxp.com>
References: <20191121102324.35225-1-jerry.huang@nxp.com>
Message-ID: <20191121102324.35225-9-jerry.huang@nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jerry Huang <jerry.huang@nxp.com>

Because GPIO is used as interrupt for eNETC PHY and Micro-bus,
IIC5_PMUX and CLK_OUT_PMUX are enabled for GPIO.

Signed-off-by: Jerry Huang <jerry.huang@nxp.com>
---
changes sinve v1:
1. change to unconditional for these two patches
---
 ...b-Enable-IIC5_PMUX-for-GPIO-function.patch | 42 +++++++++++++++++++
 ...nable-CLK_OUT_PMUX-for-GPIO-function.patch | 40 ++++++++++++++++++
 2 files changed, 82 insertions(+)
 create mode 100644 package/freescale-qoriq/fsl-qoriq-rcw/0001-ls1028ardb-Enable-IIC5_PMUX-for-GPIO-function.patch
 create mode 100644 package/freescale-qoriq/fsl-qoriq-rcw/0002-ls1028ardb-Enable-CLK_OUT_PMUX-for-GPIO-function.patch

diff --git a/package/freescale-qoriq/fsl-qoriq-rcw/0001-ls1028ardb-Enable-IIC5_PMUX-for-GPIO-function.patch b/package/freescale-qoriq/fsl-qoriq-rcw/0001-ls1028ardb-Enable-IIC5_PMUX-for-GPIO-function.patch
new file mode 100644
index 0000000000..21c6c84cbd
--- /dev/null
+++ b/package/freescale-qoriq/fsl-qoriq-rcw/0001-ls1028ardb-Enable-IIC5_PMUX-for-GPIO-function.patch
@@ -0,0 +1,42 @@
+From 33b403cee1fa215927bc65dc14baf35a2fdbe7b3 Mon Sep 17 00:00:00 2001
+From: Jerry Huang <jerry.huang@nxp.com>
+Date: Thu, 19 Sep 2019 12:12:20 +0800
+Subject: [PATCH 1/2] ls1028ardb: Enable IIC5_PMUX for GPIO function
+
+Set IIC5_PMUX = 1 to enable GPIO function.
+
+Signed-off-by: Jianchao Wang <jianchao.wang@nxp.com>
+Signed-off-by: Jerry Huang <jerry.huang@nxp.com>
+---
+ ls1028ardb/R_SQPP_0x85bb/rcw_1300_emmcboot.rcw | 2 +-
+ ls1028ardb/R_SQPP_0x85bb/rcw_1300_sdboot.rcw   | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/ls1028ardb/R_SQPP_0x85bb/rcw_1300_emmcboot.rcw b/ls1028ardb/R_SQPP_0x85bb/rcw_1300_emmcboot.rcw
+index b46ea2e..5466a63 100644
+--- a/ls1028ardb/R_SQPP_0x85bb/rcw_1300_emmcboot.rcw
++++ b/ls1028ardb/R_SQPP_0x85bb/rcw_1300_emmcboot.rcw
+@@ -26,7 +26,7 @@ SYSCLK_FREQ=600
+ IIC2_PMUX=6
+ IIC3_PMUX=2
+ IIC4_PMUX=2
+-IIC5_PMUX=2
++IIC5_PMUX=1
+ IIC6_PMUX=2
+ CLK_OUT_PMUX=2
+ EC1_SAI4_5_PMUX=5
+diff --git a/ls1028ardb/R_SQPP_0x85bb/rcw_1300_sdboot.rcw b/ls1028ardb/R_SQPP_0x85bb/rcw_1300_sdboot.rcw
+index 04e2208..1908d8c 100644
+--- a/ls1028ardb/R_SQPP_0x85bb/rcw_1300_sdboot.rcw
++++ b/ls1028ardb/R_SQPP_0x85bb/rcw_1300_sdboot.rcw
+@@ -26,7 +26,7 @@ SYSCLK_FREQ=600
+ IIC2_PMUX=6
+ IIC3_PMUX=2
+ IIC4_PMUX=2
+-IIC5_PMUX=2
++IIC5_PMUX=1
+ IIC6_PMUX=3
+ CLK_OUT_PMUX=2
+ EC1_SAI4_5_PMUX=5
+--
+2.17.1
diff --git a/package/freescale-qoriq/fsl-qoriq-rcw/0002-ls1028ardb-Enable-CLK_OUT_PMUX-for-GPIO-function.patch b/package/freescale-qoriq/fsl-qoriq-rcw/0002-ls1028ardb-Enable-CLK_OUT_PMUX-for-GPIO-function.patch
new file mode 100644
index 0000000000..4f00541d69
--- /dev/null
+++ b/package/freescale-qoriq/fsl-qoriq-rcw/0002-ls1028ardb-Enable-CLK_OUT_PMUX-for-GPIO-function.patch
@@ -0,0 +1,40 @@
+From 4a3c9ea5d0c7bf8eec8cb6276d6f4d940f3946db Mon Sep 17 00:00:00 2001
+From: Jerry Huang <jerry.huang@nxp.com>
+Date: Thu, 19 Sep 2019 12:13:48 +0800
+Subject: [PATCH 2/2] ls1028ardb/rcw: Enable CLK_OUT_PMUX for GPIO function
+
+Signed-off-by: Jianchao Wang <jianchao.wang@nxp.com>
+Signed-off-by: Jerry Huang <jerry.huang@nxp.com>
+---
+ ls1028ardb/R_SQPP_0x85bb/rcw_1300_emmcboot.rcw | 2 +-
+ ls1028ardb/R_SQPP_0x85bb/rcw_1300_sdboot.rcw   | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/ls1028ardb/R_SQPP_0x85bb/rcw_1300_emmcboot.rcw b/ls1028ardb/R_SQPP_0x85bb/rcw_1300_emmcboot.rcw
+index 5466a63..a5ed4d4 100644
+--- a/ls1028ardb/R_SQPP_0x85bb/rcw_1300_emmcboot.rcw
++++ b/ls1028ardb/R_SQPP_0x85bb/rcw_1300_emmcboot.rcw
+@@ -28,7 +28,7 @@ IIC3_PMUX=2
+ IIC4_PMUX=2
+ IIC5_PMUX=1
+ IIC6_PMUX=2
+-CLK_OUT_PMUX=2
++CLK_OUT_PMUX=1
+ EC1_SAI4_5_PMUX=5
+ EC1_SAI3_6_PMUX=5
+ USB3_CLK_FSEL=39
+diff --git a/ls1028ardb/R_SQPP_0x85bb/rcw_1300_sdboot.rcw b/ls1028ardb/R_SQPP_0x85bb/rcw_1300_sdboot.rcw
+index 1908d8c..c930b83 100644
+--- a/ls1028ardb/R_SQPP_0x85bb/rcw_1300_sdboot.rcw
++++ b/ls1028ardb/R_SQPP_0x85bb/rcw_1300_sdboot.rcw
+@@ -28,7 +28,7 @@ IIC3_PMUX=2
+ IIC4_PMUX=2
+ IIC5_PMUX=1
+ IIC6_PMUX=3
+-CLK_OUT_PMUX=2
++CLK_OUT_PMUX=1
+ EC1_SAI4_5_PMUX=5
+ EC1_SAI3_6_PMUX=5
+ USB3_CLK_FSEL=39
+--
+2.17.1
-- 
2.17.1
