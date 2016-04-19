From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Apr 2016 23:25:32 +0200
Subject: [Buildroot] [git commit] gcc: disable split-stack for non-thread
	builds
Message-ID: <20160419212552.E1CF88179A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2631219f648f4aa13fa36d06a483e4507cb6f3d7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This fixes bug 8766:
https://bugs.busybox.net/show_bug.cgi?id=8766

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../4.8.5/930-libgcc-disable-split-stack-nothreads.patch   | 14 ++++++++++++++
 .../4.9.3/930-libgcc-disable-split-stack-nothreads.patch   | 14 ++++++++++++++
 .../5.3.0/930-libgcc-disable-split-stack-nothreads.patch   | 14 ++++++++++++++
 3 files changed, 42 insertions(+)

diff --git a/package/gcc/4.8.5/930-libgcc-disable-split-stack-nothreads.patch b/package/gcc/4.8.5/930-libgcc-disable-split-stack-nothreads.patch
new file mode 100644
index 0000000..7799c12
--- /dev/null
+++ b/package/gcc/4.8.5/930-libgcc-disable-split-stack-nothreads.patch
@@ -0,0 +1,14 @@
+disable split-stack for non-thread builds
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+
+diff -Nur gcc-4.8.5.orig/libgcc/config/t-stack gcc-4.8.5/libgcc/config/t-stack
+--- gcc-4.8.5.orig/libgcc/config/t-stack	2010-10-01 21:31:49.000000000 +0200
++++ gcc-4.8.5/libgcc/config/t-stack	2016-03-07 05:28:12.000000000 +0100
+@@ -1,4 +1,6 @@
+ # Makefile fragment to provide generic support for -fsplit-stack.
+ # This should be used in config.host for any host which supports
+ # -fsplit-stack.
++ifeq ($(enable_threads),yes)
+ LIB2ADD_ST += $(srcdir)/generic-morestack.c $(srcdir)/generic-morestack-thread.c
++endif
diff --git a/package/gcc/4.9.3/930-libgcc-disable-split-stack-nothreads.patch b/package/gcc/4.9.3/930-libgcc-disable-split-stack-nothreads.patch
new file mode 100644
index 0000000..670cf8d
--- /dev/null
+++ b/package/gcc/4.9.3/930-libgcc-disable-split-stack-nothreads.patch
@@ -0,0 +1,14 @@
+disable split-stack for non-thread builds
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+
+diff -Nur gcc-4.9.3.orig/libgcc/config/t-stack gcc-4.9.3/libgcc/config/t-stack
+--- gcc-4.9.3.orig/libgcc/config/t-stack	2010-10-01 21:31:49.000000000 +0200
++++ gcc-4.9.3/libgcc/config/t-stack	2016-03-07 01:34:32.000000000 +0100
+@@ -1,4 +1,6 @@
+ # Makefile fragment to provide generic support for -fsplit-stack.
+ # This should be used in config.host for any host which supports
+ # -fsplit-stack.
++ifeq ($(enable_threads),yes)
+ LIB2ADD_ST += $(srcdir)/generic-morestack.c $(srcdir)/generic-morestack-thread.c
++endif
diff --git a/package/gcc/5.3.0/930-libgcc-disable-split-stack-nothreads.patch b/package/gcc/5.3.0/930-libgcc-disable-split-stack-nothreads.patch
new file mode 100644
index 0000000..07f9a73
--- /dev/null
+++ b/package/gcc/5.3.0/930-libgcc-disable-split-stack-nothreads.patch
@@ -0,0 +1,14 @@
+disable split-stack for non-thread builds
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+
+diff -Nur gcc-5.3.0.orig/libgcc/config/t-stack gcc-5.3.0/libgcc/config/t-stack
+--- gcc-5.3.0.orig/libgcc/config/t-stack	2010-10-01 21:31:49.000000000 +0200
++++ gcc-5.3.0/libgcc/config/t-stack	2016-03-07 03:25:32.000000000 +0100
+@@ -1,4 +1,6 @@
+ # Makefile fragment to provide generic support for -fsplit-stack.
+ # This should be used in config.host for any host which supports
+ # -fsplit-stack.
++ifeq ($(enable_threads),yes)
+ LIB2ADD_ST += $(srcdir)/generic-morestack.c $(srcdir)/generic-morestack-thread.c
++endif
