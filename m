Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94F00C282D0
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:46:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 52A8B84864;
	Fri, 28 Feb 2025 16:46:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7SdQNKqCH0ap; Fri, 28 Feb 2025 16:46:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3517E848EC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3517E848EC;
	Fri, 28 Feb 2025 16:46:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C44168
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:33:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E664742529
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tvkdhsznzn_H for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71B14424BC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 71B14424BC
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 665388752B; Fri, 28 Feb 2025 16:29:49 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 27 Dec 2024 19:53:01 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 038c7df88e063fa10b0e1aa5e26159618fea21de
X-Git-Newrev: 342fefa6d29588014226108e6a2c8b68384fb692
X-Patchwork-Hint: ignore
Message-Id: <20250228162949.665388752B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/log4cxx: bump to
 version 1.3.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=342fefa6d29588014226108e6a2c8b68384fb692
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

According to
https://logging.apache.org/log4cxx/1.3.1/changelog.html:

Release 1.3.1 - 2024-11-30
==========================

This is a minor bugfix release to fix issues found with 1.3.0.
Bug

- Properly prevent undefined behaviour when an appender is deleted without being closed [#431]
- Prevent abnormal termination on exit when using a static NDC/MDC variable [#426]
- Support for std::experimental::optional (in the standard library used by gcc 5.4) [#419]

Release 1.3.0 - 2024-10-21
==========================

Release 1.3.0 includes the following new features:

- Overhead reduction of upto 60% sending logging events to an appender
- Statistics on the AsyncAppender's queue length (in Log4cxx debug output)
- Fuzz tests along with Google OSS-Fuzz integration

The following issues have been addressed:

- MSYS2/MINGW build errors [#389]
- thread_local problems in MSYS2/MINGW [#394]
- A potential 'use after free' fault when using AsyncAppender [#397]

Release 1.2.0 - 2024-01-01
==========================

The following issues have been addressed:

- The locale external character encoding option reverting to US-ASCII [LOGCXX-483]
- A segfault during process exit when log4cxx::LogManager::shutdown is not called [#268] [#219]
- The cmake option to include a MultiprocessRollingFileAppender did not work
- Build failure in a MSYS2 environment
- Format settings (e.g. std::hex) were retained across LOG4CXX_XXXXX macro logging requests
- When the APR library was built without support for threads (APR_HAS_THREADS=0):
    the AsyncAppender and dynamically loaded configuration changes were not available
    a single nested/mapped diagnostic context (NDC/MDC) would be used and updated (without synchronization)
- On Windows, GetThreadDescription() called for each logging event when the thread name was empty [#321]

Release 1.2.0 includes the following new features:

- LOG4CXX_XXXX macros now support logging of QStrings directly
- log4cxx::hexdump function that returns a string of hexadecimal byte values
- Ability to remove a HierarchyEventListener [#233]
- Less string copying when sending a logging event to an appender
- Less frequent mutex contention when logging from multiple threads concurrently [#320]
- Allow thread information to be included in JSON formatted output
- Optional support for logging during process termination [#271]
- A cmake option to place Log4cxx functions in a different namespace [#277]
- Optionally use std::format in LOG4CXX_XXXX_FMT macros instead of fmt::format [#291]
- Support for per object enabling/disabling of logging requests (see log4cxx::LoggerInstancePtr)

Note: the LOG4CXX_CHARSET cmake option (external character encoding) default value has changed to utf-8

Within Buildroot, log4cxx has no reverse dependencies, and we tested
building it with gcc 7.x to verify compatibility with reasonably old
compilers.

This new version of log4cxx now needs wchar support, as several
multi-byte functions are now used since upstream commit
2569c6beac983e933574d001ec1601e569355c50 ("Implement a functional
'locale' character encoding (#252)").

A full test-pkg build was performed with this package update:
https://gitlab.com/tpetazzoni/buildroot/-/pipelines/1603576624.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/log4cxx/Config.in    | 5 +++--
 package/log4cxx/log4cxx.hash | 4 ++--
 package/log4cxx/log4cxx.mk   | 2 +-
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/log4cxx/Config.in b/package/log4cxx/Config.in
index 27a5f06988..d9daf27eb6 100644
--- a/package/log4cxx/Config.in
+++ b/package/log4cxx/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_LOG4CXX
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_WCHAR # mbsinit
 	depends on BR2_USE_MMU # apr
 	depends on BR2_USE_WCHAR || BR2_TOOLCHAIN_GCC_AT_LEAST_7 # boost
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS || BR2_TOOLCHAIN_GCC_AT_LEAST_7 # boost-thread
@@ -21,9 +22,9 @@ config BR2_PACKAGE_LOG4CXX
 
 	  https://logging.apache.org/log4cxx/
 
-comment "log4cxx needs a toolchain w/ C++, threads, dynamic library"
+comment "log4cxx needs a toolchain w/ C++, threads, dynamic library, wchar"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
-		BR2_STATIC_LIBS
+		BR2_STATIC_LIBS || !BR2_USE_WCHAR
 	depends on BR2_USE_MMU
 
 comment "log4cxx needs a toolchain w/ wchar or gcc >= 7"
diff --git a/package/log4cxx/log4cxx.hash b/package/log4cxx/log4cxx.hash
index 728d49ee38..d9e9af18cf 100644
--- a/package/log4cxx/log4cxx.hash
+++ b/package/log4cxx/log4cxx.hash
@@ -1,4 +1,4 @@
-# From https://www.apache.org/dist/logging/log4cxx/1.1.0/apache-log4cxx-1.1.0.tar.gz.sha512
-sha512  66a66eab933a6afd0779e3f73f65afa4fb82481208b591fd7c7c86ded805f50abcd9cdf954bdb49e1e7f5198e6c1c4fff8a7e180ff5fff9491f1946e9ba6fe2b  apache-log4cxx-1.1.0.tar.gz
+# From https://downloads.apache.org/logging/log4cxx/1.3.1/apache-log4cxx-1.3.1.tar.gz.sha512
+sha512  0956fd034fd1a98d2e48ed461578c1e85da02d176850a580195b6a60b959feaf402a2743cc84ccb5d467dd924ee46422b8a7b39d2be9ee131e4e275e65ba839c  apache-log4cxx-1.3.1.tar.gz
 # Locally computed
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/log4cxx/log4cxx.mk b/package/log4cxx/log4cxx.mk
index 8024c96d46..2d8d57a612 100644
--- a/package/log4cxx/log4cxx.mk
+++ b/package/log4cxx/log4cxx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LOG4CXX_VERSION = 1.1.0
+LOG4CXX_VERSION = 1.3.1
 LOG4CXX_SITE = https://archive.apache.org/dist/logging/log4cxx/$(LOG4CXX_VERSION)
 LOG4CXX_SOURCE = apache-log4cxx-$(LOG4CXX_VERSION).tar.gz
 LOG4CXX_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
