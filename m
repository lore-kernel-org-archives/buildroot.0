Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4F4FC3ABD8
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 15:08:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 821288112B;
	Fri, 16 May 2025 15:08:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7AFdylyIMwwV; Fri, 16 May 2025 15:08:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3FF34811B8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3FF34811B8;
	Fri, 16 May 2025 15:08:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id CBA621AB
 for <buildroot@buildroot.org>; Fri, 16 May 2025 15:08:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BC70C407B6
 for <buildroot@buildroot.org>; Fri, 16 May 2025 15:08:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PDN2XoIE_tp6 for <buildroot@buildroot.org>;
 Fri, 16 May 2025 15:08:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=114.111.35.158;
 helo=cvsmtppost15.nm.naver.com; envelope-from=dungeonlords789@naver.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 839BE40B9E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 839BE40B9E
Received: from cvsmtppost15.nm.naver.com (cvsmtppost15.nm.naver.com
 [114.111.35.158])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 839BE40B9E
 for <buildroot@buildroot.org>; Fri, 16 May 2025 15:08:40 +0000 (UTC)
X-Originating-IP: 125.132.232.68
Received: from cvsendbo038.nm ([10.112.24.45])
 by cvsmtppost15.nm.naver.com with ESMTP id MAhrELbfT2GGbAMQYzgkfw
 for <buildroot@buildroot.org>; Fri, 16 May 2025 15:08:39 -0000
X-Session-ID: 44O-VOlESdqaScx7PewJmg
X-Originating-IP: 125.132.232.68
X-Works-Send-Opt: x/YZjAJYjHmlKxu/FoJYKxgXKBwkx0eFjAJYKg==
X-Works-Smtp-Source: edbXKqbdFqJZ+Hm/Kxb9+6E=
Received: from Linux.. ([125.132.232.68])
 by cvnsmtp002.nm.naver.com with ESMTP id 44O-VOlESdqaScx7PewJmg
 for <multiple recipients>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 16 May 2025 15:08:38 -0000
From: Cherniaev Andrei <dungeonlords789@naver.com>
To: buildroot@buildroot.org
Cc: Cherniaev Andrei <dungeonlords789@naver.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 17 May 2025 00:08:28 +0900
Message-ID: <20250516150830.313732-1-dungeonlords789@naver.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=naver.com; s=s20171208; 
 t=1747408119; bh=tSXhn9+rdFamtZXJ1bOjoAEg4oXSXl336k4U57OQ4HA=;
 h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
 X-Works-Security;
 b=vtbjVwzlqHytWwwJLE0PNpl3tC+vly7cPgWXZgpyMDdgCZ5RhtYYrb2BVN6NGs4cZ
 wPsSynPM0sxURHuf491v81A0hlT6X+ug3f5Zsp9NDynT1rGy6+XCM3BYg9YBPi+3Hd
 iQcyCv2n0feLLUg3EwfWG0OzIKscRwbyr3+qvobC8ktKpUrc2s+7uss5tWrpb6WD6c
 7/cJ6ZjZc84dHD5cBVeGO5Twcn1a/jbCci2GMoJcobJLFEgCHnoozek2I5j2kk48l7
 VS60HICrGVGgfQZOtf6yZ5jUJxIG5QO8M23JFCITxJzaLCB7wt46skkyWRMsNzkONQ
 JMz8oLuDXEfAw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=naver.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=naver.com header.i=@naver.com header.a=rsa-sha256
 header.s=s20171208 header.b=vtbjVwzl
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

Fix regression of commit 552ba600eef0884bb7bf7f09a67cd66747d1efa8 Without `--show` loop_dev variable will be empty so the script never works...

Signed-off-by: Cherniaev Andrei <dungeonlords789@naver.com>
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
