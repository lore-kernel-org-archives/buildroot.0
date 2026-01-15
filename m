Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FC6ACCF2D4
	for <buildroot@archiver.kernel.org>; Mon, 19 Jan 2026 09:59:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D658B40CF6;
	Mon, 19 Jan 2026 09:59:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id srEDU0xtjUSu; Mon, 19 Jan 2026 09:59:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EAAAA40CE4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768816745;
	bh=2nn7uCAQ+1Gkwu/2BKALB1jI+MgZQHhuhO3XLpAKd9o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pAVGcNkJ1bebz6eRmp3hJpVK6bUnKiEbPDFCfP9VUJi5UpLX74v1VjdAlzTbrYib9
	 VN1PtoLqxkhzFSDyiNfBoJqMu3eThPR2shV+bLxHpRLOPYy5Z9dzGBhYP27wb2m2UP
	 VoyGlPh3FUKy0u5yB7ZFt4MamepN0/iEK9Tj5OwWYHYK8Q9xh1Q/TGlchHC4J9M5hJ
	 WtPVS3espGJLUsSaHZXoOAqKbYTjdhh9cBulVG7sz3AmFaaNzmfnBRGxa2n3/JpwF3
	 3ewv9OetfcVcNmwkYVTWTYIRlq6h6FnwQ6z5NqaWj7aElmwTv9BRhQIG/Yr+GczsKv
	 wOebMeRdyR/Nw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EAAAA40CE4;
	Mon, 19 Jan 2026 09:59:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7133C160
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 09:58:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BAA53406CA
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 09:58:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8YNTR0BUIeVb for <buildroot@buildroot.org>;
 Mon, 19 Jan 2026 09:58:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 75584406D4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 75584406D4
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 09:58:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 72D6388366; Mon, 19 Jan 2026 09:58:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Jan 2026 09:28:49 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 460748400820b0602eb8e568b76e96358189ac42
X-Git-Newrev: 65c79510a982e23a0bec71c5d972416b83b05540
X-Patchwork-Hint: ignore
Message-Id: <20260119095850.72D6388366@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/xen: xen tools
 need coreutils stat at runtime
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6440506240245295871=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6440506240245295871==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=65c79510a982e23a0bec71c5d972416b83b05540
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Xen tools scripts need the stat program from coreutils to work
correctly, and not the one from busybox.
One such example is the /etc/xen/scripts/locking.sh script, which will
cause timeouts for operations such as "xl block-attach", or when
starting a DomU with a disk.

Add the dependency on coreutils to fix this.

Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
Cc: Alistair Francis <alistair@alistair23.me>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit ca23f860d1d5ed83cfa5eece8911d26a593b2f3e)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/xen/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/xen/Config.in b/package/xen/Config.in
index 70a06f3cbf..e8168ca8c8 100644
--- a/package/xen/Config.in
+++ b/package/xen/Config.in
@@ -35,6 +35,7 @@ config BR2_PACKAGE_XEN_TOOLS
 	select BR2_PACKAGE_ARGP_STANDALONE if !BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_BASH # runtime (scripts)
 	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS if BR2_PACKAGE_BUSYBOX # bash
+	select BR2_PACKAGE_COREUTILS # runtime (stat)
 	help
 	  The Xen tools can be accessed by the xl command.
 

--===============6440506240245295871==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6440506240245295871==--
