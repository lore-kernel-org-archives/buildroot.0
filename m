Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12F40C36010
	for <buildroot@archiver.kernel.org>; Mon,  7 Apr 2025 17:43:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B3C640B4D;
	Mon,  7 Apr 2025 17:43:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ICgAc0r1KMBp; Mon,  7 Apr 2025 17:43:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 02DAF4065F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02DAF4065F;
	Mon,  7 Apr 2025 17:43:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A88E81F1
 for <buildroot@buildroot.org>; Mon,  7 Apr 2025 17:43:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8E45D80E16
 for <buildroot@buildroot.org>; Mon,  7 Apr 2025 17:43:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3ZmGEbgNDFDf for <buildroot@buildroot.org>;
 Mon,  7 Apr 2025 17:43:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E8E780CF0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6E8E780CF0
 for <buildroot@buildroot.org>; Mon,  7 Apr 2025 17:43:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 674BF83CCC; Mon,  7 Apr 2025 17:43:47 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 7 Apr 2025 19:42:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 53eae986a5c15afd0ade74875ce96a1b70e7c53b
X-Git-Newrev: 7dda4b57518ef554a48fd90c4df060dfd85441fe
X-Patchwork-Hint: ignore
Message-Id: <20250407174347.674BF83CCC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uclibc: update to 1.0.52
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
Content-Type: multipart/mixed; boundary="===============5914501905691846281=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5914501905691846281==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=7dda4b57518ef554a48fd90c4df060dfd85441fe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See here for release notes:
https://mailman.openadk.org/mailman3/hyperkitty/list/devel@uclibc-ng.org/thread/AGJRU33MT2GMXFNOUDXHISFQIVRYRYXO/

Drop patches 0001/0002 which are upstream.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...lib.h-only-expose-reallocarray-prototype-.patch | 64 ---------------
 .../0002-m68k-fix-alignment-in-NPTL-code.patch     | 92 ----------------------
 package/uclibc/uclibc.hash                         |  4 +-
 package/uclibc/uclibc.mk                           |  2 +-
 4 files changed, 3 insertions(+), 159 deletions(-)

diff --git a/package/uclibc/0001-include-stdlib.h-only-expose-reallocarray-prototype-.patch b/package/uclibc/0001-include-stdlib.h-only-expose-reallocarray-prototype-.patch
deleted file mode 100644
index 867e3645cc..0000000000
--- a/package/uclibc/0001-include-stdlib.h-only-expose-reallocarray-prototype-.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From bbb1a4f197624b0040e3228505eb2a725a8846f8 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Thu, 3 Apr 2025 22:56:49 +0200
-Subject: [PATCH] include/stdlib.h: only expose reallocarray() prototype when
- implementation is available
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-The reallocarray() primitive is only provided by the malloc-standard
-implementation: neither malloc nor malloc-simple provide it. This
-causes issues when building for example util-linux on noMMU platforms
-as:
-
-- noMMU platforms can't use malloc-standard, so either malloc or
-  malloc-simple are used, which means reallocarray() is not
-  implemented
-
-- util-linux detects the absence of reallocarray(), and provides its
-  own implementation, but the prototype clashes with the prototype in
-  uClibc's <stdlib.h>
-
-The combination of which causes the following build failure:
-
-In file included from lib/color-names.c:7:
-./include/c.h:586:21: error: static declaration of ‘reallocarray’ follows non-static declaration
-  586 | static inline void *reallocarray(void *ptr, size_t nmemb, size_t size)
-      |                     ^~~~~~~~~~~~
-In file included from ./include/c.h:16:
-/home/thomas/projets/buildroot/output/host/arm-buildroot-uclinux-uclibcgnueabi/sysroot/usr/include/stdlib.h:898:14: note: previous declaration of ‘reallocarray’ with type ‘void *(void *, size_t,  size_t)’ {aka ‘void *(void *, unsigned int,  unsigned int)’}
-  898 | extern void *reallocarray (void *__ptr, size_t __m, size_t __n);
-      |              ^~~~~~~~~~~~
-make[3]: *** [Makefile:12354: lib/libtcolors_la-color-names.lo] Error 1
-
-To fix this, let's not expose the prototype of reallocarray() if we
-don't provide the implementation for it.
-
-Upstream: https://mailman.openadk.org/mailman3/hyperkitty/list/devel@uclibc-ng.org/thread/BX4ENNZYO23YQJQF5XITW7TETSJHEFK5/
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- include/stdlib.h | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/include/stdlib.h b/include/stdlib.h
-index d4e0b75e7..448c5e336 100644
---- a/include/stdlib.h
-+++ b/include/stdlib.h
-@@ -986,9 +986,13 @@ extern int getpt (void);
- extern int getloadavg (double __loadavg[], int __nelem)
-      __THROW __nonnull ((1));
- 
-+/* reallocarray() only provided by the malloc-standard implementation */
-+#if defined(__MALLOC_STANDARD__)
- extern void *reallocarray (void *__ptr, size_t __m, size_t __n);
- #endif
- 
-+#endif
-+
- #ifdef _LIBC
- extern int __drand48_iterate (unsigned short int xsubi[3], struct drand48_data *buffer) attribute_hidden;
- 
--- 
-2.48.1
-
diff --git a/package/uclibc/0002-m68k-fix-alignment-in-NPTL-code.patch b/package/uclibc/0002-m68k-fix-alignment-in-NPTL-code.patch
deleted file mode 100644
index fbd9934376..0000000000
--- a/package/uclibc/0002-m68k-fix-alignment-in-NPTL-code.patch
+++ /dev/null
@@ -1,92 +0,0 @@
-From 278ac6b3098315cddec8f71f27bd8de22e53ca6c Mon Sep 17 00:00:00 2001
-From: Thorsten Glaser <tg@debian.org>
-Date: Wed, 12 Mar 2025 22:11:51 +0100
-Subject: [PATCH] m68k: fix alignment in NPTL code
-
-Upstream: https://gogs.waldemar-brodkorb.de/oss/uclibc-ng/commit/278ac6b3098315cddec8f71f27bd8de22e53ca6c
-Signed-off-by: Thorsten Glaser <tg@debian.org>
-Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
----
- .../unix/sysv/linux/m68k/bits/pthreadtypes.h   | 18 +++++++++---------
- 1 file changed, 9 insertions(+), 9 deletions(-)
-
-diff --git a/libpthread/nptl/sysdeps/unix/sysv/linux/m68k/bits/pthreadtypes.h b/libpthread/nptl/sysdeps/unix/sysv/linux/m68k/bits/pthreadtypes.h
-index 2a90a0b90..d2f22caee 100644
---- a/libpthread/nptl/sysdeps/unix/sysv/linux/m68k/bits/pthreadtypes.h
-+++ b/libpthread/nptl/sysdeps/unix/sysv/linux/m68k/bits/pthreadtypes.h
-@@ -39,7 +39,7 @@ typedef unsigned long int pthread_t;
- typedef union
- {
-   char __size[__SIZEOF_PTHREAD_ATTR_T];
--  long int __align;
-+  long int __align __attribute__((__aligned__(4)));
- } pthread_attr_t;
- 
- 
-@@ -69,13 +69,13 @@ typedef union
-     };
-   } __data;
-   char __size[__SIZEOF_PTHREAD_MUTEX_T];
--  long int __align;
-+  long int __align __attribute__((__aligned__(4)));
- } pthread_mutex_t;
- 
- typedef union
- {
-   char __size[__SIZEOF_PTHREAD_MUTEXATTR_T];
--  long int __align;
-+  long int __align __attribute__((__aligned__(4)));
- } pthread_mutexattr_t;
- 
- 
-@@ -95,13 +95,13 @@ typedef union
-     unsigned int __broadcast_seq;
-   } __data;
-   char __size[__SIZEOF_PTHREAD_COND_T];
--  __extension__ long long int __align;
-+  __extension__ long long int __align __attribute__((__aligned__(8)));
- } pthread_cond_t;
- 
- typedef union
- {
-   char __size[__SIZEOF_PTHREAD_CONDATTR_T];
--  long int __align;
-+  long int __align __attribute__((__aligned__(4)));
- } pthread_condattr_t;
- 
- 
-@@ -144,13 +144,13 @@ typedef union
-     int __writer;
-   } __data;
-   char __size[__SIZEOF_PTHREAD_RWLOCK_T];
--  long int __align;
-+  long int __align __attribute__((__aligned__(4)));
- } pthread_rwlock_t;
- 
- typedef union
- {
-   char __size[__SIZEOF_PTHREAD_RWLOCKATTR_T];
--  long int __align;
-+  long int __align __attribute__((__aligned__(4)));
- } pthread_rwlockattr_t;
- #endif
- 
-@@ -165,13 +165,13 @@ typedef volatile int pthread_spinlock_t;
- typedef union
- {
-   char __size[__SIZEOF_PTHREAD_BARRIER_T];
--  long int __align;
-+  long int __align __attribute__((__aligned__(4)));
- } pthread_barrier_t;
- 
- typedef union
- {
-   char __size[__SIZEOF_PTHREAD_BARRIERATTR_T];
--  int __align;
-+  int __align __attribute__((__aligned__(4)));
- } pthread_barrierattr_t;
- #endif
- 
--- 
-2.39.5
-
diff --git a/package/uclibc/uclibc.hash b/package/uclibc/uclibc.hash
index 398a1c04c4..35a4b4b962 100644
--- a/package/uclibc/uclibc.hash
+++ b/package/uclibc/uclibc.hash
@@ -1,4 +1,4 @@
-# From https://downloads.uclibc-ng.org/releases/1.0.51/uClibc-ng-1.0.51.tar.xz.sha256
-sha256  3484c8c7a0503c08f7e5fa7473c987414050726f31e8593d02d984f512d1a0cb  uClibc-ng-1.0.51.tar.xz
+# From https://downloads.uclibc-ng.org/releases/1.0.52/uClibc-ng-1.0.52.tar.xz.sha256
+sha256  881da473784f95cc8290bb0780c0afc810ca28d575e33d5afd5e7153b29aa136  uClibc-ng-1.0.52.tar.xz
 # Locally calculated
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING.LIB
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 12b597f03b..eb36de8e95 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UCLIBC_VERSION = 1.0.51
+UCLIBC_VERSION = 1.0.52
 UCLIBC_SOURCE = uClibc-ng-$(UCLIBC_VERSION).tar.xz
 UCLIBC_SITE = https://downloads.uclibc-ng.org/releases/$(UCLIBC_VERSION)
 UCLIBC_LICENSE = LGPL-2.1+

--===============5914501905691846281==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5914501905691846281==--
