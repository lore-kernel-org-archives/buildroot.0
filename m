Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2FE6EB64D9
	for <buildroot@archiver.kernel.org>; Wed, 14 Jun 2023 09:25:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 89652611E8;
	Wed, 14 Jun 2023 09:25:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 89652611E8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PbJdN3DeMuFD; Wed, 14 Jun 2023 09:25:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B84361214;
	Wed, 14 Jun 2023 09:25:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B84361214
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 985B71BF860
 for <buildroot@lists.busybox.net>; Wed, 14 Jun 2023 09:23:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 27D5041758
 for <buildroot@lists.busybox.net>; Wed, 14 Jun 2023 09:23:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 27D5041758
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NyCmUcEa1UUe for <buildroot@lists.busybox.net>;
 Wed, 14 Jun 2023 09:23:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 543FD41754
 for <buildroot@buildroot.org>; Wed, 14 Jun 2023 09:23:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 543FD41754
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 422DD83583; Wed, 14 Jun 2023 09:23:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 14 Jun 2023 11:18:33 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: b30617a79ba8722961d396fa551b5469e1761b8e
X-Git-Newrev: a26b7d84d29ce777cec035f1fb3c02ecdcafa173
X-Patchwork-Hint: ignore
Message-Id: <20230614092354.422DD83583@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/gcc: bump to
 version 12.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=a26b7d84d29ce777cec035f1fb3c02ecdcafa173
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Remove upstream patch.

See announce:
https://gcc.gnu.org/pipermail/gcc-announce/2023/000176.html

Runtime tested:
https://gitlab.com/kubu93/buildroot/-/pipelines/882178578

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 0a623d4955a0c62037710aca545abc10b41153d6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gcc/12.2.0/0002-fix-condvar.patch          | 82 ----------------------
 ...disable-split-stack-for-non-thread-builds.patch |  0
 package/gcc/Config.in.host                         |  2 +-
 package/gcc/gcc.hash                               |  4 +-
 4 files changed, 3 insertions(+), 85 deletions(-)

diff --git a/package/gcc/12.2.0/0002-fix-condvar.patch b/package/gcc/12.2.0/0002-fix-condvar.patch
deleted file mode 100644
index 5044942e9f..0000000000
--- a/package/gcc/12.2.0/0002-fix-condvar.patch
+++ /dev/null
@@ -1,82 +0,0 @@
-From ee4af2ed0b7322884ec4ff537564683c3749b813 Mon Sep 17 00:00:00 2001
-From: Jonathan Wakely <jwakely@redhat.com>
-Date: Thu, 22 Dec 2022 09:56:47 +0000
-Subject: [PATCH] libstdc++: Avoid recursion in __nothrow_wait_cv::wait
- [PR105730]
-
-The commit r12-5877-g9e18a25331fa25 removed the incorrect
-noexcept-specifier from std::condition_variable::wait and gave the new
-symbol version @@GLIBCXX_3.4.30. It also redefined the original symbol
-std::condition_variable::wait(unique_lock<mutex>&)@GLIBCXX_3.4.11 as an
-alias for a new symbol, __gnu_cxx::__nothrow_wait_cv::wait, which still
-has the incorrect noexcept guarantee. That __nothrow_wait_cv::wait is
-just a wrapper around the real condition_variable::wait which adds
-noexcept and so terminates on a __forced_unwind exception.
-
-This doesn't work on uclibc, possibly due to a dynamic linker bug. When
-__nothrow_wait_cv::wait calls the condition_variable::wait function it
-binds to the alias symbol, which means it just calls itself recursively
-until the stack overflows.
-
-This change avoids the possibility of a recursive call by changing the
-__nothrow_wait_cv::wait function so that instead of calling
-condition_variable::wait it re-implements it. This requires accessing
-the private _M_cond member of condition_variable, so we need to use the
-trick of instantiating a template with the member-pointer of the private
-member.
-
-libstdc++-v3/ChangeLog:
-
-	PR libstdc++/105730
-	* src/c++11/compatibility-condvar.cc (__nothrow_wait_cv::wait):
-	Access private data member of base class and call its wait
-	member.
-
-Signed-off-by: Gleb Mazovetskiy <glex.spb@gmail.com>
----
- .../src/c++11/compatibility-condvar.cc        | 22 ++++++++++++++++++-
- 1 file changed, 21 insertions(+), 1 deletion(-)
-
-diff --git a/libstdc++-v3/src/c++11/compatibility-condvar.cc b/libstdc++-v3/src/c++11/compatibility-condvar.cc
-index e3a8b8403ca..3cef3bc0714 100644
---- a/libstdc++-v3/src/c++11/compatibility-condvar.cc
-+++ b/libstdc++-v3/src/c++11/compatibility-condvar.cc
-@@ -67,6 +67,24 @@ _GLIBCXX_END_NAMESPACE_VERSION
-     && defined(_GLIBCXX_HAVE_SYMVER_SYMBOL_RENAMING_RUNTIME_SUPPORT)
- namespace __gnu_cxx _GLIBCXX_VISIBILITY(default)
- {
-+namespace
-+{
-+  // Pointer-to-member for private std::condition_variable::_M_cond member.
-+  std::__condvar std::condition_variable::* __base_member;
-+
-+  template<std::__condvar std::condition_variable::*X>
-+    struct cracker
-+    { static std::__condvar std::condition_variable::* value; };
-+
-+  // Initializer for this static member also initializes __base_member.
-+  template<std::__condvar std::condition_variable::*X>
-+    std::__condvar std::condition_variable::*
-+      cracker<X>::value = __base_member = X;
-+
-+  // Explicit instantiation is allowed to access the private member.
-+  template class cracker<&std::condition_variable::_M_cond>;
-+}
-+
- struct __nothrow_wait_cv : std::condition_variable
- {
-   void wait(std::unique_lock<std::mutex>&) noexcept;
-@@ -76,7 +94,9 @@ __attribute__((used))
- void
- __nothrow_wait_cv::wait(std::unique_lock<std::mutex>& lock) noexcept
- {
--  this->condition_variable::wait(lock);
-+  // In theory this could be simply this->std::condition_variable::wait(lock)
-+  // but with uclibc that binds to the @GLIBCXX_3.4.11 symbol, see PR 105730.
-+  (this->*__base_member).wait(*lock.mutex());
- }
- } // namespace __gnu_cxx
- 
--- 
-2.31.1
-
diff --git a/package/gcc/12.2.0/0001-disable-split-stack-for-non-thread-builds.patch b/package/gcc/12.3.0/0001-disable-split-stack-for-non-thread-builds.patch
similarity index 100%
rename from package/gcc/12.2.0/0001-disable-split-stack-for-non-thread-builds.patch
rename to package/gcc/12.3.0/0001-disable-split-stack-for-non-thread-builds.patch
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index cd1b9fa46d..dca1579319 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -88,7 +88,7 @@ config BR2_GCC_VERSION
 	default "8.4.0"     if BR2_GCC_VERSION_POWERPC_SPE
 	default "10.4.0"    if BR2_GCC_VERSION_10_X
 	default "11.3.0"    if BR2_GCC_VERSION_11_X
-	default "12.2.0"    if BR2_GCC_VERSION_12_X
+	default "12.3.0"    if BR2_GCC_VERSION_12_X
 	default "arc-2020.09-release" if BR2_GCC_VERSION_ARC
 
 config BR2_EXTRA_GCC_CONFIG_OPTIONS
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index 666124fa6d..9082d25b78 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -4,8 +4,8 @@ sha512  6de904f552a02de33b11ef52312bb664396efd7e1ce3bbe37bfad5ef617f133095b3767b
 sha512  440c08ca746da450d9a1b35e8fd2305cb27e7e6987cd9d0f7d375f3b1fc9e4b0bd7acb3cd7bf795e72fcbead59cdef5b6c152862f5d35cd9fbfe6902101ce648  gcc-10.4.0.tar.xz
 # From https://gcc.gnu.org/pub/gcc/releases/gcc-11.3.0/sha512.sum
 sha512  f0be5ad705c73b84477128a69c047f57dd47002f375eb60e1e842e08cf2009a509e92152bca345823926d550b7395ae6d4de7db51d1ee371c2dc37313881fca7  gcc-11.3.0.tar.xz
-# From https://gcc.gnu.org/pub/gcc/releases/gcc-12.2.0/sha512.sum
-sha512  e9e857bd81bf7a370307d6848c81b2f5403db8c7b5207f54bce3f3faac3bde63445684092c2bc1a2427cddb6f7746496d9fbbef05fbbd77f2810b2998f1f9173  gcc-12.2.0.tar.xz
+# From https://gcc.gnu.org/pub/gcc/releases/gcc-12.3.0/sha512.sum
+sha512  8fb799dfa2e5de5284edf8f821e3d40c2781e4c570f5adfdb1ca0671fcae3fb7f794ea783e80f01ec7bfbf912ca508e478bd749b2755c2c14e4055648146c204  gcc-12.3.0.tar.xz
 
 # Locally calculated (fetched from Github)
 sha512  b0853e2b1c5998044392023fa653e399e74118c46e616504ac59e1a2cf27620f94434767ce06b6cf4ca3dfb57f81d6eda92752befaf095ea5e564a9181b4659c  gcc-arc-2020.09-release.tar.gz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
