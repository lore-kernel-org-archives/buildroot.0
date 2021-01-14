From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 14 Jan 2021 08:48:03 +0100
Subject: [Buildroot] [PATCH 1/1] package/rhash: fix build with uclinux
Message-ID: <20210114074803.125721-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/598ca65cf0c7ecf9ceaecb75868b656570ae00d2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0002-configure-add-uclinux-target.patch   | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 package/rhash/0002-configure-add-uclinux-target.patch

diff --git a/package/rhash/0002-configure-add-uclinux-target.patch b/package/rhash/0002-configure-add-uclinux-target.patch
new file mode 100644
index 0000000000..ca4a55644e
--- /dev/null
+++ b/package/rhash/0002-configure-add-uclinux-target.patch
@@ -0,0 +1,36 @@
+From 683f6875313cab9643402bb1710ebabb76e7c018 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 14 Jan 2021 08:37:06 +0100
+Subject: [PATCH] configure: add uclinux target
+
+Fix the following build failure with
+--target=arm-buildroot-uclinux-uclibcgnueabi:
+
+Checking for target OS ... UNKNOWN
+
+Error: Unknown target OS, please specify the --target option
+
+Fixes:
+ - http://autobuild.buildroot.org/results/598ca65cf0c7ecf9ceaecb75868b656570ae00d2
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ configure | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure b/configure
+index c8e1ea7..aae4dce 100755
+--- a/configure
++++ b/configure
+@@ -426,7 +426,7 @@ else
+     component=$1
+     part=$(echo $BUILD_TARGET | cut -d '-' -f $component)
+     case "$(echo $part | tr '[A-Z]' '[a-z]')" in
+-      linux) TARGET_OS=Linux ;;
++      linux|uclinux) TARGET_OS=Linux ;;
+       freebsd*) TARGET_OS=FreeBSD ;;
+       gnu/kfreebsd) TARGET_OS=FreeBSD ;;
+       netbsd) TARGET_OS=NetBSD ;;
+-- 
+2.29.2
+
-- 
2.29.2
