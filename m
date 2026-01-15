Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 791B2CCF2D4
	for <buildroot@archiver.kernel.org>; Mon, 19 Jan 2026 09:58:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40C0281CA3;
	Mon, 19 Jan 2026 09:58:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id unOSuZCnkwmV; Mon, 19 Jan 2026 09:58:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7FFCD81C56
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768816735;
	bh=giKu8r7vC/vrvN2y5S1Ojo2QUqhNe3fwmmBQxJm1Ed4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gHUyEdWOy8xlBw71BMYaytkxaT/syOdkmUUJzfmlDOSnYQQWay5OVnjUmQeY7h79w
	 k5ktLl3BoGZluFsUwyFt0I2R687R6VpE3no5BDhn89t91qA3l2owNy3ZM0+P595xe6
	 /ftewG4MEn8qKtT1S9/1m6V54gjkiu+8kBi3JVGi4eq5otNp3MpiMxVmEJwHejY8NJ
	 eHnxVyCqkCU99f360KMbXVnn1tMvUYqG6o9Yfgc9/H16Fqe/x3R6O7/P2Dse6kP+Qm
	 rO0vIFBCcLcA/e855w29WrzeYVYqHgraEYOxCMPMnYvCDxQCKTxzXk/i/ZVPuepo1n
	 YdaE1Ex7f/zcA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FFCD81C56;
	Mon, 19 Jan 2026 09:58:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id EE03FA3F
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 09:58:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D43E060C14
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 09:58:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BzECg_LGjVKp for <buildroot@buildroot.org>;
 Mon, 19 Jan 2026 09:58:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A19D60B4B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7A19D60B4B
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 09:58:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 71FD288678; Mon, 19 Jan 2026 09:58:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Jan 2026 09:10:45 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: f3cd116dbdfad2fc63610a4590600326cff422bd
X-Git-Newrev: 87ba95a92b828f9cd20b9196203fac3b4cb05a34
X-Patchwork-Hint: ignore
Message-Id: <20260119095849.71FD288678@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
 configs/beagleboneai_defconfig: fix whitespace
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=87ba95a92b828f9cd20b9196203fac3b4cb05a34
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Signed-off-by: Philip Molloy <philip.molloy@analog.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 18655efbd5eab0fe8e9f5fd208647de04715cd9b)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 board/beagleboard/beagleboneai/genimage.cfg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/beagleboard/beagleboneai/genimage.cfg b/board/beagleboard/beagleboneai/genimage.cfg
index 8aefd76ef8..02e61bc9be 100644
--- a/board/beagleboard/beagleboneai/genimage.cfg
+++ b/board/beagleboard/beagleboneai/genimage.cfg
@@ -19,7 +19,7 @@ image sdcard.img {
 	partition u-boot {
 		partition-type = 0xC
 		bootable = "true"
-                image = "boot.vfat"
+		image = "boot.vfat"
 	}
 
 	partition rootfs {
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
