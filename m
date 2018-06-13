From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 13 Jun 2018 21:16:53 +0300
Subject: [Buildroot] [PATCH] f2fs-tools: fix build for uclinux
Message-ID: <c5e295a87573a1053f245875ade0b4acda1b61fc.1528913813.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a patch making uclinux also linux.

Fixes:
http://autobuild.buildroot.net/results/357/3577d413dc16bcec7a403fd8857ec5dd64470ba5/
http://autobuild.buildroot.net/results/819/819a8a528764a68c02b1b98431a1d09929c387f1/
http://autobuild.buildroot.net/results/d98/d987df1ea7f8043f05d5221342888892990e9252/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 ...0001-configure-uclinux-is-also-linux.patch | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 package/f2fs-tools/0001-configure-uclinux-is-also-linux.patch

diff --git a/package/f2fs-tools/0001-configure-uclinux-is-also-linux.patch b/package/f2fs-tools/0001-configure-uclinux-is-also-linux.patch
new file mode 100644
index 000000000000..dc91b22c83db
--- /dev/null
+++ b/package/f2fs-tools/0001-configure-uclinux-is-also-linux.patch
@@ -0,0 +1,31 @@
+From 67629fd736a8a4295a9f2acb96563953be22a3ae Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Wed, 13 Jun 2018 20:39:04 +0300
+Subject: [PATCH] configure: uclinux is also linux
+
+Linux systems on no-MMU platforms identify as uclinux. They are
+otherwise identical to plain Linux.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: sent to linux-f2fs-devel at lists.sourceforge.net
+
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index a3ff12bf3de9..2b13be5b09f9 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -166,7 +166,7 @@ build_mac=no
+ 
+ # Detect the target system
+ case "${host_os}" in
+-linux*)
++linux*|uclinux*)
+ 	build_linux=yes
+ 	;;
+ cygwin*|mingw*)
+-- 
+2.17.1
+
-- 
2.17.1
