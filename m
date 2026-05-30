Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA00CCD6E4A
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 08:35:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E8FD42DD7;
	Sat, 30 May 2026 08:35:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Uv7-wsc0RQR; Sat, 30 May 2026 08:35:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B3CEB412FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780130158;
	bh=6LcodcVbc95GFFx0a/SyX0yM2+w7iWmXXJO3i6mTXvE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OVS06WpvFiLVxECyjk4K9GY6uPc3PI5O7IcFjJrTr+qj7ilaRa60urub6c4dikCTM
	 OOX/ayTrGwzzvNA67vqM7Fa2d3MUAtjoVDC7x+UuXOoU6HM0X4vVDrk9ntjmCPLOQB
	 Om11NzQsOuWSv4fCflWNSNxOZk/mSmQWJuV+d2ZWF69Y7VNjBJ8QjL6JTJAl4manKW
	 J31ZYKVzXBC/400UbNYKrfe1f1tUSEsll3Y0/CsNhJpdS77z+XdezyMfqantiiGBNR
	 p5pDN8kGW82sgsczJ3fiA4Jcv1leST/TXd7j122CyJDB9DT9ZI+YKhvC3QiaPclAgB
	 8uWTUCrTr0XTQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3CEB412FF;
	Sat, 30 May 2026 08:35:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id AB1A2F4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 08:35:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9944560F4E
 for <buildroot@buildroot.org>; Sat, 30 May 2026 08:35:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d3WT_EWxZTVW for <buildroot@buildroot.org>;
 Sat, 30 May 2026 08:35:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C215760ED9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C215760ED9
 for <buildroot@buildroot.org>; Sat, 30 May 2026 08:35:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C76448642A; Sat, 30 May 2026 08:35:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 10:33:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 31716a180a3a8b3ebe53f8e68004cbfb1b1503e5
X-Git-Newrev: 232f8b5ca7aee3af04632df6616aa6919bd36d0e
X-Patchwork-Hint: ignore
Message-Id: <20260530083543.C76448642A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: add entry for Shubham
 Chakraborty (unrar)
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/232f8b5ca7aee3af04632df6616aa6919bd36d0e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 855ec491c9..941b12b0b7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3025,6 +3025,7 @@ F:	package/dos2unix/
 F:	package/htop/
 F:	package/hyperfine/
 F:	package/pv/
+F:	package/unrar/
 
 N:	Simon Dawson <spdawson@gmail.com>
 F:	boot/at91bootstrap3/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
