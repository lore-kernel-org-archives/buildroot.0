Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35475C79FBC
	for <buildroot@archiver.kernel.org>; Mon,  5 Jan 2026 19:52:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99FD740865;
	Mon,  5 Jan 2026 19:52:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xJhu2391Eo7M; Mon,  5 Jan 2026 19:52:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 695F3407D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767642760;
	bh=i9owTMGhgA4eTYgqisY0ASRDMXyiu9GmjKPyvFJphGo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=F8x71B8BOo8FQrvegz659OVnNHX9AEd4OcLPHJuCvsnSM1jO1OgLQ2FwAET+X5+bq
	 OGPoqoTyKoTT6mGvU2uuohRz8ESSKxvtLa1RY0Go/Tr946s9RQsZLmJsWBPRCV+6xh
	 CmTOHbLXdZHeVP+CJacJbFQS1PUh2ENrXEZYI+q+rZayS5cIj8GmzWCNTYRTWyxdeX
	 IQGPBDGQNT4pBGchlKJ9WYQCtvLHiucwuQFrHvOy/7e+27FSsUIhxthE/u2iw/qlkU
	 TN11IqqOKVONf3W6FJYlt9ggEWc5uQo2TMTRpVH4vhjfrcw8hOGwQ5iXo+HcXt4V16
	 2Ct8SS/0BQS0A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 695F3407D7;
	Mon,  5 Jan 2026 19:52:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5169196F
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 19:52:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CCB0940625
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 19:52:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vVofLbvbcHq6 for <buildroot@buildroot.org>;
 Mon,  5 Jan 2026 19:52:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 27DFA40088
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 27DFA40088
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 19:52:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1993B88280; Mon,  5 Jan 2026 19:52:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 5 Jan 2026 18:52:30 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 072f01878b46307c96d5526bebca35b75d2c43c3
X-Git-Newrev: 6721942c98b8b691c480e8d6b9c333faed2c7f89
X-Patchwork-Hint: ignore
Message-Id: <20260105195237.1993B88280@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/beaglebone: Enable AM33X_CM3 config
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

commit: https://git.buildroot.net/buildroot/commit/?id=6721942c98b8b691c480e8d6b9c333faed2c7f89
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add support for suspend resume by enabling AM33X_CM3 config.

Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 configs/beaglebone_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
index 11859a6c02..be11186f8c 100644
--- a/configs/beaglebone_defconfig
+++ b/configs/beaglebone_defconfig
@@ -19,6 +19,7 @@ BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/omap/am335x-evm ti/omap/am335x-bone ti/omap
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
 BR2_PACKAGE_XZ=y
+BR2_PACKAGE_AM33X_CM3=y
 BR2_PACKAGE_KMOD=y
 BR2_PACKAGE_KMOD_TOOLS=y
 BR2_TARGET_ROOTFS_EXT2=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
