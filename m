From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 16 Feb 2016 00:33:27 +0100
Subject: [Buildroot] [PATCH] package/util-linux: fix typo in configure.ac
Message-ID: <1455579207-5784-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/993/9935cd0522d4f978ba2e788a690f66790686b76b

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Lada Trimasova <ltrimas@synopsys.com>
---
 package/util-linux/0007-build-sys-fix-typo.patch | 34 ++++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 package/util-linux/0007-build-sys-fix-typo.patch

diff --git a/package/util-linux/0007-build-sys-fix-typo.patch b/package/util-linux/0007-build-sys-fix-typo.patch
new file mode 100644
index 0000000..d6aad4c
--- /dev/null
+++ b/package/util-linux/0007-build-sys-fix-typo.patch
@@ -0,0 +1,34 @@
+From dea1bd2917ed9490ee96162288e0904e3de9da2d Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Tue, 16 Feb 2016 00:24:30 +0100
+Subject: [PATCH] build-sys: fix typo
+
+When timer_create is available have_timer must be
+set to "yes". But instead have_time is used.
+
+Replace have_time by have_timer.
+
+Fixes:
+http://autobuild.buildroot.net/results/993/9935cd0522d4f978ba2e788a690f66790686b76b
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 4559573..3950f0c 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -390,7 +390,7 @@ AC_CHECK_FUNCS([clock_gettime], [],
+ 
+ have_timer="no"
+ AC_CHECK_FUNCS([timer_create],
+-	[have_time="yes"],
++	[have_timer="yes"],
+ 	[AC_CHECK_LIB([rt], [timer_create], [
+ 		have_timer="yes"
+ 		REALTIME_LIBS="-lrt"
+-- 
+2.5.0
+
-- 
2.5.0
