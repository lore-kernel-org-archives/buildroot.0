From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu,  6 May 2021 07:59:24 +0200
Subject: [Buildroot] [PATCH 1/1] package/gdb: fix gdbserver build with m68k
 and uclibc
Message-ID: <20210506055924.1846541-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Allow to build gdbserver with m68k and uclibc. This patch is not needed
for version above 9.2 because build_gdbserver as been
moved to its own file since
https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=919adfe8409211c726c1d05b47ca59890ee648f1

This new file (gdbserver/configure.srv) does not seem to be affected by
this issue

Fixes:
 - http://autobuild.buildroot.org/results/f4d6d9d8418c0da48a3db4ad5a82e19bd16eae34

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...t-build-gdbserver-with-m68k-and-ucli.patch | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 package/gdb/9.2/0007-gdb-configure.tgt-build-gdbserver-with-m68k-and-ucli.patch

diff --git a/package/gdb/9.2/0007-gdb-configure.tgt-build-gdbserver-with-m68k-and-ucli.patch b/package/gdb/9.2/0007-gdb-configure.tgt-build-gdbserver-with-m68k-and-ucli.patch
new file mode 100644
index 0000000000..1ac71ac2cf
--- /dev/null
+++ b/package/gdb/9.2/0007-gdb-configure.tgt-build-gdbserver-with-m68k-and-ucli.patch
@@ -0,0 +1,34 @@
+From 113bd123514265b867f50a956398a85f1d75215e Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 6 May 2021 07:45:00 +0200
+Subject: [PATCH] gdb/configure.tgt: build gdbserver with m68k and
+ uclibc
+
+Allow to build gdbserver with m68k and uclibc:
+
+checking whether gdbserver is supported on this host... no
+configure: error: Automatic gdbserver build is not supported for this configuration
+
+Fixes:
+ - http://autobuild.buildroot.org/results/f4d6d9d8418c0da48a3db4ad5a82e19bd16eae34
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ gdb/configure.tgt | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/gdb/configure.tgt b/gdb/configure.tgt
+index caa42be1c01..56d205fe24b 100644
+--- a/gdb/configure.tgt
++++ b/gdb/configure.tgt
+@@ -376,6 +376,7 @@ m68*-*-aout* | m68*-*-coff* | m68*-*-elf* | m68*-*-rtems* | m68*-*-uclinux* | \
+ fido-*-elf*)
+ 	# Target: Motorola m68k embedded
+ 	gdb_target_obs="m68k-tdep.o"
++	build_gdbserver=yes
+ 	;;
+ m68*-*-linux*)
+ 	# Target: Motorola m68k with a.out and ELF
+-- 
+2.30.2
+
-- 
2.30.2
