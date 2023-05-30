Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1512CC7EE23
	for <buildroot@archiver.kernel.org>; Tue, 30 May 2023 19:28:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8DBC040289;
	Tue, 30 May 2023 19:28:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8DBC040289
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MZNVBOA8DyNn; Tue, 30 May 2023 19:28:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0DCCD415FD;
	Tue, 30 May 2023 19:28:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0DCCD415FD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D21E61BF35F
 for <buildroot@lists.busybox.net>; Tue, 30 May 2023 19:28:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B5ECA415FD
 for <buildroot@lists.busybox.net>; Tue, 30 May 2023 19:28:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B5ECA415FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TkLs4McvVIDa for <buildroot@lists.busybox.net>;
 Tue, 30 May 2023 19:28:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A37C40289
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0A37C40289
 for <buildroot@buildroot.org>; Tue, 30 May 2023 19:28:05 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-30aebe2602fso1951704f8f.3
 for <buildroot@buildroot.org>; Tue, 30 May 2023 12:28:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685474884; x=1688066884;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wJoaiNza3ifCRLPfPG8oRmMz/hl1aT4H6wUgePOU4UU=;
 b=NG91Fz6LmUajKkET6WUypLJL9eNy1IzzLE5F9d1HTgjFElipg7PQBteePC2O4JjLH2
 EfxD+mACfufNJYwf5S+fNgTJO9ubYeTg3kNKS3RE1T4HLxpvLYeE4kQgo9Q9arumteob
 f0XUvbkkUY7ZuGaEsB/IdaZSdMPH1jCIvT5vKwXrengWo3TZ2a5Pr+0SCqjCehN+3IM1
 jdh+GJK61KR0SiEXcea+CqK3hdd02Q/EAjCkQq3VDG2J9bgPj2JKUZotW3ZLlMlo/CVN
 znFFrOd4IvoBgfDj9STi6/xfU+zxspOWaUpwdhDCGpJQwGNQalcubVfeFjH/V+z5wbzr
 7jzA==
X-Gm-Message-State: AC+VfDyKaTGh26g4dwKf0Tz8XP4EmlfZe6OeeBs0umhy4VoSPrm9xQ6K
 ch3fwfxyfDRXOEMHCzCDlU+i5PS01eI=
X-Google-Smtp-Source: ACHHUZ41zAAcdVka8la1bXWLdrIeH3tct85GtPkc7L4AGIZl9sdBnNgL3uEzbIHrOn7WFf81Gqr1JA==
X-Received: by 2002:a5d:4acf:0:b0:309:4f23:e52e with SMTP id
 y15-20020a5d4acf000000b003094f23e52emr2510586wrs.15.1685474883661; 
 Tue, 30 May 2023 12:28:03 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 x11-20020a5d490b000000b003063a92bbf5sm4169100wrq.70.2023.05.30.12.28.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 May 2023 12:28:03 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 30 May 2023 21:27:56 +0200
Message-Id: <20230530192757.2487642-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.34.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685474884; x=1688066884;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wJoaiNza3ifCRLPfPG8oRmMz/hl1aT4H6wUgePOU4UU=;
 b=HkMyUk5alTvaoxnhYRkAWFv1MGnDHvNpnQ3hIJhVtPuwPHt5A0DvlONm8F+GEDYSw0
 +PW4qIiwDRDsILyQ2dKPFc2rFxlSrmvfa8LbPqb4Cy1utu8aM3pPkrjjwTPIyeKPbJJK
 oA1V2VCsBA7j7CKU6vLCtErXl6Dk2YsP8B2S5w9LW0szIYWxwGiWqyxtu5Tpl/td0g5a
 f8yEVohri+lOb1RPGJmCnk855BFBTN0O046ai+cyAg2bu6lx5IO7h5RBlJIu8l6e74Zg
 30WuP7zUt9L8uv/deqTqFvs8nKAqkUAiqAvzumelor/4bQNwhUwBkGxeh+Xwqbzb9Sk/
 kfhA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=HkMyUk5a
Subject: [Buildroot] [PATCH 1/2] package/gcc: bump to version 12.3
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Remove upstream patch.

See announce:
https://gcc.gnu.org/pipermail/gcc-announce/2023/000176.html

Runtime tested:
https://gitlab.com/kubu93/buildroot/-/pipelines/882178578

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 .checkpackageignore                           |  3 +-
 package/gcc/12.2.0/0002-fix-condvar.patch     | 82 -------------------
 ...le-split-stack-for-non-thread-builds.patch |  0
 package/gcc/Config.in.host                    |  2 +-
 package/gcc/gcc.hash                          |  4 +-
 5 files changed, 4 insertions(+), 87 deletions(-)
 delete mode 100644 package/gcc/12.2.0/0002-fix-condvar.patch
 rename package/gcc/{12.2.0 => 12.3.0}/0001-disable-split-stack-for-non-thread-builds.patch (100%)

diff --git a/.checkpackageignore b/.checkpackageignore
index f2dea0dfd9..a8338883d0 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -524,8 +524,7 @@ package/gcc/11.3.0/0003-gcc-define-_REENTRANT-for-OpenRISC-when-pthread-is-p.pat
 package/gcc/11.3.0/0004-disable-split-stack-for-non-thread-builds.patch Upstream
 package/gcc/11.3.0/0005-rs6000-Improve-.machine.patch Upstream
 package/gcc/11.3.0/0006-rs6000-Do-not-use-rs6000_cpu-for-.machine-ppc-and-pp.patch Upstream
-package/gcc/12.2.0/0001-disable-split-stack-for-non-thread-builds.patch Upstream
-package/gcc/12.2.0/0002-fix-condvar.patch Upstream
+package/gcc/12.3.0/0001-disable-split-stack-for-non-thread-builds.patch Upstream
 package/gcc/8.4.0/0001-xtensa-fix-PR-target-91880.patch Upstream
 package/gcc/8.4.0/0002-Revert-re-PR-target-92095-internal-error-with-O1-mcp.patch Upstream
 package/gcc/8.4.0/0003-libsanitizer-Remove-cyclades-from-libsanitizer.patch Upstream
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
index 400d8eb07b..f099ccb11b 100644
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
-- 
2.34.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
