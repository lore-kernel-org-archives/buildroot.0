Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65444C2D0CD
	for <buildroot@archiver.kernel.org>; Thu, 15 May 2025 14:53:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12F1B409F6;
	Thu, 15 May 2025 14:53:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8UJq8vsrvm9j; Thu, 15 May 2025 14:53:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F13CE4072D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F13CE4072D;
	Thu, 15 May 2025 14:53:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 07AB9119
 for <buildroot@buildroot.org>; Thu, 15 May 2025 14:53:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 03CD8406DE
 for <buildroot@buildroot.org>; Thu, 15 May 2025 14:53:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n6EUELUvjR8z for <buildroot@buildroot.org>;
 Thu, 15 May 2025 14:53:01 +0000 (UTC)
X-Greylist: delayed 602 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 15 May 2025 14:53:00 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9E808406C8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E808406C8
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=114.111.35.239;
 helo=cvsmtppost28.nm.naver.com; envelope-from=dungeonlords789@naver.com;
 receiver=<UNKNOWN> 
Received: from cvsmtppost28.nm.naver.com (cvsmtppost28.nm.naver.com
 [114.111.35.239])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9E808406C8
 for <buildroot@buildroot.org>; Thu, 15 May 2025 14:52:59 +0000 (UTC)
X-Originating-IP: 125.132.232.68
Received: from cvsendbo027.nm ([10.112.22.36])
 by cvsmtppost28.nm.naver.com with ESMTP id BwRqjT05TgqvSum7wbaehw
 for <buildroot@buildroot.org>; Thu, 15 May 2025 14:42:56 -0000
X-Session-ID: xNdbd-60S4CqYmRD8ddtKA
X-Originating-IP: 125.132.232.68
X-Works-Send-Opt: x/YZjAJYjHmlKxu/FoJYKxgXKBwkx0eFjAJYKg==
X-Works-Smtp-Source: e9n/KobdFqJZ+Hm9FqbX+6E=
Received: from Linux.. ([125.132.232.68])
 by cvnsmtp010.nm.naver.com with ESMTP id xNdbd-60S4CqYmRD8ddtKA
 for <multiple recipients>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 15 May 2025 14:42:55 -0000
From: Cherniaev Andrei <dungeonlords789@naver.com>
To: buildroot@buildroot.org
Cc: Cherniaev Andrei <dungeonlords789@naver.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 15 May 2025 23:42:40 +0900
Message-ID: <20250515144241.3082079-1-dungeonlords789@naver.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=naver.com; s=s20171208; 
 t=1747320176; bh=W8bieZV5XdT9jEKEbuOxgVOKtS7IN2pEErwaGcfPb6Y=;
 h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
 X-Works-Security;
 b=LVFOdisgi8ordpDxr3aUh5+pA6jTdO+7GYs4TNFhsRjSz3XnxQHa8/d+9jS/N783W
 HRFiXb7yhIhNOJ26cmFfpRkGuc1hb9iRWZj05vXf7zpQFiSjegnmVoBGVbvMf+b/FJ
 GQoPuOx9M0nE4fU+QSJOf5cRfp5a3Y0c79Qj623UHLl4pQoaMCGY/iqIltDOkkpb0x
 XljM5haq3EjGBu/ad5aCE6vM5xIXGOPDzfoaeG5U3Pzhs496PMImOlfumrFMl+tKCL
 hwPtpUCc9vn0tcu6O8B3wOb9J1Qw77ICG5URn42BavZje3zEK1S3o3xZUsgVmZIa/I
 XdgiLVY5LZshg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=naver.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=naver.com header.i=@naver.com header.a=rsa-sha256
 header.s=s20171208 header.b=LVFOdisg
Subject: [Buildroot] [PATCH] boot/grub2/readme.txt: fix script
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix regression of commit 552ba600eef0884bb7bf7f09a67cd66747d1efa8 Without `--show` loop_dev variable will be empty so script never works... Sorry, it was my mistake...
---
 boot/grub2/readme.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/boot/grub2/readme.txt b/boot/grub2/readme.txt
index d0999ec390..3b7df3a47d 100644
--- a/boot/grub2/readme.txt
+++ b/boot/grub2/readme.txt
@@ -10,7 +10,7 @@ Notes on using Grub2 for BIOS-based platforms
       is enough free space *before* the first partition to
       store Grub2. Leaving 1 MB of free space is safe.
 3. Setup loop device and loop partitions
-   loop_dev=$(sudo losetup -f disk.img)
+   loop_dev=$(sudo losetup -f --show disk.img)
    sudo partx -a "$loop_dev"
 4. Prepare the root partition
    sudo mkfs.ext3 -L root "${loop_dev}p1"
@@ -65,7 +65,7 @@ Notes on using Grub2 for x86/x86_64 EFI-based platforms
     - Create a second partition, type 8300, for the root
       filesystem.
 3. Setup loop device and loop partitions
-   loop_dev=$(sudo losetup -f disk.img)
+   loop_dev=$(sudo losetup -f --show disk.img)
    sudo partx -a "$loop_dev"
 4. Prepare the boot partition
    sudo mkfs.vfat -n boot "${loop_dev}p1"
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
