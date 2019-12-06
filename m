From: Jerry Huang <jerry.huang@nxp.com>
Date: Fri, 6 Dec 2019 07:51:25 +0000
Subject: [Buildroot] [PATCH v3 7/9] package/qoriq-rcw:Enable IIC5_PMUX
 and CLK_OUT_PMUX for GPIO
In-Reply-To: <20191127071720.15623-7-jerry.huang@nxp.com>
References: <20191127071720.15623-1-jerry.huang@nxp.com>
 <20191127071720.15623-7-jerry.huang@nxp.com>
Message-ID: <VI1PR04MB5136C845E72888540A840214FE5F0@VI1PR04MB5136.eurprd04.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, all guys, 
And comment for patch 1 ~ patch 7?

I will rework patch8 and patch9.

Best Regards
Jerry Huang

> -----Original Message-----
> From: Changming Huang <jerry.huang@nxp.com>
> Sent: Wednesday, November 27, 2019 3:17 PM
> To: buildroot at busybox.net
> Cc: thomas.petazzoni at bootlin.com; michael at walle.cc;
> matthew.weber at collins.com; geomatsi at gmail.com; Jerry Huang
> <jerry.huang@nxp.com>
> Subject: [PATCH v3 7/9] package/qoriq-rcw:Enable IIC5_PMUX and
> CLK_OUT_PMUX for GPIO
> 
> From: Jerry Huang <jerry.huang@nxp.com>
> 
> Because GPIO is used as interrupt for eNETC PHY and Micro-bus, IIC5_PMUX
> and CLK_OUT_PMUX are enabled for GPIO.
> 
> Signed-off-by: Jerry Huang <jerry.huang@nxp.com>
> ---
> changes sinve v2:
> 1. no changes.
> 
> changes sinve v1:
> 1. change to unconditional for these two patches.
> ---
>  ...b-Enable-IIC5_PMUX-for-GPIO-function.patch | 42
> +++++++++++++++++++  ...nable-CLK_OUT_PMUX-for-GPIO-function.patch |
> 40 ++++++++++++++++++
>  2 files changed, 82 insertions(+)
>  create mode 100644
> package/nxp/qoriq-rcw/0001-ls1028ardb-Enable-IIC5_PMUX-for-GPIO-function.
> patch
>  create mode 100644
> package/nxp/qoriq-rcw/0002-ls1028ardb-Enable-CLK_OUT_PMUX-for-GPIO-fun
> ction.patch
> 
> diff --git
> a/package/nxp/qoriq-rcw/0001-ls1028ardb-Enable-IIC5_PMUX-for-GPIO-functio
> n.patch
> b/package/nxp/qoriq-rcw/0001-ls1028ardb-Enable-IIC5_PMUX-for-GPIO-functio
> n.patch
> new file mode 100644
> index 0000000000..21c6c84cbd
> --- /dev/null
> +++ b/package/nxp/qoriq-rcw/0001-ls1028ardb-Enable-IIC5_PMUX-for-GPIO-fu
> +++ nction.patch
> @@ -0,0 +1,42 @@
> +From 33b403cee1fa215927bc65dc14baf35a2fdbe7b3 Mon Sep 17 00:00:00
> 2001
> +From: Jerry Huang <jerry.huang@nxp.com>
> +Date: Thu, 19 Sep 2019 12:12:20 +0800
> +Subject: [PATCH 1/2] ls1028ardb: Enable IIC5_PMUX for GPIO function
> +
> +Set IIC5_PMUX = 1 to enable GPIO function.
> +
> +Signed-off-by: Jianchao Wang <jianchao.wang@nxp.com>
> +Signed-off-by: Jerry Huang <jerry.huang@nxp.com>
> +---
> + ls1028ardb/R_SQPP_0x85bb/rcw_1300_emmcboot.rcw | 2 +-
> + ls1028ardb/R_SQPP_0x85bb/rcw_1300_sdboot.rcw   | 2 +-
> + 2 files changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/ls1028ardb/R_SQPP_0x85bb/rcw_1300_emmcboot.rcw
> +b/ls1028ardb/R_SQPP_0x85bb/rcw_1300_emmcboot.rcw
> +index b46ea2e..5466a63 100644
> +--- a/ls1028ardb/R_SQPP_0x85bb/rcw_1300_emmcboot.rcw
> ++++ b/ls1028ardb/R_SQPP_0x85bb/rcw_1300_emmcboot.rcw
> +@@ -26,7 +26,7 @@ SYSCLK_FREQ=600
> + IIC2_PMUX=6
> + IIC3_PMUX=2
> + IIC4_PMUX=2
> +-IIC5_PMUX=2
> ++IIC5_PMUX=1
> + IIC6_PMUX=2
> + CLK_OUT_PMUX=2
> + EC1_SAI4_5_PMUX=5
> +diff --git a/ls1028ardb/R_SQPP_0x85bb/rcw_1300_sdboot.rcw
> +b/ls1028ardb/R_SQPP_0x85bb/rcw_1300_sdboot.rcw
> +index 04e2208..1908d8c 100644
> +--- a/ls1028ardb/R_SQPP_0x85bb/rcw_1300_sdboot.rcw
> ++++ b/ls1028ardb/R_SQPP_0x85bb/rcw_1300_sdboot.rcw
> +@@ -26,7 +26,7 @@ SYSCLK_FREQ=600
> + IIC2_PMUX=6
> + IIC3_PMUX=2
> + IIC4_PMUX=2
> +-IIC5_PMUX=2
> ++IIC5_PMUX=1
> + IIC6_PMUX=3
> + CLK_OUT_PMUX=2
> + EC1_SAI4_5_PMUX=5
> +--
> +2.17.1
> diff --git
> a/package/nxp/qoriq-rcw/0002-ls1028ardb-Enable-CLK_OUT_PMUX-for-GPIO-fu
> nction.patch
> b/package/nxp/qoriq-rcw/0002-ls1028ardb-Enable-CLK_OUT_PMUX-for-GPIO-fu
> nction.patch
> new file mode 100644
> index 0000000000..4f00541d69
> --- /dev/null
> +++
> b/package/nxp/qoriq-rcw/0002-ls1028ardb-Enable-CLK_OUT_PMUX-for-GPIO
> +++ -function.patch
> @@ -0,0 +1,40 @@
> +From 4a3c9ea5d0c7bf8eec8cb6276d6f4d940f3946db Mon Sep 17 00:00:00
> 2001
> +From: Jerry Huang <jerry.huang@nxp.com>
> +Date: Thu, 19 Sep 2019 12:13:48 +0800
> +Subject: [PATCH 2/2] ls1028ardb/rcw: Enable CLK_OUT_PMUX for GPIO
> +function
> +
> +Signed-off-by: Jianchao Wang <jianchao.wang@nxp.com>
> +Signed-off-by: Jerry Huang <jerry.huang@nxp.com>
> +---
> + ls1028ardb/R_SQPP_0x85bb/rcw_1300_emmcboot.rcw | 2 +-
> + ls1028ardb/R_SQPP_0x85bb/rcw_1300_sdboot.rcw   | 2 +-
> + 2 files changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/ls1028ardb/R_SQPP_0x85bb/rcw_1300_emmcboot.rcw
> +b/ls1028ardb/R_SQPP_0x85bb/rcw_1300_emmcboot.rcw
> +index 5466a63..a5ed4d4 100644
> +--- a/ls1028ardb/R_SQPP_0x85bb/rcw_1300_emmcboot.rcw
> ++++ b/ls1028ardb/R_SQPP_0x85bb/rcw_1300_emmcboot.rcw
> +@@ -28,7 +28,7 @@ IIC3_PMUX=2
> + IIC4_PMUX=2
> + IIC5_PMUX=1
> + IIC6_PMUX=2
> +-CLK_OUT_PMUX=2
> ++CLK_OUT_PMUX=1
> + EC1_SAI4_5_PMUX=5
> + EC1_SAI3_6_PMUX=5
> + USB3_CLK_FSEL=39
> +diff --git a/ls1028ardb/R_SQPP_0x85bb/rcw_1300_sdboot.rcw
> +b/ls1028ardb/R_SQPP_0x85bb/rcw_1300_sdboot.rcw
> +index 1908d8c..c930b83 100644
> +--- a/ls1028ardb/R_SQPP_0x85bb/rcw_1300_sdboot.rcw
> ++++ b/ls1028ardb/R_SQPP_0x85bb/rcw_1300_sdboot.rcw
> +@@ -28,7 +28,7 @@ IIC3_PMUX=2
> + IIC4_PMUX=2
> + IIC5_PMUX=1
> + IIC6_PMUX=3
> +-CLK_OUT_PMUX=2
> ++CLK_OUT_PMUX=1
> + EC1_SAI4_5_PMUX=5
> + EC1_SAI3_6_PMUX=5
> + USB3_CLK_FSEL=39
> +--
> +2.17.1
> --
> 2.17.1
