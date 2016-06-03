From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Jun 2016 20:08:45 +0200
Subject: [Buildroot] [git commit] configs/arm_juno: adding CMA support to
	the kernel
Message-ID: <20160603180854.44962805F0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f3106fd61171919f2c2a32a59daeac0f472bc955
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch adds CMA to the juno's default kernel config that is in
board/arm/juno. This is critical if the user decides to config video
resolution to 1920x1080.

Signed-off-by: Joao Pinto <jpinto@synopsys.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/arm/juno/linux-juno-defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/board/arm/juno/linux-juno-defconfig b/board/arm/juno/linux-juno-defconfig
index 96ccb5c..64598d2 100644
--- a/board/arm/juno/linux-juno-defconfig
+++ b/board/arm/juno/linux-juno-defconfig
@@ -165,3 +165,5 @@ CONFIG_SND=y
 CONFIG_SND_SOC=y
 CONFIG_SND_SIMPLE_CARD=y
 CONFIG_SND_DESIGNWARE_I2S=y
+CONFIG_CMA=y
+CONFIG_CMA_SIZE_MBYTES=64
