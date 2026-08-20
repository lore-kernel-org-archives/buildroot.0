Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 890E5C5DF94
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 15:07:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 49ADE811C1;
	Fri, 21 Aug 2026 15:07:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WN1uRRdCdtQm; Fri, 21 Aug 2026 15:07:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787324831;
	bh=zmhQSPzI+qEJOVT2nSOzQO7q0L0h4bQRYcrRj1YgqBw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Zd9lFEXYaA4YmyXtKnh/Nv9YKOppOjBLYzTPiboG3JoXDWvLXEwNFwj6EnHDUMerU
	 opB8kGE24xXsi4q6kxJ6uvz6BnUke5ww7LO7PGp0QPOuy8lTd8hJV74KyZlftT/LYS
	 x9giY3Ak9vgR5EhNHMYimc8qdsOwwEByFI2Lgl8KVUhlDmDhW11rbqZfvtMzKJv+EG
	 5yVbil0YmnQVW20gKNHglNkgPB4Pjxyua7HrR2FJhRYSftUI+YZirLLXQAcX4/DNzx
	 pVxX88sREbUds2VDqAd60Ep4/nUeH+hBv49cBP4AGrjazhWyqUca5vEzC1ZKahZKbq
	 6bZzjrOmR54Qw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 146B18117B;
	Fri, 21 Aug 2026 15:07:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 50FA41CF2
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:07:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3F9734041C
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:07:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NKjPxko55k0F for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 15:07:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 33CB14004E
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:07:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A61438E183; Fri, 21 Aug 2026 15:06:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 20 Aug 2026 10:56:07 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 9a353d8cf119c1a45104656367b07fb73b6c3833
X-Git-Newrev: f32eeb55c70b3d8be8bcd1791b72317801ff6537
X-Patchwork-Hint: ignore
Message-Id: <20260821150613.A61438E183@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libgit2: security
 bump version to 1.9.6
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f32eeb55c70b3d8be8bcd1791b72317801ff6537
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
(cherry picked from commit 3c2d207f8c65d025d12e40d786f5208933684f44)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
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
