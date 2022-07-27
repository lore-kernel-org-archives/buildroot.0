Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B765FC04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 15:03:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48351402C6;
	Wed, 27 Jul 2022 15:03:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48351402C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k8a_ak0nwFrJ; Wed, 27 Jul 2022 15:03:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A8B9402A1;
	Wed, 27 Jul 2022 15:03:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A8B9402A1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 015A91BF4E4
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 15:02:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CF82D4013D
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 15:02:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF82D4013D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I0-QlH4lHMTi for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 15:02:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6E086405E0
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 15:02:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6E086405E0
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 29C86866D0; Wed, 27 Jul 2022 14:48:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 17:00:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 60fd21238508a513ab53bcb67d5e63053485bafb
X-Git-Newrev: 84fe8e694eb201b52e2911006ac87473376ce8e5
X-Patchwork-Hint: ignore
Message-Id: <20220727144847.29C86866D0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package: drop csky support in
 toolchain-related packages
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=84fe8e694eb201b52e2911006ac87473376ce8e5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Guo Ren <ren_guo@c-sky.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Makefile.in                                |   9 -
 package/binutils/Config.in.host                    |   3 +-
 package/gcc/Config.in.host                         |   4 -
 ...01-Fix-Python3.9-related-runtime-problems.patch | 193 ---------------------
 package/gdb/Config.in                              |   1 -
 package/gdb/Config.in.host                         |   2 -
 package/gdb/gdb.hash                               |   3 -
 package/gdb/gdb.mk                                 |   6 -
 package/glibc/Config.in                            |   1 -
 package/linux-headers/Config.in.host               |   3 -
 10 files changed, 1 insertion(+), 224 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 580e9d14ca..ff60f85092 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -75,15 +75,6 @@ ABI := $(ABI)hf
 endif
 endif
 
-# For C-SKY abiv1 & abiv2
-ifeq ($(BR2_csky),y)
-ifeq ($(BR2_ck610),y)
-ABI = abiv1
-else
-ABI = abiv2
-endif
-endif
-
 # For FSL PowerPC there's SPE
 ifeq ($(BR2_powerpc_SPE),y)
 ABI = spe
diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 5bdda25faf..9fa0cc4e8d 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -7,14 +7,13 @@ config BR2_PACKAGE_HOST_BINUTILS_SUPPORTS_CFI
 
 choice
 	prompt "Binutils Version"
-	default BR2_BINUTILS_VERSION_2_37_X if !BR2_arc && !BR2_csky
+	default BR2_BINUTILS_VERSION_2_37_X if !BR2_arc
 	default BR2_BINUTILS_VERSION_ARC if BR2_arc
 	help
 	  Select the version of binutils you wish to use.
 
 config BR2_BINUTILS_VERSION_2_36_X
 	bool "binutils 2.36.1"
-	depends on !BR2_csky
 
 config BR2_BINUTILS_VERSION_2_37_X
 	bool "binutils 2.37"
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 74abad71d7..ba2a2ee072 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -27,10 +27,6 @@ config BR2_GCC_VERSION_10_X
 	# powerpc spe support has been deprecated since gcc 8.x.
 	# https://gcc.gnu.org/ml/gcc/2018-04/msg00102.html
 	depends on !BR2_powerpc_SPE
-	# C-SKY sk610 needs abiv1, which is not supported in
-	# upstream gcc. C-SKY gcc upstream support not tested
-	# with upstream binutils and glibc.
-	depends on !BR2_csky
 	# ARC HS48 rel 31 only supported by gcc arc fork.
 	depends on !BR2_archs4x_rel31
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
diff --git a/package/gdb/4ecb98fbc2f94dbe01b69384afbc515107de73df/0001-Fix-Python3.9-related-runtime-problems.patch b/package/gdb/4ecb98fbc2f94dbe01b69384afbc515107de73df/0001-Fix-Python3.9-related-runtime-problems.patch
deleted file mode 100644
index 8c2a9d3d5b..0000000000
--- a/package/gdb/4ecb98fbc2f94dbe01b69384afbc515107de73df/0001-Fix-Python3.9-related-runtime-problems.patch
+++ /dev/null
@@ -1,193 +0,0 @@
-From 8342feee01e4e8d38affcf35e47ad900567f42e0 Mon Sep 17 00:00:00 2001
-From: Kevin Buettner <kevinb@redhat.com>
-Date: Wed, 27 May 2020 20:05:40 -0700
-Subject: [PATCH] Fix Python3.9 related runtime problems
-
-Python3.9b1 is now available on Rawhide.  GDB w/ Python 3.9 support
-can be built using the configure switch -with-python=/usr/bin/python3.9.
-
-Attempting to run gdb/Python3.9 segfaults on startup:
-
-    #0  0x00007ffff7b0582c in PyEval_ReleaseLock () from /lib64/libpython3.9.so.1.0
-    #1  0x000000000069ccbf in do_start_initialization ()
-	at worktree-test1/gdb/python/python.c:1789
-    #2  _initialize_python ()
-	at worktree-test1/gdb/python/python.c:1877
-    #3  0x00000000007afb0a in initialize_all_files () at init.c:237
-    ...
-
-Consulting the the documentation...
-
-https://docs.python.org/3/c-api/init.html
-
-...we find that PyEval_ReleaseLock() has been deprecated since version
-3.2.  It recommends using PyEval_SaveThread or PyEval_ReleaseThread()
-instead.  In do_start_initialization, in gdb/python/python.c, we
-can replace the calls to PyThreadState_Swap() and PyEval_ReleaseLock()
-with a single call to PyEval_SaveThread.   (Thanks to Keith Seitz
-for working this out.)
-
-With that in place, GDB gets a little bit further.  It still dies
-on startup, but the backtrace is different:
-
-    #0  0x00007ffff7b04306 in PyOS_InterruptOccurred ()
-       from /lib64/libpython3.9.so.1.0
-    #1  0x0000000000576e86 in check_quit_flag ()
-	at worktree-test1/gdb/extension.c:776
-    #2  0x0000000000576f8a in set_active_ext_lang (now_active=now_active@entry=0x983c00 <extension_language_python>)
-	at worktree-test1/gdb/extension.c:705
-    #3  0x000000000069d399 in gdbpy_enter::gdbpy_enter (this=0x7fffffffd2d0,
-	gdbarch=0x0, language=0x0)
-	at worktree-test1/gdb/python/python.c:211
-    #4  0x0000000000686e00 in python_new_inferior (inf=0xddeb10)
-	at worktree-test1/gdb/python/py-inferior.c:251
-    #5  0x00000000005d9fb9 in std::function<void (inferior*)>::operator()(inferior*) const (__args#0=<optimized out>, this=0xccad20)
-	at /usr/include/c++/10/bits/std_function.h:617
-    #6  gdb::observers::observable<inferior*>::notify (args#0=0xddeb10,
-	this=<optimized out>)
-	at worktree-test1/gdb/../gdbsupport/observable.h:106
-    #7  add_inferior_silent (pid=0)
-	at worktree-test1/gdb/inferior.c:113
-    #8  0x00000000005dbcb8 in initialize_inferiors ()
-	at worktree-test1/gdb/inferior.c:947
-    ...
-
-We checked with some Python Developers and were told that we should
-acquire the GIL prior to calling any Python C API function.  We
-definitely don't have the GIL for calls of PyOS_InterruptOccurred().
-
-I moved class_gdbpy_gil earlier in the file and use it in
-gdbpy_check_quit_flag() to acquire (and automatically release) the
-GIL.
-
-With those changes in place, I was able to run to a GDB prompt.  But,
-when trying to quit, it segfaulted again due to due to some other
-problems with gdbpy_check_quit_flag():
-
-    Thread 1 "gdb" received signal SIGSEGV, Segmentation fault.
-    0x00007ffff7bbab0c in new_threadstate () from /lib64/libpython3.9.so.1.0
-    (top-gdb) bt 8
-    #0  0x00007ffff7bbab0c in new_threadstate () from /lib64/libpython3.9.so.1.0
-    #1  0x00007ffff7afa5ea in PyGILState_Ensure.cold ()
-       from /lib64/libpython3.9.so.1.0
-    #2  0x000000000069b58c in gdbpy_gil::gdbpy_gil (this=<synthetic pointer>)
-	at worktree-test1/gdb/python/python.c:278
-    #3  gdbpy_check_quit_flag (extlang=<optimized out>)
-	at worktree-test1/gdb/python/python.c:278
-    #4  0x0000000000576e96 in check_quit_flag ()
-	at worktree-test1/gdb/extension.c:776
-    #5  0x000000000057700c in restore_active_ext_lang (previous=0xe9c050)
-	at worktree-test1/gdb/extension.c:729
-    #6  0x000000000088913a in do_my_cleanups (
-	pmy_chain=0xc31870 <final_cleanup_chain>,
-	old_chain=0xae5720 <sentinel_cleanup>)
-	at worktree-test1/gdbsupport/cleanups.cc:131
-    #7  do_final_cleanups ()
-	at worktree-test1/gdbsupport/cleanups.cc:143
-
-In this case, we're trying to call a Python C API function after
-Py_Finalize() has been called from finalize_python().  I made
-finalize_python set gdb_python_initialized to false and then cause
-check_quit_flag() to return early when it's false.
-
-With these changes in place, GDB seems to be working again with
-Python3.9b1.  I think it likely that there are other problems lurking.
-I wouldn't be surprised to find that there are other calls into Python
-where we don't first make sure that we have the GIL.  Further changes
-may well be needed.
-
-I see no regressions testing on Rawhide using a GDB built with the
-default Python version (3.8.3) versus one built using Python 3.9b1.
-
-I've also tested on Fedora 28, 29, 30, 31, and 32 (all x86_64) using
-the default (though updated) system installed versions of Python on
-those OSes.  This means that I've tested against Python versions
-2.7.15, 2.7.17, 2.7.18, 3.7.7, 3.8.2, and 3.8.3.  In each case GDB
-still builds without problem and shows no regressions after applying
-this patch.
-
-gdb/ChangeLog:
-
-2020-MM-DD  Kevin Buettner  <kevinb@redhat.com>
-	    Keith Seitz  <keiths@redhat.com>
-
-	* python/python.c (do_start_initialization): For Python 3.9 and
-	later, call PyEval_SaveThread instead of PyEval_ReleaseLock.
-	(class gdbpy_gil): Move to earlier in file.
-	(finalize_python): Set gdb_python_initialized.
-	(gdbpy_check_quit_flag): Acquire GIL via gdbpy_gil.  Return early
-	when not initialized.
-
-[import into Buildroot, removing ChangeLog change to avoid conflict]
-Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
----
- gdb/python/python.c | 32 ++++++++++++++++++++++++++++++--
- 1 file changed, 30 insertions(+), 2 deletions(-)
-
-diff --git a/gdb/python/python.c b/gdb/python/python.c
-index b00b70be85b..0eee3f0397c 100644
---- a/gdb/python/python.c
-+++ b/gdb/python/python.c
-@@ -268,6 +268,30 @@ ensure_python_env (struct gdbarch *gdbarch,
-   return make_cleanup (restore_python_env, env);
- }
- 
-+/* A helper class to save and restore the GIL, but without touching
-+   the other globals that are handled by gdbpy_enter.  */
-+
-+class gdbpy_gil
-+{
-+public:
-+
-+  gdbpy_gil ()
-+    : m_state (PyGILState_Ensure ())
-+  {
-+  }
-+
-+  ~gdbpy_gil ()
-+  {
-+    PyGILState_Release (m_state);
-+  }
-+
-+  DISABLE_COPY_AND_ASSIGN (gdbpy_gil);
-+
-+private:
-+
-+  PyGILState_STATE m_state;
-+};
-+
- /* Set the quit flag.  */
- 
- static void
-@@ -281,6 +305,10 @@ gdbpy_set_quit_flag (const struct extension_language_defn *extlang)
- static int
- gdbpy_check_quit_flag (const struct extension_language_defn *extlang)
- {
-+  if (!gdb_python_initialized)
-+    return 0;
-+
-+  gdbpy_gil gil;
-   return PyOS_InterruptOccurred ();
- }
- 
-@@ -1620,6 +1648,7 @@ finalize_python (void *ignore)
- 
-   Py_Finalize ();
- 
-+  gdb_python_initialized = false;
-   restore_active_ext_lang (previous_active);
- }
- #endif
-@@ -1854,8 +1883,7 @@ message == an error message without a stack will be printed."),
-     goto fail;
- 
-   /* Release the GIL while gdb runs.  */
--  PyThreadState_Swap (NULL);
--  PyEval_ReleaseLock ();
-+  PyEval_SaveThread ();
- 
-   make_final_cleanup (finalize_python, NULL);
- 
--- 
-2.31.1
-
diff --git a/package/gdb/Config.in b/package/gdb/Config.in
index a39837fe71..cf5a2a892c 100644
--- a/package/gdb/Config.in
+++ b/package/gdb/Config.in
@@ -52,7 +52,6 @@ config BR2_PACKAGE_GDB_DEBUGGER
 	bool "full debugger"
 	depends on BR2_USE_WCHAR
 	depends on !BR2_sh
-	depends on !BR2_csky
 	select BR2_PACKAGE_GMP if BR2_GDB_VERSION_11
 	select BR2_PACKAGE_NCURSES
 
diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 43af64a1ed..15d5f52a36 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -44,7 +44,6 @@ choice
 	prompt "GDB debugger Version"
 	default BR2_GDB_VERSION_10
 	depends on !BR2_arc
-	depends on !BR2_csky
 	help
 	  Select the version of gdb you wish to use.
 
@@ -67,7 +66,6 @@ endif
 config BR2_GDB_VERSION
 	string
 	default "arc-2020.09-release-gdb" if BR2_arc
-	default "4ecb98fbc2f94dbe01b69384afbc515107de73df" if BR2_csky
 	default "9.2"      if BR2_GDB_VERSION_9_2
 	default "10.2"	   if BR2_GDB_VERSION_10 || !BR2_PACKAGE_HOST_GDB
 	default "11.2"     if BR2_GDB_VERSION_11
diff --git a/package/gdb/gdb.hash b/package/gdb/gdb.hash
index e7933374f1..cb7f4c805d 100644
--- a/package/gdb/gdb.hash
+++ b/package/gdb/gdb.hash
@@ -5,6 +5,3 @@ sha512  07e9026423438049b11f4f784d57401ece4e940570f613bd6958b3714fe7fbc2c048470b
 
 # Locally calculated (fetched from Github)
 sha512  5a2acf2fd33ab2ff589e1037ca40abda54328997dcff26b2b49b874bd3be980be5a63342962254f3c3bda98e32ce7a33af704d37353352833dee193135600458  gdb-arc-2020.09-release-gdb.tar.gz
-
-# Locally calculated (fetched from https://github.com/c-sky/binutils-gdb)
-sha512  c421e1f3c0d6cfb3c04544573c0c4b0075c8d8e3d563c6c234fcc1e4c2167ab203d1e57aec3b58abd348dc46f8cf9b47b753d3a43dba3ea970c9c9a6bd78c07b  gdb-4ecb98fbc2f94dbe01b69384afbc515107de73df.tar.gz
diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 9bde2beea1..86e57481de 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -14,12 +14,6 @@ GDB_SOURCE = gdb-$(GDB_VERSION).tar.gz
 GDB_FROM_GIT = y
 endif
 
-ifeq ($(BR2_csky),y)
-GDB_SITE = $(call github,c-sky,binutils-gdb,$(GDB_VERSION))
-GDB_SOURCE = gdb-$(GDB_VERSION).tar.gz
-GDB_FROM_GIT = y
-endif
-
 GDB_LICENSE = GPL-2.0+, LGPL-2.0+, GPL-3.0+, LGPL-3.0+
 GDB_LICENSE_FILES = COPYING COPYING.LIB COPYING3 COPYING3.LIB
 GDB_CPE_ID_VENDOR = gnu
diff --git a/package/glibc/Config.in b/package/glibc/Config.in
index c0526cdd9e..23cbfcd9aa 100644
--- a/package/glibc/Config.in
+++ b/package/glibc/Config.in
@@ -21,7 +21,6 @@ config BR2_PACKAGE_GLIBC_ARCH_SUPPORTS
 	default y if BR2_microblaze
 	default y if BR2_nios2
 	default y if BR2_arc && BR2_ARC_ATOMIC_EXT
-	default y if BR2_csky
 	depends on !BR2_powerpc_SPE
 	depends on BR2_RISCV_ISA_RVA || !BR2_riscv
 	depends on BR2_USE_MMU
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 678c3d35f7..c2e872abfb 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -30,18 +30,15 @@ config BR2_KERNEL_HEADERS_AS_KERNEL
 config BR2_KERNEL_HEADERS_4_9
 	bool "Linux 4.9.x kernel headers"
 	depends on !BR2_riscv
-	depends on !BR2_csky
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
 
 config BR2_KERNEL_HEADERS_4_14
 	bool "Linux 4.14.x kernel headers"
 	depends on !BR2_riscv
-	depends on !BR2_csky
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
 
 config BR2_KERNEL_HEADERS_4_19
 	bool "Linux 4.19.x kernel headers"
-	depends on !BR2_csky
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
 
 config BR2_KERNEL_HEADERS_5_4
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
