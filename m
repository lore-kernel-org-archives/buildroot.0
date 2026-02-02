Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB6ABE7DEF8
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 15:40:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89CC6814A1;
	Mon,  2 Feb 2026 15:40:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U0B7yvKVyDlU; Mon,  2 Feb 2026 15:40:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7CA6F814B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770046819;
	bh=6EvVWaXPmSWhrnRbW5UBb1IguTRhJjqBt1SoIJJfbq0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JhaZijRrEAOVHwKm2bFuC9MmyZVoUPtFQXzaxOKX8tJkztAdmvk3FMYTYW9UM4mf+
	 4aOqMBh3PjLAjvP621xA3tMUILstH0h3JSDNw3ezolvNhHtgGel9KAaowXbVyh44Kf
	 DkG23jrCh3O6sHYwjewk0mOoTwgMAFV23itgZ9kvQ7nupGtUCNSNb49vjlVUAEk/Tw
	 0Md0nV+0sY7xb1HM4n0Lu5gwckGWCFc3mD/Y6zpK5C312nI+9fYqlej5DCehBqM/8g
	 Iy5+YTqFbnXw3GtozOpYLVQobcVQcDtMjkAhCxDUo/O2NYGDREuMoolmDVx+dOUoGm
	 F0eZz7mgcUkgQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7CA6F814B5;
	Mon,  2 Feb 2026 15:40:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 32CA823E
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 15:40:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 08530402EE
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 15:40:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dLOp4f_FuKA2 for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 15:40:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 06699402C3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 06699402C3
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 15:40:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E77BA863A5; Mon,  2 Feb 2026 15:40:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 2 Feb 2026 16:21:47 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3d1b77f98a079cb6a36c185d6744e1f42bd04951
X-Git-Newrev: 1822f07e94951c5a37f78c1009d54fc95d01d39c
X-Patchwork-Hint: ignore
Message-Id: <20260202154016.E77BA863A5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/glibc: enable hppa support
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
Content-Type: multipart/mixed; boundary="===============2475236442540107549=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2475236442540107549==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=1822f07e94951c5a37f78c1009d54fc95d01d39c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add support for HPPA.

Signed-off-by: Vincent Stehlé <vincent.stehle@laposte.net>
Cc: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 arch/Config.in          | 1 -
 package/glibc/Config.in | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/Config.in b/arch/Config.in
index d21e8cc8f5..bdfc2b092c 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -68,7 +68,6 @@ config BR2_aarch64_be
 config BR2_hppa
 	bool "HPPA"
 	select BR2_USE_MMU
-	select BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT
 	help
 	  Precision Architecture (a.k.a. PA-RISC) is a 32-bit
 	  (big endian) architecture developed by Hewlett Packard.
diff --git a/package/glibc/Config.in b/package/glibc/Config.in
index b066616a01..2bf44bb70b 100644
--- a/package/glibc/Config.in
+++ b/package/glibc/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_GLIBC_ARCH_SUPPORTS
 	default y if BR2_armeb
 	default y if BR2_aarch64
 	default y if BR2_aarch64_be
+	default y if BR2_hppa
 	default y if BR2_i386
 	default y if BR2_loongarch64
 	default y if BR2_m68k_m68k

--===============2475236442540107549==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2475236442540107549==--
