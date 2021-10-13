Return-Path: <SRS0=94yL=PB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E168C433F5
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 19:40:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17E9461168
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 19:40:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 17E9461168
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA29B80A4F;
	Wed, 13 Oct 2021 19:40:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oO699x_G650U; Wed, 13 Oct 2021 19:40:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D17D826A4;
	Wed, 13 Oct 2021 19:40:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E42E31BF2F0
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 19:38:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C2247832D0
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 19:38:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qMMjK7Z6X5V1 for <buildroot@lists.busybox.net>;
 Wed, 13 Oct 2021 19:38:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6908E832C9
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 19:38:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id AF0D795B2D; Wed, 13 Oct 2021 19:35:33 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 13 Oct 2021 20:43:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ae68285509b8519970697b78a48eb8a7287ca264
X-Git-Newrev: 5f1c6758a561134e30fe9fb7fae55e5d6e97d01a
X-Patchwork-Hint: ignore
Message-Id: <20211013193533.AF0D795B2D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ruby: fix build with autoconf >=
 2.70
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

commit: https://git.buildroot.net/buildroot/commit/?id=5f1c6758a561134e30fe9fb7fae55e5d6e97d01a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since bump of autoconf to version
2.71 in commit ecd54b65c1f998a7ccd91f7c523e4ff38c4781da:

checking whether the C++ compiler works... no
configure: error: in `/home/buildroot/autobuild/instance-3/output-1/build/ruby-3.0.2':
configure: error: C++ compiler cannot create executables

Fixes:
 - http://autobuild.buildroot.org/results/63f32033aff5c800a933d8b1c805be0d9d6abea6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/ruby/0002-Needs-AC_PROG_CC.patch | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/package/ruby/0002-Needs-AC_PROG_CC.patch b/package/ruby/0002-Needs-AC_PROG_CC.patch
new file mode 100644
index 0000000000..647358be70
--- /dev/null
+++ b/package/ruby/0002-Needs-AC_PROG_CC.patch
@@ -0,0 +1,28 @@
+From 912a8dcfc5369d840dcd6bf0f88ee0bac7d902d6 Mon Sep 17 00:00:00 2001
+From: Nobuyoshi Nakada <nobu@ruby-lang.org>
+Date: Thu, 30 Sep 2021 18:24:37 +0900
+Subject: [PATCH] Needs `AC_PROG_CC`
+
+Although `AC_PROG_CC_C99` has been obsolete, `AC_PROG_CC` is not
+and the latter is necessary not to make C++ compiler mandatory.
+
+[Retrieved from:
+https://github.com/ruby/ruby/commit/912a8dcfc5369d840dcd6bf0f88ee0bac7d902d6]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index b24a8f59b0d2..c7059ee1ecf4 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -218,7 +218,7 @@ rb_test_CXXFLAGS=${CXXFLAGS+yes}
+ # BSD's ports and MacPorts prefix GNU binutils with 'g'
+ 
+ dnl Seems necessarily in order to add -std=gnu99 option for gcc 4.9.
+-m4_version_prereq([2.70], [], [AC_PROG_CC_C99])
++m4_version_prereq([2.70], [AC_PROG_CC], [AC_PROG_CC_C99])
+ 
+ AC_PROG_CXX
+ AC_PROG_CPP
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
