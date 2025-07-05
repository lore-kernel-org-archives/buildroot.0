Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1664FC8303C
	for <buildroot@archiver.kernel.org>; Sat,  5 Jul 2025 17:24:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B8D2160F74;
	Sat,  5 Jul 2025 17:24:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rluuWq1lLerd; Sat,  5 Jul 2025 17:24:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 87E2360EE9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 87E2360EE9;
	Sat,  5 Jul 2025 17:24:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E5AB212E
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 17:24:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D7D6F400BA
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 17:24:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NAdTjltf-rsY for <buildroot@buildroot.org>;
 Sat,  5 Jul 2025 17:24:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 81A2740088
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 81A2740088
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 17:24:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7BF5D85637; Sat,  5 Jul 2025 17:24:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 5 Jul 2025 17:19:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c32230fe35c6c962d954a214a7018a2f51c04a1d
X-Git-Newrev: 31af509b4f4fe52f67bd9109b8732a55b8f9cd2d
X-Patchwork-Hint: ignore
Message-Id: <20250705172413.7BF5D85637@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/util-linux: bump to 2.41.1
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=31af509b4f4fe52f67bd9109b8732a55b8f9cd2d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

News:
- https://mirrors.edge.kernel.org/pub/linux/utils/util-linux/v2.41/v2.41-ReleaseNotes
- https://mirrors.edge.kernel.org/pub/linux/utils/util-linux/v2.41/v2.41.1-ReleaseNotes

Dropped patches which are all upstream.
- https://github.com/util-linux/util-linux/pull/3049
- https://github.com/util-linux/util-linux/pull/3383

Synced all license files.

Dropped the AUTORECONF call, since
0001-libmount-ifdef-statx-call.patch is upstream.

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...setarch.c-fix-build-with-uclibc-ng-1.0.39.patch | 39 ----------
 .../0002-c.h-consolidate-THREAD_LOCAL.patch        | 65 -----------------
 ...s-define-HAVE_LIBPTHREAD-and-PTHREAD_LIBS.patch | 47 -------------
 .../0004-meson-add-HAVE_LIBPTHREAD.patch           | 27 -------
 ...port-non-cached-scenarios-when-lpthread-i.patch | 82 ----------------------
 package/util-linux/util-linux.hash                 | 10 ++-
 package/util-linux/util-linux.mk                   | 11 +--
 7 files changed, 13 insertions(+), 268 deletions(-)

diff --git a/package/util-linux/0001-sys-utils-setarch.c-fix-build-with-uclibc-ng-1.0.39.patch b/package/util-linux/0001-sys-utils-setarch.c-fix-build-with-uclibc-ng-1.0.39.patch
deleted file mode 100644
index 12dd119ef3..0000000000
--- a/package/util-linux/0001-sys-utils-setarch.c-fix-build-with-uclibc-ng-1.0.39.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From beef18da4de87ca5aaadf2beb14187f35cc4f50f Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Wed, 15 May 2024 18:22:11 +0200
-Subject: [PATCH] sys-utils/setarch.c: fix build with uclibc-ng < 1.0.39
-
-Fix the following build failure with uclibc-ng < 1.0.39 (i.e., without
-https://github.com/wbx-github/uclibc-ng/commit/85ac4f04d94e98389a8315e720630d0f95bfdfd6)
-raised since version 2.39 and
-https://github.com/util-linux/util-linux/commit/03a254f010b08da1175f50a8ae7882e59228f1b4:
-
-sys-utils/setarch.c:106:7: error: 'PER_LINUX32_3GB' undeclared here (not in a function); did you mean 'PER_LINUX32'?
-  106 |     X(PER_LINUX32_3GB) \
-      |       ^~~~~~~~~~~~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/fb1feb47f2660882fa53f66bacc63e191fd52175
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Upstream: https://github.com/util-linux/util-linux/commit/4647fc6afbf7e99c49531600425df60f1243fcd2
----
- sys-utils/setarch.c | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/sys-utils/setarch.c b/sys-utils/setarch.c
-index 227bc6b5de..4bcb5e69e6 100644
---- a/sys-utils/setarch.c
-+++ b/sys-utils/setarch.c
-@@ -89,6 +89,11 @@
- # define PER_LINUX_FDPIC	(PER_LINUX | FDPIC_FUNCPTRS)
- #endif
- 
-+/* fallback for old uclibc-headers < 1.0.39 */
-+#ifndef PER_LINUX32_3GB
-+# define PER_LINUX32_3GB	(PER_LINUX32 | ADDR_LIMIT_3GB)
-+#endif
-+
- #define ALL_PERSONALITIES \
-     X(PER_LINUX) \
-     X(PER_LINUX_32BIT) \
diff --git a/package/util-linux/0002-c.h-consolidate-THREAD_LOCAL.patch b/package/util-linux/0002-c.h-consolidate-THREAD_LOCAL.patch
deleted file mode 100644
index bb1a63ecc2..0000000000
--- a/package/util-linux/0002-c.h-consolidate-THREAD_LOCAL.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From 7b3db914fa9073c667ea482c8b6b4e07fe6202cc Mon Sep 17 00:00:00 2001
-From: Karel Zak <kzak@redhat.com>
-Date: Mon, 27 Jan 2025 13:40:23 +0100
-Subject: [PATCH] c.h: consolidate THREAD_LOCAL.
-
-Let's define this macro in one place only.
-
-Upstream: https://github.com/util-linux/util-linux/pull/3383
-Signed-off-by: Karel Zak <kzak@redhat.com>
-Signed-off-by: Julien Olivain <ju.o@free.fr>
----
- include/c.h            | 9 +++++++++
- lib/randutils.c        | 5 -----
- libuuid/src/gen_uuid.c | 1 -
- 3 files changed, 9 insertions(+), 6 deletions(-)
-
-diff --git a/include/c.h b/include/c.h
-index 61b95ab2d..848c48536 100644
---- a/include/c.h
-+++ b/include/c.h
-@@ -595,4 +595,13 @@ static inline void *reallocarray(void *ptr, size_t nmemb, size_t size)
- }
- #endif
- 
-+/*
-+ * thread-local storage
-+ */
-+#ifdef HAVE_TLS
-+# define THREAD_LOCAL static __thread
-+#else
-+# define THREAD_LOCAL static
-+#endif
-+
- #endif /* UTIL_LINUX_C_H */
-diff --git a/lib/randutils.c b/lib/randutils.c
-index 15c2f7834..4c806e682 100644
---- a/lib/randutils.c
-+++ b/lib/randutils.c
-@@ -20,11 +20,6 @@
- #include "randutils.h"
- #include "nls.h"
- 
--#ifdef HAVE_TLS
--#define THREAD_LOCAL static __thread
--#else
--#define THREAD_LOCAL static
--#endif
- 
- #ifdef HAVE_GETRANDOM
- # include <sys/random.h>
-diff --git a/libuuid/src/gen_uuid.c b/libuuid/src/gen_uuid.c
-index 3b76ddc9a..69712267f 100644
---- a/libuuid/src/gen_uuid.c
-+++ b/libuuid/src/gen_uuid.c
-@@ -92,7 +92,6 @@
- #include "md5.h"
- #include "sha1.h"
- 
--#define THREAD_LOCAL static __thread
- 
- #ifdef _WIN32
- static void gettimeofday (struct timeval *tv, void *dummy)
--- 
-2.48.1
-
diff --git a/package/util-linux/0003-autotools-define-HAVE_LIBPTHREAD-and-PTHREAD_LIBS.patch b/package/util-linux/0003-autotools-define-HAVE_LIBPTHREAD-and-PTHREAD_LIBS.patch
deleted file mode 100644
index 843253a56a..0000000000
--- a/package/util-linux/0003-autotools-define-HAVE_LIBPTHREAD-and-PTHREAD_LIBS.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 0735eb8bc0ed4bc9820ea7e4e600fed246457b18 Mon Sep 17 00:00:00 2001
-From: Karel Zak <kzak@redhat.com>
-Date: Mon, 27 Jan 2025 14:01:38 +0100
-Subject: [PATCH] autotools: define HAVE_LIBPTHREAD and PTHREAD_LIBS
-
-Upstream: https://github.com/util-linux/util-linux/pull/3383
-Signed-off-by: Karel Zak <kzak@redhat.com>
-Signed-off-by: Julien Olivain <ju.o@free.fr>
----
- configure.ac              | 7 +++++++
- libuuid/src/Makemodule.am | 2 +-
- 2 files changed, 8 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 82d0e4bf9..9a7f260c5 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -738,6 +738,13 @@ AS_IF([test x"$have_timer" = xno], [
- ])
- 
- 
-+AC_CHECK_LIB([pthread], [pthread_atfork], [
-+	PTHREAD_LIBS="-lpthread"
-+	AC_DEFINE([HAVE_LIBPTHREAD], [1], [Define if libpthred exist])
-+])
-+AC_SUBST([PTHREAD_LIBS])
-+
-+
- AC_CHECK_LIB([rtas], [rtas_get_sysparm], [
- 	RTAS_LIBS="-lrtas"
- 	AC_DEFINE([HAVE_LIBRTAS], [1], [Define if librtas exists])
-diff --git a/libuuid/src/Makemodule.am b/libuuid/src/Makemodule.am
-index 867ad7be5..58b64fe9b 100644
---- a/libuuid/src/Makemodule.am
-+++ b/libuuid/src/Makemodule.am
-@@ -31,7 +31,7 @@ libuuid_la_SOURCES = \
- EXTRA_libuuid_la_DEPENDENCIES = \
- 	libuuid/src/libuuid.sym
- 
--libuuid_la_LIBADD       = $(LDADD) $(SOCKET_LIBS) -lpthread
-+libuuid_la_LIBADD       = $(LDADD) $(SOCKET_LIBS) $(PTHREAD_LIBS)
- 
- libuuid_la_CFLAGS = \
- 	$(AM_CFLAGS) \
--- 
-2.48.1
-
diff --git a/package/util-linux/0004-meson-add-HAVE_LIBPTHREAD.patch b/package/util-linux/0004-meson-add-HAVE_LIBPTHREAD.patch
deleted file mode 100644
index 19e0697769..0000000000
--- a/package/util-linux/0004-meson-add-HAVE_LIBPTHREAD.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From f540cc6fed7224fb9ca162cb2f33c338260ae1d2 Mon Sep 17 00:00:00 2001
-From: Karel Zak <kzak@redhat.com>
-Date: Mon, 27 Jan 2025 14:11:35 +0100
-Subject: [PATCH] meson: add HAVE_LIBPTHREAD
-
-Upstream: https://github.com/util-linux/util-linux/pull/3383
-Signed-off-by: Karel Zak <kzak@redhat.com>
-Signed-off-by: Julien Olivain <ju.o@free.fr>
----
- meson.build | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/meson.build b/meson.build
-index 6d1f986af..ac5fdd799 100644
---- a/meson.build
-+++ b/meson.build
-@@ -748,6 +748,7 @@ endif
- conf.set('HAVE_CLOCK_GETTIME', have ? 1 : false)
- 
- thread_libs = dependency('threads')
-+conf.set('HAVE_LIBPTHREAD', thread_libs.found() ? 1 : false)
- 
- have = cc.has_function('timer_create')
- if not have
--- 
-2.48.1
-
diff --git a/package/util-linux/0005-libuuid-support-non-cached-scenarios-when-lpthread-i.patch b/package/util-linux/0005-libuuid-support-non-cached-scenarios-when-lpthread-i.patch
deleted file mode 100644
index 0d90f8aec9..0000000000
--- a/package/util-linux/0005-libuuid-support-non-cached-scenarios-when-lpthread-i.patch
+++ /dev/null
@@ -1,82 +0,0 @@
-From eecaa2c0dda817eba2d493f6ddb42c39cf789fc2 Mon Sep 17 00:00:00 2001
-From: Karel Zak <kzak@redhat.com>
-Date: Mon, 27 Jan 2025 14:28:36 +0100
-Subject: [PATCH] libuuid: support non-cached scenarios (when -lpthread is
- unavailable)
-
-This patch makes the dependence on pthread optional for libuuid. In
-certain cases, such as Buildroot Linux, uClibc-ng, and very low
-resource systems, libpthread may be unavailable.
-
-If libuuid is compiled without pthread, it will not use a local cache
-and will instead request a UUID from uuidd for each call. This may
-result in less efficient performance, but the UUIDs generated will
-still be unique and reliable.
-
-On minimalistic systems, it is highly likely that uuidd will not be
-installed, making this change important for portability and robust
-code.
-
-Upstream: https://github.com/util-linux/util-linux/pull/3383
-Addresses: https://github.com/util-linux/util-linux/pull/3375
-Signed-off-by: Karel Zak <kzak@redhat.com>
-Signed-off-by: Julien Olivain <ju.o@free.fr>
----
- libuuid/src/gen_uuid.c | 18 +++++++++++++++---
- 1 file changed, 15 insertions(+), 3 deletions(-)
-
-diff --git a/libuuid/src/gen_uuid.c b/libuuid/src/gen_uuid.c
-index 69712267f..1ed82b46b 100644
---- a/libuuid/src/gen_uuid.c
-+++ b/libuuid/src/gen_uuid.c
-@@ -80,7 +80,10 @@
- #if defined(__linux__) && defined(HAVE_SYS_SYSCALL_H)
- #include <sys/syscall.h>
- #endif
--#include <pthread.h>
-+#ifdef HAVE_LIBPTHREAD
-+# include <pthread.h>
-+#endif
-+
- #include <signal.h>
- 
- #include "all-io.h"
-@@ -580,8 +583,7 @@ int __uuid_generate_time_cont(uuid_t out, int *num, uint32_t cont_offset)
-  * If neither of these is possible (e.g. because of insufficient permissions), it generates
-  * the UUID anyway, but returns -1. Otherwise, returns 0.
-  */
--
--/* thread local cache for uuidd based requests */
-+#ifdef HAVE_LIBPTHREAD
- THREAD_LOCAL struct {
- 	int		num;
- 	int		cache_size;
-@@ -597,8 +599,10 @@ static void reset_uuidd_cache(void)
- 	memset(&uuidd_cache, 0, sizeof(uuidd_cache));
- 	uuidd_cache.cache_size = CS_MIN;
- }
-+#endif /* HAVE_LIBPTHREAD */
- 
- static int uuid_generate_time_generic(uuid_t out) {
-+#ifdef HAVE_LIBPTHREAD
- 	static volatile sig_atomic_t atfork_registered;
- 	time_t	now;
- 
-@@ -651,6 +655,14 @@ static int uuid_generate_time_generic(uuid_t out) {
- 		return 0;
- 	}
- 
-+#else /* !HAVE_LIBPTHREAD */
-+	{
-+		int num = 1;
-+		if (get_uuid_via_daemon(UUIDD_OP_TIME_UUID, out, &num) == 0)
-+			return 0;
-+	}
-+#endif /* HAVE_LIBPTHREAD */
-+
- 	return __uuid_generate_time(out, NULL);
- }
- 
--- 
-2.48.1
-
diff --git a/package/util-linux/util-linux.hash b/package/util-linux/util-linux.hash
index 317efebcbf..d1c2986ca6 100644
--- a/package/util-linux/util-linux.hash
+++ b/package/util-linux/util-linux.hash
@@ -1,10 +1,14 @@
-# From https://mirrors.edge.kernel.org/pub/linux/utils/util-linux/v2.40/sha256sums.asc
-sha256  d78b37a66f5922d70edf3bdfb01a6b33d34ed3c3cafd6628203b2a2b67c8e8b3  util-linux-2.40.2.tar.xz
+# From https://mirrors.edge.kernel.org/pub/linux/utils/util-linux/v2.41/sha256sums.asc
+sha256  be9ad9a276f4305ab7dd2f5225c8be1ff54352f565ff4dede9628c1aaa7dec57  util-linux-2.41.1.tar.xz
 # License files, locally calculated
-sha256  27f25514040a401b2ceb7057eae1f46cedb1666664b519b5be7e0960d1b35164  README.licensing
+sha256  4c2db318192bda62f3f8fcf71488bb5e602ae4385eba281d711b46cc13a40bb3  README.licensing
+sha256  527f738966ca396cd5a68c1509390de2a780c6b614d9ee57f7544a6161938ed1  Documentation/licenses/COPYING.BSD-2-Clause
 sha256  9b718a9460fed5952466421235bc79eb49d4e9eacc920d7a9dd6285ab8fd6c6d  Documentation/licenses/COPYING.BSD-3-Clause
 sha256  ba7640f00d93e72e92b94b9d71f25ec53bac2f1682f5c4adcccb0018359f60f8  Documentation/licenses/COPYING.BSD-4-Clause-UC
+sha256  6fc9e709ccbfe0d77fbffa2427a983282be2eb88e47b1cdb49f21a83b4d1e665  Documentation/licenses/COPYING.EUPL-1.2
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  Documentation/licenses/COPYING.GPL-2.0-only
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  Documentation/licenses/COPYING.GPL-2.0-or-later
+sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  Documentation/licenses/COPYING.GPL-3.0-or-later
 sha256  e53348ce276358e9997014071c5294b36a18c4b34f32f00ee57b9acce0aafd63  Documentation/licenses/COPYING.ISC
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  Documentation/licenses/COPYING.LGPL-2.1-or-later
 sha256  8555341619542abb48c102afd954e42d4478e5be16ad3d5af7b0ff71009e7348  Documentation/licenses/COPYING.MIT
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index ed30c0b107..3098a81a72 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -7,8 +7,8 @@
 # When making changes to this file, please check if
 # util-linux-libs/util-linux-libs.mk needs to be updated accordingly as well.
 
-UTIL_LINUX_VERSION_MAJOR = 2.40
-UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).2
+UTIL_LINUX_VERSION_MAJOR = 2.41
+UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).1
 UTIL_LINUX_SOURCE = util-linux-$(UTIL_LINUX_VERSION).tar.xz
 UTIL_LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/util-linux/v$(UTIL_LINUX_VERSION_MAJOR)
 
@@ -24,18 +24,19 @@ UTIL_LINUX_LICENSE = \
 	ISC (rfkill) \
 	MIT (hardlink, flock)
 UTIL_LINUX_LICENSE_FILES = README.licensing \
+	Documentation/licenses/COPYING.BSD-2-Clause \
 	Documentation/licenses/COPYING.BSD-3-Clause \
 	Documentation/licenses/COPYING.BSD-4-Clause-UC \
+	Documentation/licenses/COPYING.EUPL-1.2 \
+	Documentation/licenses/COPYING.GPL-2.0-only \
 	Documentation/licenses/COPYING.GPL-2.0-or-later \
+	Documentation/licenses/COPYING.GPL-3.0-or-later \
 	Documentation/licenses/COPYING.ISC \
 	Documentation/licenses/COPYING.LGPL-2.1-or-later \
 	Documentation/licenses/COPYING.MIT
 
 UTIL_LINUX_CPE_ID_VENDOR = kernel
 
-# 0001-libmount-ifdef-statx-call.patch
-UTIL_LINUX_AUTORECONF = YES
-
 UTIL_LINUX_INSTALL_STAGING = YES
 UTIL_LINUX_DEPENDENCIES = \
 	host-pkgconf \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
