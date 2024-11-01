Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6420E6B24F
	for <buildroot@archiver.kernel.org>; Fri,  1 Nov 2024 12:08:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 430D984454;
	Fri,  1 Nov 2024 12:08:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S5J7YL-geU_0; Fri,  1 Nov 2024 12:08:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 454F684367
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 454F684367;
	Fri,  1 Nov 2024 12:08:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id DB5E9725
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 12:08:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B77B784443
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 12:08:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l6Y1yTzrZGGE for <buildroot@buildroot.org>;
 Fri,  1 Nov 2024 12:08:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=114.111.35.29;
 helo=cvsmtppost09.nm.naver.com; envelope-from=dungeonlords789@naver.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2FBB384381
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2FBB384381
Received: from cvsmtppost09.nm.naver.com (cvsmtppost09.nm.naver.com
 [114.111.35.29])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2FBB384381
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 12:08:02 +0000 (UTC)
X-Originating-IP: 125.132.232.68
Received: from cvsendbo031.nm ([10.112.22.37])
 by cvsmtppost09.nm.naver.com with ESMTP id LaACbXVuSFy+MCO7CIp5kg
 for <buildroot@buildroot.org>; Fri, 01 Nov 2024 12:08:00 -0000
X-Session-ID: UwTPDjQ8Q5uvvfaAq6bqQw
X-Originating-IP: 125.132.232.68
X-Works-Send-Opt: xeYZjAJYjHmlKxu/FoJYKxgXKBwkx0eFjAu=
X-Works-Smtp-Source: ZZKqFAgqFqJZ+HmmaAtm+6E=
Received: from Linux.. ([125.132.232.68])
 by cvnsmtp006.nm.naver.com with ESMTP id UwTPDjQ8Q5uvvfaAq6bqQw
 for <multiple recipients>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 01 Nov 2024 12:08:00 -0000
From: Cherniaev Andrei <dungeonlords789@naver.com>
To: buildroot@buildroot.org
Date: Fri,  1 Nov 2024 21:07:33 +0900
Message-ID: <20241101120733.4136790-1-dungeonlords789@naver.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=naver.com; s=s20171208; 
 t=1730462880; bh=KrbDfwe2hXN7lq8LK5X5ol23YKwstZLYYWqtQ4umAws=;
 h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
 X-Works-Security;
 b=aDQ/9szlTZtNI+F0vw3/F0izuXl9hdJ6b0HMA2QWINZ1ZDOBJMZqkd+CmenD15oeh
 vxlbzrPQDeTY8T9YhuaPGqLcmJ1I0C3onV7xmGATIa+e1Pftr2/f9U5k94bDyw5E/C
 PFxMsXTb1DGA086aRXR7Z4jui2qrtVd94pPUigUu5612s4Hsjey7OBnsolpcKJzNQk
 c8evkBKJlI/un60DOdBaH9iWO7uEpwseihhlG0Za8vJ6ZBJAp+CDyBMNju2iDWfM4H
 wtjTgWAHF7Zpfi2BjJ9rxCfrJV+9mbQLmVAblOSgTvF3+GsMmQZtk+SakecrPP1nnV
 t/RGagJ+Ta3jg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=naver.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=naver.com header.i=@naver.com header.a=rsa-sha256
 header.s=s20171208 header.b=aDQ/9szl
Subject: [Buildroot] [PATCH 1/1] board/mender: sync with board/pc
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
Cc: Cherniaev Andrei <dungeonlords789@naver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

and fix dd of=sdc because it is very dangerous to have exiting drive in example

Signed-off-by: Cherniaev Andrei <dungeonlords789@naver.com>
---
 board/mender/x86_64/readme.txt |  8 ++++----
 board/pc/readme.txt            | 13 ++++++++-----
 2 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/board/mender/x86_64/readme.txt b/board/mender/x86_64/readme.txt
index a9755ec58b..01a0254511 100644
--- a/board/mender/x86_64/readme.txt
+++ b/board/mender/x86_64/readme.txt
@@ -11,14 +11,14 @@ Mender UEFI PC sample config
 
   $ make
 
-2. Write the Pendrive
+2. Write the image
 
-  The build process will create a Pendrive image called disk.img in
+  The build process will create a all-in-one image called disk.img in
   output/images.
 
   Write the image to a pendrive:
 
-  $ dd if=output/images/disk.img of=/dev/${pendrive}; sync
+  $ dd if=output/images/disk.img of=/dev/sdX; sync
 
   Once the process is complete, insert it into the target PC and boot.
 
@@ -66,4 +66,4 @@ particular needs, as this option changes the mender artifact name.
 Using mender
 ========================
 Please read the mender documentation at:
-https://docs.mender.io/2.2/getting-started
+https://docs.mender.io
diff --git a/board/pc/readme.txt b/board/pc/readme.txt
index 41aec50d36..e2ba6769f0 100644
--- a/board/pc/readme.txt
+++ b/board/pc/readme.txt
@@ -17,14 +17,14 @@ Bare PC sample config
 
   $ make
 
-2. Write the pendrive
+2. Write the image
 
-  The build process will create a pendrive image called sdcard.img in
+  The build process will create a all-in-one image called disk.img in
   output/images.
 
   Write the image to a pendrive:
 
-  $ dd if=output/images/disk.img of=/dev/sdc; sync
+  $ dd if=output/images/disk.img of=/dev/sdX; sync
 
   Once it's done insert it into the target PC and boot.
 
@@ -42,8 +42,11 @@ Emulation in qemu (BIOS)
 1. Edit grub-bios.cfg
 
   Since the driver will show up in the virtual machine as /dev/vda,
-  change board/pc/grub-bios.cfg to use root=/dev/vda2 instead of
-  root=/dev/sda2. Then rebuild grub2 and the image.
+  change board/pc/grub-bios.cfg to use root=/dev/vda1 instead of
+  root=/dev/sda1.
+1.1. Rebuild grub2 and the image:
+
+make grub2-rebuild && make
 
 2. Run the emulation with:
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
