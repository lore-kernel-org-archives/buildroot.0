Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6435C52D7C
	for <buildroot@archiver.kernel.org>; Fri, 23 Aug 2024 15:53:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9265184106;
	Fri, 23 Aug 2024 15:53:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UPXIpTEb_k59; Fri, 23 Aug 2024 15:53:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB48F84115
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB48F84115;
	Fri, 23 Aug 2024 15:53:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AB8C61BF313
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 15:53:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A5D8740399
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 15:53:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Oeo0rhMHJuo9 for <buildroot@lists.busybox.net>;
 Fri, 23 Aug 2024 15:53:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A763E40277
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A763E40277
 for <buildroot@buildroot.org>; Fri, 23 Aug 2024 15:53:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 940B08635F; Fri, 23 Aug 2024 15:53:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 23 Aug 2024 17:52:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ed2d440a08aba129a737705b2ac4231dc1bb0be4
X-Git-Newrev: 8b483b3032ee5f6279f33546517e5b05b936d06b
X-Patchwork-Hint: ignore
Message-Id: <20240823155324.940B08635F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/qemu/patches/arm-trusted-firmware:
 add v2.10 hash
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

commit: https://git.buildroot.net/buildroot/commit/?id=8b483b3032ee5f6279f33546517e5b05b936d06b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes https://gitlab.com/buildroot.org/buildroot/-/jobs/7644930127
ERROR: No hash found for arm-trusted-firmware-v2.10-git4.tar.gz

Commit d037d9c2d63e9cd47b (configs/qemu: Update defconfigs to Linux 6.6.32)
enabled BR2_DOWNLOAD_FORCE_CHECK_HASHES, but forgot to take into
consideration that qemu_aarch64_ebbr_defconfig uses arm-trusted-firmware
v2.10 since commit 73813c56c8bb (configs/qemu_{arm, aarch64}_ebbr: bump
Linux, U-Boot and TF-A).

Add the hash to fix the build.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/qemu/patches/arm-trusted-firmware/arm-trusted-firmware.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/board/qemu/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/qemu/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index 0b99949745..5632db01f8 100644
--- a/board/qemu/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/qemu/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,3 @@
 # Locally computed:
 sha256  c9f0d0bf967d690edbf34b621728a6271856f2e26ed46081a285b6d627a358c5  arm-trusted-firmware-v2.7-git4.tar.gz
+sha256  7efa89e1b4e4106ee05d68e876c8efbb146364d89cfd5d26bf4647b09c08f32b  arm-trusted-firmware-v2.10-git4.tar.gz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
