From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Tue, 10 Oct 2017 22:43:30 +0200
Subject: [Buildroot] [RFC 3/3] stacks: add a bunch of stacks
In-Reply-To: <1507668210-5427-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1507668210-5427-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <1507668210-5427-4-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds a bunch of stacks to thinkering with.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 stacks/lamp_stack           | 10 ++++++++++
 stacks/mesa3d-etnaviv_stack |  7 +++++++
 stacks/qt5-demos_stack      |  7 +++++++
 stacks/qt5-fb_stack         | 11 +++++++++++
 4 files changed, 35 insertions(+)
 create mode 100644 stacks/lamp_stack
 create mode 100644 stacks/mesa3d-etnaviv_stack
 create mode 100644 stacks/qt5-demos_stack
 create mode 100644 stacks/qt5-fb_stack

diff --git a/stacks/lamp_stack b/stacks/lamp_stack
new file mode 100644
index 0000000..bc9b0f1
--- /dev/null
+++ b/stacks/lamp_stack
@@ -0,0 +1,10 @@
+# Linux Apache Mysql Php (LAMP stack)
+
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
+BR2_PACKAGE_PHP=y
+BR2_PACKAGE_PHP_EXT_DBA=y
+BR2_PACKAGE_PHP_EXT_PDO=y
+BR2_PACKAGE_PHP_EXT_PDO_MYSQL=y
+BR2_PACKAGE_MYSQL=y
+BR2_PACKAGE_ORACLE_MYSQL_SERVER=y
+BR2_PACKAGE_APACHE=y
diff --git a/stacks/mesa3d-etnaviv_stack b/stacks/mesa3d-etnaviv_stack
new file mode 100644
index 0000000..959967c
--- /dev/null
+++ b/stacks/mesa3d-etnaviv_stack
@@ -0,0 +1,7 @@
+# Mesa3D for boards based on Etnaviv driver
+BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
+BR2_PACKAGE_MESA3D=y
+BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV=y
+BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST=y
+BR2_PACKAGE_MESA3D_OPENGL_ES=y
diff --git a/stacks/qt5-demos_stack b/stacks/qt5-demos_stack
new file mode 100644
index 0000000..b00ef34
--- /dev/null
+++ b/stacks/qt5-demos_stack
@@ -0,0 +1,7 @@
+# QT5 demo packages
+BR2_PACKAGE_GLMARK2=y
+BR2_PACKAGE_MESA3D_DEMOS=y
+BR2_PACKAGE_KMSCUBE=y
+BR2_PACKAGE_QT5CINEX=y
+BR2_PACKAGE_QT5CINEX_HD=y
+BR2_PACKAGE_LIBV4L=y
diff --git a/stacks/qt5-fb_stack b/stacks/qt5-fb_stack
new file mode 100644
index 0000000..fcadde8
--- /dev/null
+++ b/stacks/qt5-fb_stack
@@ -0,0 +1,11 @@
+# QT5 stack based on the Linux famebuffer
+BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
+BR2_PACKAGE_QT5=y
+BR2_PACKAGE_QT5BASE_GUI=y
+BR2_PACKAGE_QT5BASE_OPENGL=y
+BR2_PACKAGE_QT5BASE_OPENGL_LIB=y
+BR2_PACKAGE_QT5BASE_LINUXFB=y
+BR2_PACKAGE_QT5BASE_FONTCONFIG=y
+BR2_PACKAGE_QT5BASE_GIF=y
+BR2_PACKAGE_QT5BASE_JPEG=y
-- 
2.7.4
