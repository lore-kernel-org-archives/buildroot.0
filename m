From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 29 Sep 2019 09:16:01 +0200
Subject: [Buildroot] [git commit] board/solidrun/clearfog_gt_8k: fix
 auto-load of dsa driver
Message-ID: <20190929071220.ECA1982A9C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0864b16dccda6289a5e35633b888c284f35e2137
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 5facee5cc32b ("configs/solidrun_clearfog_gt_8k: bump versions of
BSP components") broke automatic load of the mv88e6xxx dsa driver. The
kernel configuration makes the driver a module, which is not loaded
automatically at boot. Mark mv88e6xxx dependencies built-it to fix that.

Cc: Sergey Matyukevich <geomatsi@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Reviewed-by: Sergey Matyukevich <geomatsi@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/solidrun/clearfog_gt_8k/linux-extras.config | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/board/solidrun/clearfog_gt_8k/linux-extras.config b/board/solidrun/clearfog_gt_8k/linux-extras.config
index bce2a2e9d2..24f4f55425 100644
--- a/board/solidrun/clearfog_gt_8k/linux-extras.config
+++ b/board/solidrun/clearfog_gt_8k/linux-extras.config
@@ -1,4 +1,6 @@
 CONFIG_MARVELL_PHY=y
 CONFIG_SFP=y
+CONFIG_IPV6=y
+CONFIG_BRIDGE=y
 CONFIG_NET_DSA=y
 CONFIG_NET_DSA_MV88E6XXX=y
