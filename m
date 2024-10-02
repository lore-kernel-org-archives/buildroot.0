Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 892EBCF31BF
	for <buildroot@archiver.kernel.org>; Wed,  2 Oct 2024 20:53:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 357CA81FEE;
	Wed,  2 Oct 2024 20:53:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q4XNtqjemQST; Wed,  2 Oct 2024 20:53:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EFE8B81F9E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EFE8B81F9E;
	Wed,  2 Oct 2024 20:53:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 93DC71BF97E
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 20:53:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8301460632
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 20:53:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id weceiq4l3BeE for <buildroot@lists.busybox.net>;
 Wed,  2 Oct 2024 20:53:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E3AE60035
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7E3AE60035
 for <buildroot@buildroot.org>; Wed,  2 Oct 2024 20:53:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6A10B8472A; Wed,  2 Oct 2024 20:53:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 2 Oct 2024 22:51:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4856583d4f5384305bab9ba6837ff42e1e724fca
X-Git-Newrev: dd5f3ffd87ad681d5def8b4dca2003e2bcd7e798
X-Patchwork-Hint: ignore
Message-Id: <20241002205324.6A10B8472A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fwts: enable on RISC-V 64-bit
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=dd5f3ffd87ad681d5def8b4dca2003e2bcd7e798
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

fwts RISC-V 64bit support was introduced in version 20.07.00, see [1].

This commit adds this architecture in _ARCH_SUPPORTS.

[1] https://wiki.ubuntu.com/FirmwareTestSuite/ReleaseNotes/20.07.00

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/fwts/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/fwts/Config.in b/package/fwts/Config.in
index 08608d1dd7..2eebd111b0 100644
--- a/package/fwts/Config.in
+++ b/package/fwts/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_FWTS_ARCH_SUPPORTS
 	default y if BR2_aarch64
 	default y if BR2_arm
 	default y if BR2_i386
+	default y if BR2_RISCV_64
 	default y if BR2_x86_64
 
 config BR2_PACKAGE_FWTS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
