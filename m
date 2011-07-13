From: benoit.mauduit at gmail.com <benoit.mauduit@gmail.com>
Date: Wed, 13 Jul 2011 17:52:59 +0200
Subject: [Buildroot] [PATCH 1/2] linux: Add Linux Kernel extensions menu
In-Reply-To: <1310572380-26403-1-git-send-email-benoit.mauduit@gmail.com>
References: <1310572380-26403-1-git-send-email-benoit.mauduit@gmail.com>
Message-ID: <1310572380-26403-2-git-send-email-benoit.mauduit@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Benoit Mauduit <benoit.mauduit@openwide.fr>

Add a kernel sub-menu (called "Linux Kernel Extensions"), which makes
possible to patch it or tweak the kernel build step.

 * All linux/*.mk files will be read by the make process.
 * The menu can be customized in "linux/Config.ext.in".

Signed-off-by: Benoit Mauduit <benoit.mauduit@openwide.fr>
---
 Makefile            |    2 +-
 linux/Config.ext.in |    3 +++
 linux/Config.in     |    4 ++++
 3 files changed, 8 insertions(+), 1 deletions(-)
 create mode 100644 linux/Config.ext.in

diff --git a/Makefile b/Makefile
index 2f3802c..27e4375 100644
--- a/Makefile
+++ b/Makefile
@@ -313,7 +313,7 @@ include package/*/*.mk
 
 include boot/common.mk
 include target/Makefile.in
-include linux/linux.mk
+include linux/*.mk
 
 TARGETS+=target-finalize
 
diff --git a/linux/Config.ext.in b/linux/Config.ext.in
new file mode 100644
index 0000000..50e801d
--- /dev/null
+++ b/linux/Config.ext.in
@@ -0,0 +1,3 @@
+menu "Linux Kernel Extensions"
+
+endmenu
diff --git a/linux/Config.in b/linux/Config.in
index 8d3b0ba..3a22686 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -176,6 +176,10 @@ config BR2_LINUX_KERNEL_INSTALL_TARGET
 	  /boot in the target root filesystem, as is typically done on
 	  x86/x86_64 systems.
 
+
+# Linux extensions (Xenomai)
+source "linux/Config.ext.in"
+
 endif # BR2_LINUX_KERNEL
 
 endmenu
-- 
1.7.6
