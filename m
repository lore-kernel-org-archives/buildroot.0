From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 23 Sep 2019 10:30:43 +0300
Subject: [Buildroot] [PATCH] board: solidrun_clearfog_gt_8k: fix auto-load
 of dsa driver
Message-ID: <b873bd7c64ad10478263dd1ff2a951cc991b42f7.1569223843.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 5facee5cc32b ("configs/solidrun_clearfog_gt_8k: bump versions of
BSP components") broke automatic load of the mv88e6xxx dsa driver. The
kernel configuration makes the driver a module, which is not loaded
automatically at boot. Mark mv88e6xxx dependencies built-it to fix that.

Cc: Sergey Matyukevich <geomatsi@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 board/solidrun/clearfog_gt_8k/linux-extras.config | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/board/solidrun/clearfog_gt_8k/linux-extras.config b/board/solidrun/clearfog_gt_8k/linux-extras.config
index bce2a2e9d20c..24f4f5542555 100644
--- a/board/solidrun/clearfog_gt_8k/linux-extras.config
+++ b/board/solidrun/clearfog_gt_8k/linux-extras.config
@@ -1,4 +1,6 @@
 CONFIG_MARVELL_PHY=y
 CONFIG_SFP=y
+CONFIG_IPV6=y
+CONFIG_BRIDGE=y
 CONFIG_NET_DSA=y
 CONFIG_NET_DSA_MV88E6XXX=y
-- 
2.23.0
