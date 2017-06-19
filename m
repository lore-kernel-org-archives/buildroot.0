From: Jagan Teki <jagannadh.teki@gmail.com>
Date: Mon, 19 Jun 2017 12:57:28 +0530
Subject: [Buildroot] [PATCH v4 2/6] board: engicam: Rename defconfig
	engicam_imx6qdl_icore_mmc_defconfig
In-Reply-To: <1497857252-8308-1-git-send-email-jteki@openedev.com>
References: <1497857252-8308-1-git-send-email-jteki@openedev.com>
Message-ID: <1497857252-8308-3-git-send-email-jteki@openedev.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jagan Teki <jagan@amarulasolutions.com>

Since the board have support for nand, better to explicitly
name it with mmc.

engicam_imx6qdl_icore_defconfig => engicam_imx6qdl_icore_mmc_defconfig

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v4:
- Update .gitlab-ci.yml
Changes for v3:
- none
Changes for v2:
- Fix genimage.cfg path in readme.txt

 .gitlab-ci.yml                                                          | 2 +-
 DEVELOPERS                                                              | 2 +-
 board/engicam/readme.txt                                                | 2 +-
 ...icam_imx6qdl_icore_defconfig => engicam_imx6qdl_icore_mmc_defconfig} | 0
 4 files changed, 3 insertions(+), 3 deletions(-)
 rename configs/{engicam_imx6qdl_icore_defconfig => engicam_imx6qdl_icore_mmc_defconfig} (100%)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 36ef1d1..c4bf90d 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -89,7 +89,7 @@ ci20_defconfig: *defconfig
 ci40_defconfig: *defconfig
 csky_gx6605s_defconfig: *defconfig
 cubieboard2_defconfig: *defconfig
-engicam_imx6qdl_icore_defconfig: *defconfig
+engicam_imx6qdl_icore_mmc_defconfig: *defconfig
 firefly_rk3288_defconfig: *defconfig
 firefly_rk3288_demo_defconfig: *defconfig
 freescale_imx28evk_defconfig: *defconfig
diff --git a/DEVELOPERS b/DEVELOPERS
index 9a8b586..85d81dc 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -837,7 +837,7 @@ F:	package/keepalived/
 
 N:	Jagan Teki <jagan@amarulasolutions.com>
 F:	board/engicam/
-F:	configs/engicam_imx6qdl_icore_defconfig
+F:	configs/engicam_imx6qdl_icore_mmc_defconfig
 
 N:	James Knight <james.knight@rockwellcollins.com>
 F:	package/atkmm/
diff --git a/board/engicam/readme.txt b/board/engicam/readme.txt
index d02c3af..0ef108d 100644
--- a/board/engicam/readme.txt
+++ b/board/engicam/readme.txt
@@ -17,7 +17,7 @@ First, configure Buildroot for the Engicam i.MX SOM's:
 
 - for i.CoreM6 Quad/Dual:
 
-  make engicam_imx6qdl_icore_defconfig
+  make engicam_imx6qdl_icore_mmc_defconfig
 
 Build all components:
 
diff --git a/configs/engicam_imx6qdl_icore_defconfig b/configs/engicam_imx6qdl_icore_mmc_defconfig
similarity index 100%
rename from configs/engicam_imx6qdl_icore_defconfig
rename to configs/engicam_imx6qdl_icore_mmc_defconfig
-- 
2.7.4
