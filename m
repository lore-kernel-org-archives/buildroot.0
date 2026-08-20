Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9A62C5DF94
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 15:12:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8EFE81DF0;
	Fri, 21 Aug 2026 15:12:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o72yeMK6dCnF; Fri, 21 Aug 2026 15:12:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787325130;
	bh=QTkuVguI9cK1KBMxqpSzy7acQqgWTbRW/guoYEYrsd0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MTbwuxOPrJReFAQ91jjLMkyD3pXvxYeInby9yHGgQ3L0zAsUl9adjUh4qbiLnAuLc
	 CRwhxzbyCxCx4SWi+pA3Z4sVVCDu+slxHjoALwjjieSXOhpnhO+K/xGi4KJG90632j
	 g0nm+8qlBJkKx3/f6kvUbdBs39MHmaK3Rxz7WPQclwH/gE7Rr+HhV96usNiAwIXnIw
	 PsySsX68EHmm8nTBJiX7AOqucqvCJAy43wPPXrurjAU/KTc+g9mMq2btmrfy+htmMv
	 hGHCsxeSVol6cy9Og5FCpg/IPgmNk+hCdULIf9ncdaaxukvfoY1O+JLx5ex/EHo61X
	 hqKnr8ilkQ4Aw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E105381E0E;
	Fri, 21 Aug 2026 15:12:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 22AF629B
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:11:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 13CE340026
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:11:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id THpZacSGMXMz for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 15:11:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 844D5400AB
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:11:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DA1608DE49; Fri, 21 Aug 2026 15:10:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 20 Aug 2026 14:48:49 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 685efb096b29102995a9b98212484fab75b9540d
X-Git-Newrev: 1705db05ae627738f29ee91e505d0b28edc64373
X-Patchwork-Hint: ignore
Message-Id: <20260821151017.DA1608DE49@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/gcc: drop
 ARC-specific host-flex/host-bison dependency
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1705db05ae627738f29ee91e505d0b28edc64373
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

host-flex/host-bison are needed when building GCC from Git or from a
snapshot, not from release tarballs. The condition for the dependency
was actually incorrect: it was needed for the ARC-specific gcc
version (BR2_GCC_VERSION_ARC) but not for the ARC architecture in
general: building upstream GCC release tarballs for ARC does not
require host-flex/host-bison.

Cc: ARC Maintainers <arc-buildroot@synopsys.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 4f867f10392bcb651a42ec2ccf68efddfccf8c43)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/gcc/gcc.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 9109777bd7..04ba70c52c 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -198,10 +198,6 @@ else
 HOST_GCC_COMMON_CONF_OPTS += --without-isl --without-cloog
 endif
 
-ifeq ($(BR2_arc),y)
-HOST_GCC_COMMON_DEPENDENCIES += host-flex host-bison
-endif
-
 ifeq ($(BR2_SOFT_FLOAT),y)
 # only mips*-*-*, arm*-*-* and sparc*-*-* accept --with-float
 # powerpc seems to be needing it as well
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
