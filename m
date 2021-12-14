Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 908BBC433F5
	for <buildroot@archiver.kernel.org>; Tue, 14 Dec 2021 20:11:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B2E981025;
	Tue, 14 Dec 2021 20:11:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jODigGgDz4ad; Tue, 14 Dec 2021 20:11:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 75C5080C89;
	Tue, 14 Dec 2021 20:11:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 248D51BF9B9
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 20:10:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0B876405F4
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 20:10:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xQWgQHJ9dtnt for <buildroot@lists.busybox.net>;
 Tue, 14 Dec 2021 20:10:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D7B0940114
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 20:10:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id CF2648182C; Tue, 14 Dec 2021 20:05:19 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 14 Dec 2021 20:55:57 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2fde6bc32234c01b99b0245daa1455cdbcc86271
X-Git-Newrev: 73b1f5e43a9da822f82e20e9341a6dd552489f1f
X-Patchwork-Hint: ignore
Message-Id: <20211214200519.CF2648182C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/glog: bump to version 0.5.0
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=73b1f5e43a9da822f82e20e9341a6dd552489f1f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop patches (already in version)
- Disable gtest which has been added (and is enabled by default) with
  https://github.com/google/glog/commit/be25d94c21137fa2fdc53f2dc9c61a94bcf72ba4
- Update indentation in hash file (two spaces)

https://github.com/google/glog/releases/tag/v0.5.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...rc-symbolize.cc-fix-build-without-dlfcn.h.patch | 37 ----------
 ...2-src-utilities-fix-build-without-pthread.patch | 83 ----------------------
 package/glog/glog.hash                             |  4 +-
 package/glog/glog.mk                               |  3 +-
 4 files changed, 4 insertions(+), 123 deletions(-)

diff --git a/package/glog/0001-src-symbolize.cc-fix-build-without-dlfcn.h.patch b/package/glog/0001-src-symbolize.cc-fix-build-without-dlfcn.h.patch
deleted file mode 100644
index 73c6e670ed..0000000000
--- a/package/glog/0001-src-symbolize.cc-fix-build-without-dlfcn.h.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From f71e0899439aaa0e6172243a0862bf8a72a241fc Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Mon, 28 Oct 2019 18:21:55 +0100
-Subject: [PATCH] src/symbolize.cc: fix build without dlfcn.h
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/google/glog/pull/475]
----
- src/symbolize.cc | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/src/symbolize.cc b/src/symbolize.cc
-index 1ffc607..ff027f2 100644
---- a/src/symbolize.cc
-+++ b/src/symbolize.cc
-@@ -110,7 +110,9 @@ _END_GOOGLE_NAMESPACE_
- 
- #if defined(__ELF__)
- 
-+#if defined(HAVE_DLFCN_H)
- #include <dlfcn.h>
-+#endif
- #if defined(OS_OPENBSD)
- #include <sys/exec_elf.h>
- #else
-@@ -832,7 +834,7 @@ static ATTRIBUTE_NOINLINE bool SymbolizeAndDemangle(void *pc, char *out,
- 
- _END_GOOGLE_NAMESPACE_
- 
--#elif defined(OS_MACOSX) && defined(HAVE_DLADDR)
-+#elif defined(OS_MACOSX) && defined(HAVE_DLADDR) && defined(HAVE_DLFCN_H)
- 
- #include <dlfcn.h>
- #include <string.h>
--- 
-2.23.0
-
diff --git a/package/glog/0002-src-utilities-fix-build-without-pthread.patch b/package/glog/0002-src-utilities-fix-build-without-pthread.patch
deleted file mode 100644
index 503f57a697..0000000000
--- a/package/glog/0002-src-utilities-fix-build-without-pthread.patch
+++ /dev/null
@@ -1,83 +0,0 @@
-From 9630e0e848da22e27b346c38d9b05f0a16cbf7b3 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Thu, 31 Oct 2019 19:27:16 +0100
-Subject: [PATCH] src/utilities: fix build without pthread
-
-- Remove is_default_thread function which is an internal and not used
-  function
-- Remove g_main_thread_id as it was used only by is_default_thread
-
-Fixes:
- - http://autobuild.buildroot.net/results/5320bbe1205e782e3516d9bead8d1ed825bcbaad
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/google/glog/commit/9630e0e848da22e27b346c38d9b05f0a16cbf7b3]
----
- src/utilities.cc | 16 +++-------------
- src/utilities.h  |  2 --
- 2 files changed, 3 insertions(+), 15 deletions(-)
-
-diff --git a/src/utilities.cc b/src/utilities.cc
-index d463b33b..9a1e35d0 100644
---- a/src/utilities.cc
-+++ b/src/utilities.cc
-@@ -61,7 +61,6 @@ using std::string;
- _START_GOOGLE_NAMESPACE_
- 
- static const char* g_program_invocation_short_name = NULL;
--static pthread_t g_main_thread_id;
- 
- _END_GOOGLE_NAMESPACE_
- 
-@@ -181,16 +180,6 @@ bool IsGoogleLoggingInitialized() {
-   return g_program_invocation_short_name != NULL;
- }
- 
--bool is_default_thread() {
--  if (g_program_invocation_short_name == NULL) {
--    // InitGoogleLogging() not yet called, so unlikely to be in a different
--    // thread
--    return true;
--  } else {
--    return pthread_equal(pthread_self(), g_main_thread_id);
--  }
--}
--
- #ifdef OS_WINDOWS
- struct timeval {
-   long tv_sec, tv_usec;
-@@ -276,9 +265,11 @@ pid_t GetTID() {
-   return getpid();  // Linux:  getpid returns thread ID when gettid is absent
- #elif defined OS_WINDOWS && !defined OS_CYGWIN
-   return GetCurrentThreadId();
--#else
-+#elif defined(HAVE_PTHREAD)
-   // If none of the techniques above worked, we use pthread_self().
-   return (pid_t)(uintptr_t)pthread_self();
-+#else
-+  return -1;
- #endif
- }
- 
-@@ -350,7 +341,6 @@ void InitGoogleLoggingUtilities(const char* argv0) {
-   if (!slash)  slash = strrchr(argv0, '\\');
- #endif
-   g_program_invocation_short_name = slash ? slash + 1 : argv0;
--  g_main_thread_id = pthread_self();
- 
- #ifdef HAVE_STACKTRACE
-   InstallFailureFunction(&DumpStackTraceAndExit);
-diff --git a/src/utilities.h b/src/utilities.h
-index ca21cfb3..c66f9146 100644
---- a/src/utilities.h
-+++ b/src/utilities.h
-@@ -163,8 +163,6 @@ const char* ProgramInvocationShortName();
- 
- bool IsGoogleLoggingInitialized();
- 
--bool is_default_thread();
--
- int64 CycleClock_Now();
- 
- int64 UsecToCycles(int64 usec);
diff --git a/package/glog/glog.hash b/package/glog/glog.hash
index b9ba665400..3f84472967 100644
--- a/package/glog/glog.hash
+++ b/package/glog/glog.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256 f28359aeba12f30d73d9e4711ef356dc842886968112162bc73002645139c39c  glog-0.4.0.tar.gz
+sha256  eede71f28371bf39aa69b45de23b329d37214016e2055269b3b5e7cfd40b59f5  glog-0.5.0.tar.gz
 
 # Hash for License file:
-sha256 0fc497129c5c69ff6f22da6933c7e4aaef082fde8437fd57680c2780100772a4  COPYING
+sha256  0fc497129c5c69ff6f22da6933c7e4aaef082fde8437fd57680c2780100772a4  COPYING
diff --git a/package/glog/glog.mk b/package/glog/glog.mk
index 2863e78345..325107fb9e 100644
--- a/package/glog/glog.mk
+++ b/package/glog/glog.mk
@@ -4,12 +4,13 @@
 #
 ################################################################################
 
-GLOG_VERSION = 0.4.0
+GLOG_VERSION = 0.5.0
 GLOG_SITE = $(call github,google,glog,v$(GLOG_VERSION))
 GLOG_INSTALL_STAGING = YES
 GLOG_LICENSE = BSD-3-Clause
 GLOG_LICENSE_FILES = COPYING
 GLOG_CONF_OPTS = \
+	-DWITH_GTEST=OFF \
 	$(if $(BR2_TOOLCHAIN_HAS_THREADS),-DWITH_THREADS=ON, -DWITH_THREADS=OFF)
 
 ifeq ($(BR2_PACKAGE_GFLAGS),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
