From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sat, 2 Jul 2016 20:53:27 +0200
Subject: [Buildroot] [PATCH] gcc: uClinux supports POSIX threads
Message-ID: <20160702185327.GA17114@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes for example boost compile errors for m68k-nommu or
arm cortex-m4.
Following autobuild failures fixed:
http://autobuild.buildroot.net/results/f95511e839d85ea18c5b150a59e994ef069601a1/
http://autobuild.buildroot.net/results/ff2b8be247e50c170b6317886509cc2922e1c77e/

Tested-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/gcc/4.8.5/940-uclinux-enable-threads.patch | 19 +++++++++++++++++++
 package/gcc/4.9.3/940-uclinux-enable-threads.patch | 19 +++++++++++++++++++
 package/gcc/5.4.0/940-uclinux-enable-threads.patch | 19 +++++++++++++++++++
 package/gcc/6.1.0/940-uclinux-enable-threads.patch | 19 +++++++++++++++++++
 4 files changed, 76 insertions(+)
 create mode 100644 package/gcc/4.8.5/940-uclinux-enable-threads.patch
 create mode 100644 package/gcc/4.9.3/940-uclinux-enable-threads.patch
 create mode 100644 package/gcc/5.4.0/940-uclinux-enable-threads.patch
 create mode 100644 package/gcc/6.1.0/940-uclinux-enable-threads.patch

diff --git a/package/gcc/4.8.5/940-uclinux-enable-threads.patch b/package/gcc/4.8.5/940-uclinux-enable-threads.patch
new file mode 100644
index 0000000..7e53e83
--- /dev/null
+++ b/package/gcc/4.8.5/940-uclinux-enable-threads.patch
@@ -0,0 +1,19 @@
+Enable POSIX threads for uClinux targets
+Reported upstream:
+https://gcc.gnu.org/bugzilla/show_bug.cgi?id=71721
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org> 
+
+diff -Nur gcc-4.8.5.orig/gcc/config.gcc gcc-4.8.5/gcc/config.gcc
+--- gcc-4.8.5.orig/gcc/config.gcc	2015-05-21 22:57:29.000000000 +0200
++++ gcc-4.8.5/gcc/config.gcc	2016-07-02 20:35:24.107644834 +0200
+@@ -741,6 +741,9 @@
+ *-*-uclinux*)
+   extra_options="$extra_options gnu-user.opt"
+   use_gcc_stdint=wrap
++  case ${enable_threads} in
++    "" | yes | posix) thread_file='posix' ;;
++  esac
+   tm_defines="$tm_defines DEFAULT_LIBC=LIBC_UCLIBC SINGLE_LIBC"
+   ;;
+ *-*-rdos*)
diff --git a/package/gcc/4.9.3/940-uclinux-enable-threads.patch b/package/gcc/4.9.3/940-uclinux-enable-threads.patch
new file mode 100644
index 0000000..7520fdb
--- /dev/null
+++ b/package/gcc/4.9.3/940-uclinux-enable-threads.patch
@@ -0,0 +1,19 @@
+Enable POSIX threads for uClinux targets
+Reported upstream:
+https://gcc.gnu.org/bugzilla/show_bug.cgi?id=71721
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org> 
+
+diff -Nur gcc-4.9.3.orig/gcc/config.gcc gcc-4.9.3/gcc/config.gcc
+--- gcc-4.9.3.orig/gcc/config.gcc	2015-05-21 22:50:59.000000000 +0200
++++ gcc-4.9.3/gcc/config.gcc	2016-06-30 22:05:21.338233965 +0200
+@@ -807,6 +807,9 @@
+ *-*-uclinux*)
+   extra_options="$extra_options gnu-user.opt"
+   use_gcc_stdint=wrap
++  case ${enable_threads} in
++    "" | yes | posix) thread_file='posix' ;;
++  esac
+   tm_defines="$tm_defines DEFAULT_LIBC=LIBC_UCLIBC SINGLE_LIBC"
+   ;;
+ *-*-rdos*)
diff --git a/package/gcc/5.4.0/940-uclinux-enable-threads.patch b/package/gcc/5.4.0/940-uclinux-enable-threads.patch
new file mode 100644
index 0000000..bb1578a
--- /dev/null
+++ b/package/gcc/5.4.0/940-uclinux-enable-threads.patch
@@ -0,0 +1,19 @@
+Enable POSIX threads for uClinux targets
+Reported upstream:
+https://gcc.gnu.org/bugzilla/show_bug.cgi?id=71721
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org> 
+
+diff -Nur gcc-5.4.0.orig/gcc/config.gcc gcc-5.4.0/gcc/config.gcc
+--- gcc-5.4.0.orig/gcc/config.gcc	2015-09-10 16:17:53.000000000 +0200
++++ gcc-5.4.0/gcc/config.gcc	2016-07-01 21:26:02.772958441 +0200
+@@ -808,6 +808,9 @@
+ *-*-uclinux*)
+   extra_options="$extra_options gnu-user.opt"
+   use_gcc_stdint=wrap
++  case ${enable_threads} in
++    "" | yes | posix) thread_file='posix' ;;
++  esac
+   tm_defines="$tm_defines DEFAULT_LIBC=LIBC_UCLIBC SINGLE_LIBC"
+   ;;
+ *-*-rdos*)
diff --git a/package/gcc/6.1.0/940-uclinux-enable-threads.patch b/package/gcc/6.1.0/940-uclinux-enable-threads.patch
new file mode 100644
index 0000000..3d2e5f0
--- /dev/null
+++ b/package/gcc/6.1.0/940-uclinux-enable-threads.patch
@@ -0,0 +1,19 @@
+Enable POSIX threads for uClinux targets
+Reported upstream:
+https://gcc.gnu.org/bugzilla/show_bug.cgi?id=71721
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org> 
+
+diff -Nur gcc-6.1.0.orig/gcc/config.gcc gcc-6.1.0/gcc/config.gcc
+--- gcc-6.1.0.orig/gcc/config.gcc	2016-04-11 12:14:59.000000000 +0200
++++ gcc-6.1.0/gcc/config.gcc	2016-07-02 20:04:25.732169982 +0200
+@@ -833,6 +833,9 @@
+ *-*-uclinux*)
+   extra_options="$extra_options gnu-user.opt"
+   use_gcc_stdint=wrap
++  case ${enable_threads} in
++    "" | yes | posix) thread_file='posix' ;;
++  esac
+   tm_defines="$tm_defines DEFAULT_LIBC=LIBC_UCLIBC SINGLE_LIBC"
+   ;;
+ *-*-rdos*)
-- 
2.1.4
