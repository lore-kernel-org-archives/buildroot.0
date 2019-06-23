From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 23 Jun 2019 07:51:01 +0300
Subject: [Buildroot] [PATCH] boot/mv-ddr-marvell: fix build with GCC 8
Message-ID: <5347115f55229181585fe3229ea82f3f89698435.1561265461.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add upstream patch fixing a build warning that is considered as error.

Cc: Sergey Matyukevich <geomatsi@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 ...raining_leveling.c-uninitialized-var.patch | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 boot/mv-ddr-marvell/0001-mv_ddr-mv_ddr4_training_leveling.c-uninitialized-var.patch

diff --git a/boot/mv-ddr-marvell/0001-mv_ddr-mv_ddr4_training_leveling.c-uninitialized-var.patch b/boot/mv-ddr-marvell/0001-mv_ddr-mv_ddr4_training_leveling.c-uninitialized-var.patch
new file mode 100644
index 000000000000..eada18b47382
--- /dev/null
+++ b/boot/mv-ddr-marvell/0001-mv_ddr-mv_ddr4_training_leveling.c-uninitialized-var.patch
@@ -0,0 +1,31 @@
+From 5867fcad6e88af3d843bfa831648d84a53732d57 Mon Sep 17 00:00:00 2001
+From: Heinrich Schuchardt <xypron.glpk@gmx.de>
+Date: Wed, 19 Dec 2018 17:17:13 +0100
+Subject: [PATCH] mv_ddr: mv_ddr4_training_leveling.c: uninitialized variable
+
+With GCC 8.2 uninitialized variables lead to a build error.
+
+Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: commit 5867fcad6e8
+
+ mv_ddr4_training_leveling.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/mv_ddr4_training_leveling.c b/mv_ddr4_training_leveling.c
+index 144e21a03c01..cb95389f5466 100644
+--- a/mv_ddr4_training_leveling.c
++++ b/mv_ddr4_training_leveling.c
+@@ -368,7 +368,7 @@ static int mv_ddr4_dynamic_pb_wl_supp(u32 dev_num, enum mv_wl_supp_mode ecc_mode
+ 	u32 subphy_num = ddr3_tip_dev_attr_get(dev_num, MV_ATTR_OCTET_PER_INTERFACE);
+ 	u8 compare_result = 0;
+ 	u32 orig_phase;
+-	u32 rd_data, wr_data;
++	u32 rd_data, wr_data = 0;
+ 	u32 flag, step;
+ 	struct mv_ddr_topology_map *tm = mv_ddr_topology_map_get();
+ 	u32 ecc_phy_access_id;
+-- 
+2.20.1
+
-- 
2.20.1
