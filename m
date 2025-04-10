Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F55CC3601E
	for <buildroot@archiver.kernel.org>; Thu, 10 Apr 2025 19:23:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD36C60AA2;
	Thu, 10 Apr 2025 19:23:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TqCzbd_g83ZF; Thu, 10 Apr 2025 19:23:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E66E461B12
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E66E461B12;
	Thu, 10 Apr 2025 19:23:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 16097138
 for <buildroot@buildroot.org>; Thu, 10 Apr 2025 19:23:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EFEE781209
 for <buildroot@buildroot.org>; Thu, 10 Apr 2025 19:23:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HkeRe1c6pIVZ for <buildroot@buildroot.org>;
 Thu, 10 Apr 2025 19:23:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B33C80EFA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9B33C80EFA
 for <buildroot@buildroot.org>; Thu, 10 Apr 2025 19:23:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 996EF83FDF; Thu, 10 Apr 2025 19:23:43 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu, 10 Apr 2025 21:13:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ed408d6fdefb80b9b8d019014b1a9b0558329a3c
X-Git-Newrev: 5468334bb000118664ecf3b495f20f841fcc2708
X-Patchwork-Hint: ignore
Message-Id: <20250410192343.996EF83FDF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python3: bump to 3.13.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5468334bb000118664ecf3b495f20f841fcc2708
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For change log, see:
https://docs.python.org/release/3.13.3/whatsnew/changelog.html#python-3-13-3-final

Drop backported patches which have been included in the release.

Fixup the tk module patch to apply cleanly on 3.13.3

Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
[Julien: add link to change log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...06-Add-an-option-to-disable-the-tk-module.patch |  12 +--
 ...-thread-identifiers-on-32-bit-musl-builds.patch | 100 ---------------------
 ...296-Fix-pyatomic.h-include-paths-GH-12932.patch |  63 -------------
 ...675-Fix-mi_atomic_yield-in-mimalloc-on-32.patch |  80 -----------------
 package/python3/python3.hash                       |   6 +-
 package/python3/python3.mk                         |   2 +-
 6 files changed, 11 insertions(+), 252 deletions(-)

diff --git a/package/python3/0006-Add-an-option-to-disable-the-tk-module.patch b/package/python3/0006-Add-an-option-to-disable-the-tk-module.patch
index 6dc5d9f837..054a676b03 100644
--- a/package/python3/0006-Add-an-option-to-disable-the-tk-module.patch
+++ b/package/python3/0006-Add-an-option-to-disable-the-tk-module.patch
@@ -1,4 +1,4 @@
-From 0b04847e1007f5d34b986eb12ae63f140d14b01e Mon Sep 17 00:00:00 2001
+From bd14e6f232232c11b67477a5d8f0caf174a089d0 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 22 Feb 2017 17:23:42 -0800
 Subject: [PATCH] Add an option to disable the tk module
@@ -17,13 +17,15 @@ Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
 [ Vincent Fazio: ported to Python 3.13.2 ]
 Signed-off-by: Vincent Fazio <vfazio@gmail.com>
+[ Vincent Fazio: fix Python 3.13.3 conflict ]
+Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
 ---
  Makefile.pre.in | 8 +++++---
  configure.ac    | 7 +++++++
  2 files changed, 12 insertions(+), 3 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 88a48eb5333..6d6631cbe31 100644
+index 0f394d6ece4..a44307a0fb1 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
 @@ -2331,7 +2331,6 @@ LIBSUBDIRS=	asyncio \
@@ -42,15 +44,15 @@ index 88a48eb5333..6d6631cbe31 100644
  		test/test_tomllib \
  		test/test_tomllib/data \
  		test/test_tomllib/data/invalid \
-@@ -2460,7 +2458,6 @@ TESTSUBDIRS=	idlelib/idle_test \
- 		test/test_tomllib/data/valid/multiline-basic-str \
+@@ -2461,7 +2459,6 @@ TESTSUBDIRS=	idlelib/idle_test \
  		test/test_tools \
  		test/test_tools/i18n_data \
+ 		test/test_tools/msgfmt_data \
 -		test/test_ttk \
  		test/test_unittest \
  		test/test_unittest/testmock \
  		test/test_warnings \
-@@ -2482,6 +2479,11 @@ TESTSUBDIRS=	idlelib/idle_test \
+@@ -2483,6 +2480,11 @@ TESTSUBDIRS=	idlelib/idle_test \
  		test/xmltestdata/c14n-20 \
  		test/zipimport_data
  
diff --git a/package/python3/0009-Fix-thread-identifiers-on-32-bit-musl-builds.patch b/package/python3/0009-Fix-thread-identifiers-on-32-bit-musl-builds.patch
deleted file mode 100644
index cb5a67ad6e..0000000000
--- a/package/python3/0009-Fix-thread-identifiers-on-32-bit-musl-builds.patch
+++ /dev/null
@@ -1,100 +0,0 @@
-From 8a8f8d72212d043469ef33549e8edc3bce244516 Mon Sep 17 00:00:00 2001
-From: Vincent Fazio <vfazio@gmail.com>
-Date: Sat, 22 Feb 2025 19:43:26 -0600
-Subject: [PATCH] Fix thread identifiers on 32-bit musl builds
-
-CPython's pthread-based thread identifier relies on pthread_t being able
-to be represented as an unsigned integer type.
-
-This is true in most Linux libc implementations where it's defined as an
-unsigned long, however musl typedefs it as a struct *.
-
-If the pointer has the high bit set and is cast to PyThread_ident_t, the
-resultant value can be sign-extended [0]. This can cause issues when
-comparing against threading._MainThread's identifier. The main thread's
-identifier value is retrieved via _get_main_thread_ident which is backed
-by an unsigned long which truncates sign extended bits.
-
-  >>> hex(threading.main_thread().ident)
-  '0xb6f33f3c'
-  >>> hex(threading.current_thread().ident)
-  '0xffffffffb6f33f3c'
-
-Fix this by compiling in code targeting non-glibc based Linux platforms
-to cast the pthread_t to a uintptr and then to PyThread_ident_t.
-
-Upstream: https://github.com/python/cpython/pull/130391
-[0]: https://gcc.gnu.org/onlinedocs/gcc-14.2.0/gcc/Arrays-and-pointers-implementation.html
-
-Signed-off-by: Vincent Fazio <vfazio@gmail.com>
----
- Python/thread_pthread.h | 31 ++++++++++++++++++++++---------
- 1 file changed, 22 insertions(+), 9 deletions(-)
-
-diff --git a/Python/thread_pthread.h b/Python/thread_pthread.h
-index f588b4620da..84900c86401 100644
---- a/Python/thread_pthread.h
-+++ b/Python/thread_pthread.h
-@@ -307,6 +307,25 @@ do_start_joinable_thread(void (*func)(void *), void *arg, pthread_t* out_id)
-     return 0;
- }
- 
-+/* Helper to convert pthread_t to PyThread_ident_t. POSIX allows pthread_t to be
-+   non-arithmetic, e.g., musl typedefs it as a pointer */
-+static PyThread_ident_t
-+_pthread_t_to_ident(pthread_t value) {
-+#if SIZEOF_PTHREAD_T > SIZEOF_LONG
-+    return (PyThread_ident_t) *(unsigned long *) &value;
-+#else
-+    PyThread_ident_t ident;
-+#if defined(__linux__) && !defined(__GLIBC__)
-+    ident = (PyThread_ident_t) (uintptr_t) value;
-+    assert(pthread_equal(value, (pthread_t) (uintptr_t) ident));
-+#else
-+    ident = (PyThread_ident_t) value;
-+    assert(pthread_equal(value, (pthread_t) ident));
-+#endif
-+    return ident;
-+#endif  // SIZEOF_PTHREAD_T > SIZEOF_LONG
-+}
-+
- int
- PyThread_start_joinable_thread(void (*func)(void *), void *arg,
-                                PyThread_ident_t* ident, PyThread_handle_t* handle) {
-@@ -314,9 +333,8 @@ PyThread_start_joinable_thread(void (*func)(void *), void *arg,
-     if (do_start_joinable_thread(func, arg, &th)) {
-         return -1;
-     }
--    *ident = (PyThread_ident_t) th;
-+    *ident = _pthread_t_to_ident(th);
-     *handle = (PyThread_handle_t) th;
--    assert(th == (pthread_t) *ident);
-     assert(th == (pthread_t) *handle);
-     return 0;
- }
-@@ -329,11 +347,7 @@ PyThread_start_new_thread(void (*func)(void *), void *arg)
-         return PYTHREAD_INVALID_THREAD_ID;
-     }
-     pthread_detach(th);
--#if SIZEOF_PTHREAD_T <= SIZEOF_LONG
--    return (unsigned long) th;
--#else
--    return (unsigned long) *(unsigned long *) &th;
--#endif
-+    return (unsigned long) _pthread_t_to_ident(th);;
- }
- 
- int
-@@ -358,8 +372,7 @@ PyThread_get_thread_ident_ex(void) {
-     if (!initialized)
-         PyThread_init_thread();
-     threadid = pthread_self();
--    assert(threadid == (pthread_t) (PyThread_ident_t) threadid);
--    return (PyThread_ident_t) threadid;
-+    return _pthread_t_to_ident(threadid);
- }
- 
- unsigned long
--- 
-2.34.1
-
diff --git a/package/python3/0010-3.13-gh-129296-Fix-pyatomic.h-include-paths-GH-12932.patch b/package/python3/0010-3.13-gh-129296-Fix-pyatomic.h-include-paths-GH-12932.patch
deleted file mode 100644
index 00451af9bf..0000000000
--- a/package/python3/0010-3.13-gh-129296-Fix-pyatomic.h-include-paths-GH-12932.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From 0ee012224447b6ec7f6f20d316b24449fdcc0d4b Mon Sep 17 00:00:00 2001
-From: "Miss Islington (bot)"
- <31488909+miss-islington@users.noreply.github.com>
-Date: Fri, 28 Feb 2025 09:22:15 +0100
-Subject: [PATCH] [3.13] gh-129296: Fix `pyatomic.h` include paths (GH-129320)
- (#130667)
-
-gh-129296: Fix `pyatomic.h` include paths (GH-129320)
-
-Use relative includes in Include/cpython/pyatomic.h for
-pyatomic_gcc.h, pyatomic_std.h and pyatomic_msc.h.
-
-Do a similar change in Include/cpython/pythread.h for
-pthread_stubs.h include.
-(cherry picked from commit 3a974e39d54902699f360bc4db2fd351a6baf3ef)
-
-Co-authored-by: Zanie Blue <contact@zanie.dev>
-Upstream: 125ca028664ce72556e3983b57f521a118c4e677
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- Include/cpython/pyatomic.h | 6 +++---
- Include/cpython/pythread.h | 2 +-
- 2 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/Include/cpython/pyatomic.h b/Include/cpython/pyatomic.h
-index 4ecef4f56ed..28029859d3d 100644
---- a/Include/cpython/pyatomic.h
-+++ b/Include/cpython/pyatomic.h
-@@ -529,15 +529,15 @@ static inline void _Py_atomic_fence_release(void);
- 
- #if _Py_USE_GCC_BUILTIN_ATOMICS
- #  define Py_ATOMIC_GCC_H
--#  include "cpython/pyatomic_gcc.h"
-+#  include "pyatomic_gcc.h"
- #  undef Py_ATOMIC_GCC_H
- #elif __STDC_VERSION__ >= 201112L && !defined(__STDC_NO_ATOMICS__)
- #  define Py_ATOMIC_STD_H
--#  include "cpython/pyatomic_std.h"
-+#  include "pyatomic_std.h"
- #  undef Py_ATOMIC_STD_H
- #elif defined(_MSC_VER)
- #  define Py_ATOMIC_MSC_H
--#  include "cpython/pyatomic_msc.h"
-+#  include "pyatomic_msc.h"
- #  undef Py_ATOMIC_MSC_H
- #else
- #  error "no available pyatomic implementation for this platform/compiler"
-diff --git a/Include/cpython/pythread.h b/Include/cpython/pythread.h
-index 03f710a9f7e..e658b35bd90 100644
---- a/Include/cpython/pythread.h
-+++ b/Include/cpython/pythread.h
-@@ -22,7 +22,7 @@ PyAPI_DATA(const long long) PY_TIMEOUT_MAX;
-     */
- #   define NATIVE_TSS_KEY_T     unsigned long
- #elif defined(HAVE_PTHREAD_STUBS)
--#   include "cpython/pthread_stubs.h"
-+#   include "pthread_stubs.h"
- #   define NATIVE_TSS_KEY_T     pthread_key_t
- #else
- #   error "Require native threads. See https://bugs.python.org/issue31370"
--- 
-2.48.1
-
diff --git a/package/python3/0011-3.13-gh-131675-Fix-mi_atomic_yield-in-mimalloc-on-32.patch b/package/python3/0011-3.13-gh-131675-Fix-mi_atomic_yield-in-mimalloc-on-32.patch
deleted file mode 100644
index b4ecde94ee..0000000000
--- a/package/python3/0011-3.13-gh-131675-Fix-mi_atomic_yield-in-mimalloc-on-32.patch
+++ /dev/null
@@ -1,80 +0,0 @@
-From a9aae012b4ee83f1aba7c122943c63b69c5b9f97 Mon Sep 17 00:00:00 2001
-From: "Miss Islington (bot)"
- <31488909+miss-islington@users.noreply.github.com>
-Date: Mon, 31 Mar 2025 20:58:29 +0200
-Subject: [PATCH] [3.13] gh-131675: Fix `mi_atomic_yield` in mimalloc on 32-bit
- ARM (gh-131784) (gh-131954)
-
-Use the standard `__ARM_ARCH` macro, which is supported by GCC and Clang.
-
-The branching logic for of `__ARMEL__` has been removed so if the target
-architecture supports v7+ instructions, a yield is emitted, otherwise a nop
-is emitted. This covers both big and little endian scenarios.
-(cherry picked from commit 03f6c8e239723637811fd8d278661f5292351197)
-
-Upstream: https://github.com/python/cpython/pull/131954
-
-Signed-off-by: Vincent Fazio <vfazio@gmail.com>
-Co-authored-by: Vincent Fazio <vfazio@gmail.com>
-Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
----
- Include/internal/mimalloc/mimalloc/atomic.h     | 17 ++++++++++-------
- ...25-03-27-01-21-50.gh-issue-131675.l2zfOO.rst |  1 +
- 2 files changed, 11 insertions(+), 7 deletions(-)
- create mode 100644 Misc/NEWS.d/next/Build/2025-03-27-01-21-50.gh-issue-131675.l2zfOO.rst
-
-diff --git a/Include/internal/mimalloc/mimalloc/atomic.h b/Include/internal/mimalloc/mimalloc/atomic.h
-index 1093c540864..a46a7676ad2 100644
---- a/Include/internal/mimalloc/mimalloc/atomic.h
-+++ b/Include/internal/mimalloc/mimalloc/atomic.h
-@@ -338,8 +338,9 @@ static inline void mi_atomic_yield(void) {
-   _mm_pause();
- }
- #elif (defined(__GNUC__) || defined(__clang__)) && \
--      (defined(__x86_64__) || defined(__i386__) || defined(__arm__) || defined(__armel__) || defined(__ARMEL__) || \
--       defined(__aarch64__) || defined(__powerpc__) || defined(__ppc__) || defined(__PPC__)) || defined(__POWERPC__)
-+      (defined(__x86_64__) || defined(__i386__) || \
-+       defined(__aarch64__) || defined(__arm__) || \
-+       defined(__powerpc__) || defined(__ppc__) || defined(__PPC__) || defined(__POWERPC__))
- #if defined(__x86_64__) || defined(__i386__)
- static inline void mi_atomic_yield(void) {
-   __asm__ volatile ("pause" ::: "memory");
-@@ -348,10 +349,16 @@ static inline void mi_atomic_yield(void) {
- static inline void mi_atomic_yield(void) {
-   __asm__ volatile("wfe");
- }
--#elif (defined(__arm__) && __ARM_ARCH__ >= 7)
-+#elif defined(__arm__)
-+#if __ARM_ARCH >= 7
- static inline void mi_atomic_yield(void) {
-   __asm__ volatile("yield" ::: "memory");
- }
-+#else
-+static inline void mi_atomic_yield(void) {
-+  __asm__ volatile ("nop" ::: "memory");
-+}
-+#endif
- #elif defined(__powerpc__) || defined(__ppc__) || defined(__PPC__) || defined(__POWERPC__)
- #ifdef __APPLE__
- static inline void mi_atomic_yield(void) {
-@@ -362,10 +369,6 @@ static inline void mi_atomic_yield(void) {
-   __asm__ __volatile__ ("or 27,27,27" ::: "memory");
- }
- #endif
--#elif defined(__armel__) || defined(__ARMEL__)
--static inline void mi_atomic_yield(void) {
--  __asm__ volatile ("nop" ::: "memory");
--}
- #endif
- #elif defined(__sun)
- // Fallback for other archs
-diff --git a/Misc/NEWS.d/next/Build/2025-03-27-01-21-50.gh-issue-131675.l2zfOO.rst b/Misc/NEWS.d/next/Build/2025-03-27-01-21-50.gh-issue-131675.l2zfOO.rst
-new file mode 100644
-index 00000000000..be870a81df1
---- /dev/null
-+++ b/Misc/NEWS.d/next/Build/2025-03-27-01-21-50.gh-issue-131675.l2zfOO.rst
-@@ -0,0 +1 @@
-+Fix mimalloc library builds for 32-bit ARM targets.
--- 
-2.34.1
-
diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index 4f4f67c8cb..b13f5cc742 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,5 +1,5 @@
-# From https://www.python.org/downloads/release/python-3132/
-md5  4c2d9202ab4db02c9d0999b14655dfe5  Python-3.13.2.tar.xz
+# From https://www.python.org/downloads/release/python-3133/
+md5  8bb5f0b8c9d9d7b87d7d98510e8d58e5  Python-3.13.3.tar.xz
 # Locally computed
-sha256  d984bcc57cd67caab26f7def42e523b1c015bbc5dc07836cf4f0b63fa159eb56  Python-3.13.2.tar.xz
+sha256  40f868bcbdeb8149a3149580bb9bfd407b3321cd48f0be631af955ac92c0e041  Python-3.13.3.tar.xz
 sha256  78b12c3a81360b357002334f0e70ea0e92eebf7a9b358805c03c48484945f3bb  LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 806617b8b6..3e6273a773 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.13
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).2
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).3
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
