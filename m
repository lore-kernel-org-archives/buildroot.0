From: Joao Pinto <Joao.Pinto@synopsys.com>
Date: Wed, 25 May 2016 11:56:58 +0100
Subject: [Buildroot] [PATCH] juno: adding CMA to linux-juno-defconfig
Message-ID: <397c3db00cb2d5d6c3a57b5ba514e7180518e095.1464173670.git.jpinto@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds CMA to the juno's default kernel config that is in 
board/arm/juno. This is critical if the user decides to config video resolution
to 1920x1080.

Signed-off-by: Joao Pinto <jpinto@synopsys.com>
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
-- 
1.8.1.5
