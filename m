Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E419BCDD0F4
	for <buildroot@archiver.kernel.org>; Tue, 22 Oct 2024 20:54:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A7DD580AFC;
	Tue, 22 Oct 2024 20:54:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W-Rsoeko-Ihf; Tue, 22 Oct 2024 20:54:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AFFE280C09
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AFFE280C09;
	Tue, 22 Oct 2024 20:54:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B83F59F4
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 20:54:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E02CE80C09
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 20:54:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QPJp7_qYpiVt for <buildroot@buildroot.org>;
 Tue, 22 Oct 2024 20:54:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B81A80AFC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1B81A80AFC
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 20:54:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 126758621D; Tue, 22 Oct 2024 20:54:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 22 Oct 2024 22:52:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e087f183408283c1deb05ffb5dab8348980a8b6a
X-Git-Newrev: 164d9f0546372eb076506eebc8f88c6c4a544a36
X-Patchwork-Hint: ignore
Message-Id: <20241022205423.126758621D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/uboot: update link to the U-Boot docs
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=164d9f0546372eb076506eebc8f88c6c4a544a36
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The denx.de/wiki/U-Boot link now redirects to docs.u-boot.org/en/latest
Replace the link to the new location for the U-Boot documentation

Signed-off-by: Bryan Brattlof <bb@ti.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/uboot/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index bfe61cd167..8648d6eb7e 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -3,7 +3,7 @@ config BR2_TARGET_UBOOT
 	help
 	  Build "Das U-Boot" Boot Monitor
 
-	  https://www.denx.de/wiki/U-Boot
+	  https://docs.u-boot.org/en/latest/
 
 if BR2_TARGET_UBOOT
 choice
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
