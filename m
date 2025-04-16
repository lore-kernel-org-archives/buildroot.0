Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E75FDC369BA
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 19:20:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B38538113B;
	Wed, 16 Apr 2025 19:20:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IG_Q9OK9Xio9; Wed, 16 Apr 2025 19:20:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C33488137A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C33488137A;
	Wed, 16 Apr 2025 19:20:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5DF47920
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 19:20:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 126A041380
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 19:20:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WZcrpaF5x8Y7 for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 19:20:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D3D14129B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5D3D14129B
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 19:20:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 598D184F64; Wed, 16 Apr 2025 19:20:09 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 16 Apr 2025 21:14:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dc00f366b8c1e1d54c00cf1aa9f7adae4e2fdd1b
X-Git-Newrev: 649daadbecfa832ab218cb5a9e2f71adfa755ce3
X-Patchwork-Hint: ignore
Message-Id: <20250416192009.598D184F64@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/raspberrypi/readme.txt: add pi 400
 and cm{, 3, 4, 4s} hints
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5226671318687358965=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5226671318687358965==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=649daadbecfa832ab218cb5a9e2f71adfa755ce3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This adds hints for the Raspberry Pi 400, Compute Module 1, 3, 4, and
4s.

Signed-off-by: Gaël PORTAY <gael.portay+rtone@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/raspberrypi/readme.txt | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/board/raspberrypi/readme.txt b/board/raspberrypi/readme.txt
index 4a0903578b..4703d0adb1 100644
--- a/board/raspberrypi/readme.txt
+++ b/board/raspberrypi/readme.txt
@@ -6,13 +6,18 @@ Intro
 These instructions apply to all models of the Raspberry Pi:
   - the original models A and B,
   - the "enhanced" models A+ and B+,
+  - the model CM (aka Raspberry Pi Compute Module).
   - the model Zero (aka Raspberry Pi Zero)
   - the model Zero W (aka Raspberry Pi Zero W)
   - the model Zero 2 W (aka Raspberry Pi Zero 2 W)
   - the model B2 (aka Raspberry Pi 2)
   - the model B3 (aka Raspberry Pi 3).
+  - the model CM3 (aka Raspberry Pi Compute Module 3).
+  - the model CM3+ (aka Raspberry Pi Compute Module 3+).
   - the model B4 (aka Raspberry Pi 4).
+  - the model 400 (aka Raspberry Pi 400).
   - the model CM4 (aka Raspberry Pi Compute Module 4 and IO Board).
+  - the model CM4s (aka Raspberry Pi Compute Module 4s).
   - the model B5 (aka Raspberry Pi 5).
 
 How to build it
@@ -24,7 +29,7 @@ Configure Buildroot
 There are several Raspberry Pi defconfig files in Buildroot, one for
 each major variant, which you should base your work on:
 
-For models A, B, A+ or B+:
+For models A, B, A+, B+ and CM:
 
   $ make raspberrypi_defconfig
 
@@ -40,7 +45,7 @@ For model Zero 2 W (model B3 in smaller form factor):
 
   $ make raspberrypizero2w_defconfig
 
-For model Zero 2 W (model B3 in smaller form factor, 64-bit):
+or for model Zero 2 W (model B3 in smaller form factor, 64-bit):
 
   $ make raspberrypizero2w_64_defconfig
 
@@ -48,19 +53,19 @@ For model 2 B:
 
   $ make raspberrypi2_defconfig
 
-For model 3 B and B+:
+For model 3 B, B+, CM3 and CM3+:
 
   $ make raspberrypi3_defconfig
 
-or for model 3 B and B+ (64 bit):
+or for model 3 B, B+, CM3 and CM3+ (64 bit):
 
   $ make raspberrypi3_64_defconfig
 
-For model 4 B:
+For model 4 B, 400, CM4 and CM4s:
 
   $ make raspberrypi4_defconfig
 
-or for model 4 B (64 bit):
+or for model 4 B, 400, CM4 and CM4s (64 bit):
 
   $ make raspberrypi4_64_defconfig
 

--===============5226671318687358965==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5226671318687358965==--
