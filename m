From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 13 Jun 2018 22:16:40 +0200
Subject: [Buildroot] [git commit] f2fs-tools: fix build for uclinux
Message-ID: <20180613201449.3CFC78842D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5b9c59707143f23ae0630c181794a3a3781bde3e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a patch making uclinux also linux.

Fixes:
http://autobuild.buildroot.net/results/357/3577d413dc16bcec7a403fd8857ec5dd64470ba5/
http://autobuild.buildroot.net/results/819/819a8a528764a68c02b1b98431a1d09929c387f1/
http://autobuild.buildroot.net/results/d98/d987df1ea7f8043f05d5221342888892990e9252/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-configure-uclinux-is-also-linux.patch     | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/package/f2fs-tools/0001-configure-uclinux-is-also-linux.patch b/package/f2fs-tools/0001-configure-uclinux-is-also-linux.patch
new file mode 100644
index 0000000000..dc91b22c83
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
