Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBD98D42BA2
	for <buildroot@archiver.kernel.org>; Tue, 12 Nov 2024 15:54:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E66E40549;
	Tue, 12 Nov 2024 15:54:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uotEEyMh_kKj; Tue, 12 Nov 2024 15:54:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9472340548
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9472340548;
	Tue, 12 Nov 2024 15:54:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6A659D8F
 for <buildroot@buildroot.org>; Tue, 12 Nov 2024 15:54:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4B5CA60810
 for <buildroot@buildroot.org>; Tue, 12 Nov 2024 15:54:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l8C1yckWgXea for <buildroot@buildroot.org>;
 Tue, 12 Nov 2024 15:54:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=114.111.35.164;
 helo=cvsmtppost27.nm.naver.com; envelope-from=dungeonlords789@naver.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BB20260816
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB20260816
Received: from cvsmtppost27.nm.naver.com (cvsmtppost27.nm.naver.com
 [114.111.35.164])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BB20260816
 for <buildroot@buildroot.org>; Tue, 12 Nov 2024 15:54:08 +0000 (UTC)
X-Originating-IP: 125.132.232.68
Received: from cvsendbo027.nm ([10.112.22.36])
 by cvsmtppost27.nm.naver.com with ESMTP id lMagRVI9Q1m0GSXarMYfuQ
 for <buildroot@buildroot.org>; Tue, 12 Nov 2024 15:54:06 -0000
X-Session-ID: Ma0DDWVxTGefwSzVuwZAKQ
X-Originating-IP: 125.132.232.68
X-Works-Send-Opt: xeYZjAJYjHmlKxu/FoJYKxgXKBwkx0eFjAu=
X-Works-Smtp-Source: /qblKquqFqJZ+Hm9FAtd+6E=
Received: from Linux.. ([125.132.232.68])
 by cvnsmtp006.nm.naver.com with ESMTP id Ma0DDWVxTGefwSzVuwZAKQ
 for <multiple recipients>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 12 Nov 2024 15:54:05 -0000
From: Cherniaev Andrei <dungeonlords789@naver.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Cherniaev Andrei <dungeonlords789@naver.com>
Date: Wed, 13 Nov 2024 00:53:59 +0900
Message-ID: <20241112155359.2416899-1-dungeonlords789@naver.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=naver.com; s=s20171208; 
 t=1731426846; bh=CC9L3X7nSN40OsBSV4QOpG+oo0gOQrH+7c/p3nIou5o=;
 h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
 X-Works-Security;
 b=vLTMR8eHK0oI1th5QIyPK8823PutKhgJD9giX1GzWaDTc9RqpWcfhuTCdSXYZNDW0
 xtTvlmaxS4ep3k9sny1S2ZDbf9SC5jFUJucxLdbIP4o4g0XzSNQdTrwRsraU9i4EDd
 fbclpxL0AvOFfnWL5My6cR6/j+EiS0qOdzobEogEIeMiff9jxSX+tEC9I9609xwpJV
 m0d+XayP6DdTNqD6eWobGWM+KhoOfn/vv/h1I/V7EDohiUnBFki3mJm7ZCrk3zHpQh
 udDQjJZ+D8oPzUYQPdF1Phu24GdHutfM0wjmceONtN4ZYFk0dyFmwcwPZiOvaKxz4d
 854XIOe8gwjag==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=naver.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=naver.com header.i=@naver.com header.a=rsa-sha256
 header.s=s20171208 header.b=vLTMR8eH
Subject: [Buildroot] [PATCH 1/1] boot/grub2: fix help
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

losetup -f return next free loop device and usually it is not /dev/loop0 so if you use this help you can delete all important data from your existing device.

Signed-off-by: Cherniaev Andrei <dungeonlords789@naver.com>
---
 boot/grub2/readme.txt | 32 +++++++++++++++++---------------
 1 file changed, 17 insertions(+), 15 deletions(-)

diff --git a/boot/grub2/readme.txt b/boot/grub2/readme.txt
index 5d59fb4e22..2684805c97 100644
--- a/boot/grub2/readme.txt
+++ b/boot/grub2/readme.txt
@@ -10,20 +10,21 @@ Notes on using Grub2 for BIOS-based platforms
       is enough free space *before* the first partition to
       store Grub2. Leaving 1 MB of free space is safe.
 3. Setup loop device and loop partitions
-   sudo losetup -f disk.img
-   sudo partx -a /dev/loop0
+   loop_dev=$(sudo losetup -f)
+   sudo losetup "$loop_dev" disk.img
+   sudo partx -a "$loop_dev"
 4. Prepare the root partition
-   sudo mkfs.ext3 -L root /dev/loop0p1
-   sudo mount /dev/loop0p1 /mnt
+   sudo mkfs.ext3 -L root "${loop_dev}p1"
+   sudo mount "${loop_dev}p1" /mnt
    sudo tar -C /mnt -xf output/images/rootfs.tar
    sudo umount /mnt
 5. Install Grub2
    sudo ./output/host/sbin/grub-bios-setup \
         -b ./output/host/lib/grub/i386-pc/boot.img \
-        -c ./output/images/grub.img -d . /dev/loop0
+        -c ./output/images/grub.img -d . "$loop_dev"
 6. Cleanup loop device
-   sudo partx -d /dev/loop0
-   sudo losetup -d /dev/loop0
+   sudo partx -d "$loop_dev"
+   sudo losetup -d "$loop_dev"
 7. Your disk.img is ready!
 
 Using genimage
@@ -65,22 +66,23 @@ Notes on using Grub2 for x86/x86_64 EFI-based platforms
     - Create a second partition, type 8300, for the root
       filesystem.
 3. Setup loop device and loop partitions
-   sudo losetup -f disk.img
-   sudo partx -a /dev/loop0
+   loop_dev=$(sudo losetup -f)
+   sudo losetup "$loop_dev" disk.img
+   sudo partx -a "$loop_dev"
 4. Prepare the boot partition
-   sudo mkfs.vfat -n boot /dev/loop0p1
-   sudo mount /dev/loop0p1 /mnt
+   sudo mkfs.vfat -n boot "${loop_dev}p1"
+   sudo mount "${loop_dev}p1" /mnt
    sudo cp -a output/images/efi-part/* /mnt/
    sudo cp output/images/bzImage /mnt/
    sudo umount /mnt
 5. Prepare the root partition
-   sudo mkfs.ext3 -L root /dev/loop0p2
-   sudo mount /dev/loop0p2 /mnt
+   sudo mkfs.ext3 -L root "${loop_dev}p2"
+   sudo mount "${loop_dev}p2" /mnt
    sudo tar -C /mnt -xf output/images/rootfs.tar
    sudo umount /mnt
 6  Cleanup loop device
-   sudo partx -d /dev/loop0
-   sudo losetup -d /dev/loop0
+   sudo partx -d "$loop_dev"
+   sudo losetup -d "$loop_dev"
 7. Your disk.img is ready!
 
 To test your i386/x86-64 EFI image in Qemu
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
