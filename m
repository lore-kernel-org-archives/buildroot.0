From: Jagan Teki <jagannadh.teki@gmail.com>
Date: Wed, 13 Sep 2017 17:12:09 +0530
Subject: [Buildroot] [PATCH v3 4/6] board: icorem6: Add Qt5 configs for
	1280x800 LVDS display
In-Reply-To: <1505302931-17387-1-git-send-email-jteki@openedev.com>
References: <1505302931-17387-1-git-send-email-jteki@openedev.com>
Message-ID: <1505302931-17387-5-git-send-email-jteki@openedev.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jagan Teki <jagan@amarulasolutions.com>

i.CoreM6 OF C.TOUCH 10.1 Kit has 1280x800 LVDS display, this patch adds
relevant qt5 configs with supports opensource Etnaviv graphical stack.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v3:
- newly added

 board/engicam/icorem6/readme.txt                              |  6 ++++--
 .../icorem6/rootfs_overlay/root/imx6qdl-icore-ofcap10.json    | 11 +++++++++++
 configs/engicam_imx6qdl_icore_qt5_defconfig                   |  2 +-
 3 files changed, 16 insertions(+), 3 deletions(-)
 create mode 100644 board/engicam/icorem6/rootfs_overlay/root/imx6qdl-icore-ofcap10.json

diff --git a/board/engicam/icorem6/readme.txt b/board/engicam/icorem6/readme.txt
index e822ae0..7c256c4 100644
--- a/board/engicam/icorem6/readme.txt
+++ b/board/engicam/icorem6/readme.txt
@@ -70,8 +70,8 @@ To boot your newly created system:
 - close JM3 for sd boot.
 - power on the board.
 
-Testing graphics on i.CoreM6 Starter Kit:
-========================================
+Testing graphics on i.CoreM6:
+============================
 
 Running kmscube
 # kmscube -D /dev/dri/card1
@@ -82,6 +82,8 @@ Running glmark2-es2-drm
 Running Qt5 Cinematic Demo:
 - for i.CoreM6 Starter Kit
 # export QT_QPA_EGLFS_KMS_CONFIG=/root/imx6qdl-icore.json
+- for i.CoreM6 ofcap10
+# export QT_QPA_EGLFS_KMS_CONFIG=/root/imx6qdl-icore-ofcap10.json
 # CinematicExperience-demo
 
 Enjoy!
diff --git a/board/engicam/icorem6/rootfs_overlay/root/imx6qdl-icore-ofcap10.json b/board/engicam/icorem6/rootfs_overlay/root/imx6qdl-icore-ofcap10.json
new file mode 100644
index 0000000..963c7c0
--- /dev/null
+++ b/board/engicam/icorem6/rootfs_overlay/root/imx6qdl-icore-ofcap10.json
@@ -0,0 +1,11 @@
+{
+  "device": "/dev/dri/card1",
+  "hwcursor": false,
+  "pbuffers": true,
+  "outputs": [
+    {
+      "name": "LVDS-1",
+      "mode": "1280x800"
+    }
+  ]
+}
diff --git a/configs/engicam_imx6qdl_icore_qt5_defconfig b/configs/engicam_imx6qdl_icore_qt5_defconfig
index cf4439f..e53a151 100644
--- a/configs/engicam_imx6qdl_icore_qt5_defconfig
+++ b/configs/engicam_imx6qdl_icore_qt5_defconfig
@@ -30,7 +30,7 @@ BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x10008000"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6dl-icore imx6q-icore"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6dl-icore imx6q-icore imx6q-icore-ofcap10"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/engicam/icorem6/linux_qt5.fragment"
 
 # Filesystem
-- 
2.7.4
