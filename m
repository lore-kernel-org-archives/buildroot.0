From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Oct 2017 15:31:09 +0200
Subject: [Buildroot] [git commit] imx6-sabresd: Improve the explanation of
	the fragment file
Message-ID: <20171008132348.7B7D17FE4F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f99636a044820fb61f400de0fdb96315a1aa9279
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Improve the explanation of the need for using the performance governor.

This problem is specific to mx6sabresd board and the Egalax touchscreen
running a mainline kernel, so make this clear.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
