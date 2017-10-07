From: Fabio Estevam <festevam@gmail.com>
Date: Sat,  7 Oct 2017 19:04:05 -0300
Subject: [Buildroot] [PATCH] imx6-sabresd: Improve the explanation of the
	fragment file
Message-ID: <1507413845-11329-1-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Fabio Estevam <fabio.estevam@nxp.com>

Improve the explanation of the need for using the performance governor.

This problem is specific to mx6sabresd board and the Egalax touchscreen
running a mainline kernel, so make this clear.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
 board/freescale/imx6-sabresd/linux_qt5.fragment | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/freescale/imx6-sabresd/linux_qt5.fragment b/board/freescale/imx6-sabresd/linux_qt5.fragment
index 5c0505e..ffa5f63 100644
--- a/board/freescale/imx6-sabresd/linux_qt5.fragment
+++ b/board/freescale/imx6-sabresd/linux_qt5.fragment
@@ -1,4 +1,4 @@
-# Currently kernel mainline exhibits issues when running cpufreq as ondemand
-# governor on mx6.
+# Currently mx6sabresd exhibits touchscreen issues when running cpufreq as
+# ondemand governor with a mainline kernel.
 # CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND is not set
 CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE=y
-- 
2.7.4
