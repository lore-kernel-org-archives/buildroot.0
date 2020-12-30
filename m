From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 30 Dec 2020 10:29:05 +0100
Subject: [Buildroot] [git commit] boot/mv-ddr-marvell: Bump to HEAD as of
 20201207
Message-ID: <20201230091150.501FB841EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2cfdf8b8a269a2c3205f706315469051aa450d6b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Rebase on the mv-ddr-devel branch as the release branches are no longer
maintained.

Signed-off-by: Dick Olsson <hi@senzilla.io>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...dr4_training_leveling.c-uninitialized-var.patch | 31 ----------------------
 boot/mv-ddr-marvell/mv-ddr-marvell.hash            |  2 +-
 boot/mv-ddr-marvell/mv-ddr-marvell.mk              |  4 +--
 3 files changed, 3 insertions(+), 34 deletions(-)

diff --git a/boot/mv-ddr-marvell/0001-mv_ddr-mv_ddr4_training_leveling.c-uninitialized-var.patch b/boot/mv-ddr-marvell/0001-mv_ddr-mv_ddr4_training_leveling.c-uninitialized-var.patch
deleted file mode 100644
index eada18b473..0000000000
--- a/boot/mv-ddr-marvell/0001-mv_ddr-mv_ddr4_training_leveling.c-uninitialized-var.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 5867fcad6e88af3d843bfa831648d84a53732d57 Mon Sep 17 00:00:00 2001
-From: Heinrich Schuchardt <xypron.glpk@gmx.de>
-Date: Wed, 19 Dec 2018 17:17:13 +0100
-Subject: [PATCH] mv_ddr: mv_ddr4_training_leveling.c: uninitialized variable
-
-With GCC 8.2 uninitialized variables lead to a build error.
-
-Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: commit 5867fcad6e8
-
- mv_ddr4_training_leveling.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/mv_ddr4_training_leveling.c b/mv_ddr4_training_leveling.c
-index 144e21a03c01..cb95389f5466 100644
---- a/mv_ddr4_training_leveling.c
-+++ b/mv_ddr4_training_leveling.c
-@@ -368,7 +368,7 @@ static int mv_ddr4_dynamic_pb_wl_supp(u32 dev_num, enum mv_wl_supp_mode ecc_mode
- 	u32 subphy_num = ddr3_tip_dev_attr_get(dev_num, MV_ATTR_OCTET_PER_INTERFACE);
- 	u8 compare_result = 0;
- 	u32 orig_phase;
--	u32 rd_data, wr_data;
-+	u32 rd_data, wr_data = 0;
- 	u32 flag, step;
- 	struct mv_ddr_topology_map *tm = mv_ddr_topology_map_get();
- 	u32 ecc_phy_access_id;
--- 
-2.20.1
-
diff --git a/boot/mv-ddr-marvell/mv-ddr-marvell.hash b/boot/mv-ddr-marvell/mv-ddr-marvell.hash
index ec2fe6ed37..e1a86008db 100644
--- a/boot/mv-ddr-marvell/mv-ddr-marvell.hash
+++ b/boot/mv-ddr-marvell/mv-ddr-marvell.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  39dcc8baccb82cbc746d8f82ce7f673e1b1236e8aee0d09e7ab12c27eeb6ecda  mv-ddr-marvell-618dadd1491eb2f7b2fd74313c04f7accddae475.tar.gz
+sha256  bfab74a625d65238c569b9df282b55c0fc9a1e2d3decedcf194d44774df2ede4  mv-ddr-marvell-305d923e6bc4236cd3b902f6679b0aef9e5fa52d.tar.gz
 sha256  69208236fc322026920b92d1d839ebdc521ca65379bfdb3368a24945e794fc78  ddr3_init.c
diff --git a/boot/mv-ddr-marvell/mv-ddr-marvell.mk b/boot/mv-ddr-marvell/mv-ddr-marvell.mk
index a4e0c0467d..442b6aed53 100644
--- a/boot/mv-ddr-marvell/mv-ddr-marvell.mk
+++ b/boot/mv-ddr-marvell/mv-ddr-marvell.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-# This is the commit for mv_ddr-armada-18.12.0
-MV_DDR_MARVELL_VERSION = 618dadd1491eb2f7b2fd74313c04f7accddae475
+# This is the latest commit on mv-ddr-devel as of 20201207
+MV_DDR_MARVELL_VERSION = 305d923e6bc4236cd3b902f6679b0aef9e5fa52d
 MV_DDR_MARVELL_SITE = $(call github,MarvellEmbeddedProcessors,mv-ddr-marvell,$(MV_DDR_MARVELL_VERSION))
 MV_DDR_MARVELL_LICENSE = GPL-2.0+ or LGPL-2.1 with freertos-exception-2.0, BSD-3-Clause, Marvell Commercial
 MV_DDR_MARVELL_LICENSE_FILES = ddr3_init.c
