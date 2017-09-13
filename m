From: Jagan Teki <jagannadh.teki@gmail.com>
Date: Wed, 13 Sep 2017 17:12:10 +0530
Subject: [Buildroot] [PATCH v3 5/6] engicam: icorem6: Add OF C.TOUCH 12 Kit
In-Reply-To: <1505302931-17387-1-git-send-email-jteki@openedev.com>
References: <1505302931-17387-1-git-send-email-jteki@openedev.com>
Message-ID: <1505302931-17387-6-git-send-email-jteki@openedev.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jagan Teki <jagan@amarulasolutions.com>

This patch add support for Open Frame C.TOUCH 12 Kit.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v3:
- newly added

 board/engicam/icorem6/genimage.cfg      | 3 ++-
 board/engicam/icorem6/readme.txt        | 2 ++
 configs/engicam_imx6qdl_icore_defconfig | 2 +-
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/board/engicam/icorem6/genimage.cfg b/board/engicam/icorem6/genimage.cfg
index 50c01bb..835d905 100644
--- a/board/engicam/icorem6/genimage.cfg
+++ b/board/engicam/icorem6/genimage.cfg
@@ -4,7 +4,8 @@ image boot.vfat {
 			"uImage",
 			"imx6dl-icore.dtb",
 			"imx6q-icore.dtb",
-			"imx6q-icore-ofcap10.dtb"
+			"imx6q-icore-ofcap10.dtb",
+			"imx6q-icore-ofcap12.dtb"
 		}
 	}
 	size = 64M
diff --git a/board/engicam/icorem6/readme.txt b/board/engicam/icorem6/readme.txt
index 7c256c4..bb04946 100644
--- a/board/engicam/icorem6/readme.txt
+++ b/board/engicam/icorem6/readme.txt
@@ -32,6 +32,8 @@ You will find the following files in output/images/:
   - imx6dl-icore.dtb
 - for i.CoreM6 Quad/Dual ofcap 10:
   - imx6q-icore-ofcap10.dtb
+- for i.CoreM6 Quad/Dual ofcap 12:
+  - imx6q-icore-ofcap12.dtb
   - rootfs.ext4
   - rootfs.tar
   - sdcard.img
diff --git a/configs/engicam_imx6qdl_icore_defconfig b/configs/engicam_imx6qdl_icore_defconfig
index 8e1908b..6090360 100644
--- a/configs/engicam_imx6qdl_icore_defconfig
+++ b/configs/engicam_imx6qdl_icore_defconfig
@@ -30,7 +30,7 @@ BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x10008000"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6dl-icore imx6q-icore imx6q-icore-ofcap10"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6dl-icore imx6q-icore imx6q-icore-ofcap10 imx6q-icore-ofcap12"
 
 # Filesystem
 BR2_TARGET_GENERIC_ISSUE="Welcome to Engicam i.CoreM6 Quad/Dual/DualLite/Solo"
-- 
2.7.4
