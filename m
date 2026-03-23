Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81E5EF483F5
	for <buildroot@archiver.kernel.org>; Mon, 23 Mar 2026 20:17:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52B9F406AF;
	Mon, 23 Mar 2026 20:17:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6ucuS8ZyWxZZ; Mon, 23 Mar 2026 20:17:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 695CA406C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774297028;
	bh=JfAEfmnxd9K5QfPHJedTm7Ybcl51tL3v+QGmMK+/9n0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Pf7IgyHuhMKq60O7grPwtag/J9ZvNsMK/j2xuYzNdLg5eiT3wYBmzQaFQk8r6Z/J4
	 6HruDQBc6kt6g3UkfywpFX8YQv5WV6/dSilSMh2HBRRj9bVjvjqiZx/SnH3Ossg17n
	 VUp16RMpJybYBgWzmAJxdu8wIvCz5/U8ZLIJWSaoEtOc++SZogDCaj93pH/+1mUCQv
	 kEqaLrOZzOD99r8YXKWPASwHN8dd+Nl9/BYBVSQS6YgHoYF4+tjHmRwRrtPswt4ntP
	 AzkKUtnZGO+wThpGxU1/DYDTPp5Fl8U+wB8xZeUPzp1La4HYsHV61dGwq2HbXh0mBx
	 AWAdS33VnkmZg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 695CA406C3;
	Mon, 23 Mar 2026 20:17:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 424E8353
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 20:17:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 281A8406C3
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 20:17:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Iuc9P4L26TLq for <buildroot@buildroot.org>;
 Mon, 23 Mar 2026 20:17:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F2C9406AF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5F2C9406AF
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 20:17:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8A6098496E; Mon, 23 Mar 2026 20:17:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 23 Mar 2026 21:16:04 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8937414d68240e66d6345a946b2916bf62fcfe4b
X-Git-Newrev: cf9a58b042feca2366107593904c14331ad5799a
X-Patchwork-Hint: ignore
Message-Id: <20260323201705.8A6098496E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openblas: fix build
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/cf9a58b042feca2366107593904c14331ad5799a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Buildroot commit b08ac7636dc7b2753592989dc5fe73959e0f6507 bumped the
package to version 0.3.31 and introduced a build error

linktest.c:(.text.startup+0x6f4):
 undefined reference to `openblas_set_threads_callback_function'

which according to https://github.com/OpenMathLib/OpenBLAS/issues/5607
was introduced by upstream commit
https://github.com/OpenMathLib/OpenBLAS/commit/879497990f42e6dcfa370bcbf478cc5674158336
that was first included in version 0.3.31.

This patch adds another upstream commit to fix the problem.

Fixes:
https://autobuild.buildroot.net/results/7d8/7d80a912ddda01acd109786641df02ad826399f6/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...ead-callback-replacement-hook-in-singleth.patch | 53 ++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/package/openblas/0002-Include-thread-callback-replacement-hook-in-singleth.patch b/package/openblas/0002-Include-thread-callback-replacement-hook-in-singleth.patch
new file mode 100644
index 0000000000..7ea199fb2e
--- /dev/null
+++ b/package/openblas/0002-Include-thread-callback-replacement-hook-in-singleth.patch
@@ -0,0 +1,53 @@
+From 874243421298866d116e1e8bdbd7e0ed4e31e4f6 Mon Sep 17 00:00:00 2001
+From: Martin Kroeker <martin@ruby.chemie.uni-freiburg.de>
+Date: Sun, 18 Jan 2026 19:55:40 +0100
+Subject: [PATCH] Include thread callback replacement hook in singlethreaded
+ builds as well
+
+Upstream: https://github.com/OpenMathLib/OpenBLAS/commit/874243421298866d116e1e8bdbd7e0ed4e31e4f6
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ driver/others/CMakeLists.txt | 2 +-
+ driver/others/Makefile       | 4 ++--
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/driver/others/CMakeLists.txt b/driver/others/CMakeLists.txt
+index a07a0baf99..72abdc4ee4 100644
+--- a/driver/others/CMakeLists.txt
++++ b/driver/others/CMakeLists.txt
+@@ -27,7 +27,6 @@ if (USE_THREAD)
+     ${BLAS_SERVER}
+     divtable.c # TODO: Makefile has -UDOUBLE
+     blas_l1_thread.c
+-    blas_server_callback.c
+   )
+ 
+   if (NOT NO_AFFINITY)
+@@ -42,6 +41,7 @@ set(COMMON_SOURCES
+   openblas_env.c
+   openblas_get_num_procs.c
+   openblas_get_num_threads.c
++  blas_server_callback.c
+ )
+ 
+ # these need to have NAME/CNAME set, so use GenerateNamedObjects, but don't use standard name mangling
+diff --git a/driver/others/Makefile b/driver/others/Makefile
+index 719d617c45..fbd016e6b0 100644
+--- a/driver/others/Makefile
++++ b/driver/others/Makefile
+@@ -1,12 +1,12 @@
+ TOPDIR	= ../..
+ include ../../Makefile.system
+ 
+-COMMONOBJS	 = memory.$(SUFFIX) xerbla.$(SUFFIX) c_abs.$(SUFFIX) z_abs.$(SUFFIX) openblas_set_num_threads.$(SUFFIX) openblas_get_num_threads.$(SUFFIX) openblas_get_num_procs.$(SUFFIX) openblas_get_config.$(SUFFIX) openblas_get_parallel.$(SUFFIX) openblas_error_handle.$(SUFFIX) openblas_env.$(SUFFIX)
++COMMONOBJS	 = memory.$(SUFFIX) xerbla.$(SUFFIX) c_abs.$(SUFFIX) z_abs.$(SUFFIX) openblas_set_num_threads.$(SUFFIX) openblas_get_num_threads.$(SUFFIX) openblas_get_num_procs.$(SUFFIX) openblas_get_config.$(SUFFIX) openblas_get_parallel.$(SUFFIX) openblas_error_handle.$(SUFFIX) openblas_env.$(SUFFIX) blas_server_callback.$(SUFFIX)
+ 
+ #COMMONOBJS	+= slamch.$(SUFFIX) slamc3.$(SUFFIX) dlamch.$(SUFFIX)  dlamc3.$(SUFFIX)
+ 
+ ifdef SMP
+-COMMONOBJS	+= blas_server.$(SUFFIX) divtable.$(SUFFIX) blasL1thread.$(SUFFIX) blas_server_callback.$(SUFFIX)
++COMMONOBJS	+= blas_server.$(SUFFIX) divtable.$(SUFFIX) blasL1thread.$(SUFFIX)
+ ifneq ($(NO_AFFINITY), 1)
+ COMMONOBJS	+= init.$(SUFFIX)
+ endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
