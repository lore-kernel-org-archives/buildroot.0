From: Fabio Estevam <fabio.estevam@nxp.com>
Date: Mon, 21 Aug 2017 15:20:52 -0300
Subject: [Buildroot] [PATCH 2/2] configs/imx6q-sabresd_qt5: Remove
	CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE
In-Reply-To: <1503339652-7641-1-git-send-email-fabio.estevam@nxp.com>
References: <1503339652-7641-1-git-send-email-fabio.estevam@nxp.com>
Message-ID: <1503339652-7641-2-git-send-email-fabio.estevam@nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Fabio Estevam <festevam@gmail.com>

Selecting CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE=y causes touchscreen
to behave incorrectly, leading to missed touch events, so remove this
option.

Keep the fragment file as sent in the original patch submission.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 board/freescale/imx6q-sabresd/linux_qt5.fragment | 1 -
 1 file changed, 1 deletion(-)

diff --git a/board/freescale/imx6q-sabresd/linux_qt5.fragment b/board/freescale/imx6q-sabresd/linux_qt5.fragment
index 5c0505e..f244ba8 100644
--- a/board/freescale/imx6q-sabresd/linux_qt5.fragment
+++ b/board/freescale/imx6q-sabresd/linux_qt5.fragment
@@ -1,4 +1,3 @@
 # Currently kernel mainline exhibits issues when running cpufreq as ondemand
 # governor on mx6.
 # CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND is not set
-CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE=y
-- 
2.7.4
