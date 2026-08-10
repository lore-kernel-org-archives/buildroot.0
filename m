Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 655C1C5AD7B
	for <buildroot@archiver.kernel.org>; Mon, 10 Aug 2026 18:39:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3C9F80EFE;
	Mon, 10 Aug 2026 18:39:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QnuXDu2Dy8xB; Mon, 10 Aug 2026 18:39:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1CA5F80F05
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786387197;
	bh=0X3JVsJsAhDx/n5z4X/v60yd6CB9KLqVoqpMWQjh/pE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rM5PJzFtLcfOETBJxdI1qhh/ofDCO+IshKQlvuZPv48Z54TZjuUGa/1jEszX2uN+0
	 MAj69ulqfVHYhhD4jgf++q/vJu+CBQK4smbgN70yni/46/YMWyIvnrVipbA0fq7+cl
	 gKQU8LDcxV7uEt8J0ICLOzvW6JnPkmEhfYc/7ixsJWE4De4+TClDRLZnimNgkd+/s8
	 XMPIqsqmk/57RZ+vpma1YYf3x8i/DF0jji9ihzLUkW3cYbnT+6ZcjQAGNzTtQmvrUy
	 lY94bE84rbCAR+wG5Rpc5O8FINis1h0GEEnfBZ9FQb4QZR2v+nZdemJWMPX3hzJDzH
	 9fvD00E0Gk63A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1CA5F80F05;
	Mon, 10 Aug 2026 18:39:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6F657218
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 18:39:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5589F40688
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 18:39:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id buSidbF0IS6L for <buildroot@buildroot.org>;
 Mon, 10 Aug 2026 18:39:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6804D40684
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6804D40684
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 18:39:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 400AB8D30E; Mon, 10 Aug 2026 18:39:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 10 Aug 2026 20:38:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d705d20506c2a30992810002c63a513982820ad0
X-Git-Newrev: 3c2d207f8c65d025d12e40d786f5208933684f44
X-Patchwork-Hint: ignore
Message-Id: <20260810183906.400AB8D30E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgit2: security bump version to
 1.9.6
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3c2d207f8c65d025d12e40d786f5208933684f44
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

v1.9.5 fixes CVE-2026-53586, CVE-2026-53587, CVE-2026-53585,
CVE-2026-53584, CVE-2026-53583.  v1.9.6 fixes other non-security issues.

Release notes:
https://github.com/libgit2/libgit2/releases/tag/v1.9.5
https://github.com/libgit2/libgit2/releases/tag/v1.9.6

v1.9.5 also replaces a bundled vulnerable libpcre with libpcre2 and
updated the PCRE license in COPYING as a result.  This is mostly useful
on Windows; On POSIX systems, libgit2 can use regcomp() and Buildroot
already asks for it. See:
https://github.com/libgit2/libgit2/commit/3a9102dae9aef333791bf03ba1a00d2cc78ecfc2

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
[Julien: add link to license update upstream commit]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libgit2/libgit2.hash | 4 ++--
 package/libgit2/libgit2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libgit2/libgit2.hash b/package/libgit2/libgit2.hash
index f30f0c528c..38486c4e4d 100644
--- a/package/libgit2/libgit2.hash
+++ b/package/libgit2/libgit2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  824b73bd13647800fe4b566a1008ae77fea0e3e3424edab632fcfd8c0b14ba8b  libgit2-1.9.4.tar.gz
-sha256  e3712465634e97cfd850822a4eb5ac7d2f8a10f753189366d5a2060046f28288  COPYING
+sha256  a88a42a4ea9bdab7aa8686eead3bf7d9c6dd74529caca16ab22eaa92433d31d9  libgit2-1.9.6.tar.gz
+sha256  e0938121c0554985fe17196ac38fc590d149268e9c46e0c0e7a2eae1354fae71  COPYING
diff --git a/package/libgit2/libgit2.mk b/package/libgit2/libgit2.mk
index 5f18be9550..b4d9984540 100644
--- a/package/libgit2/libgit2.mk
+++ b/package/libgit2/libgit2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGIT2_VERSION = 1.9.4
+LIBGIT2_VERSION = 1.9.6
 LIBGIT2_SITE = $(call github,libgit2,libgit2,v$(LIBGIT2_VERSION))
 LIBGIT2_LICENSE = \
 	GPL-2.0 with linking exception, \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
