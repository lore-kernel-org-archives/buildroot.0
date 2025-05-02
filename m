Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82865C3ABAC
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 11:12:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C3B983F57;
	Fri,  2 May 2025 11:12:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q_IKtWFMbeDd; Fri,  2 May 2025 11:12:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A51183FA6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A51183FA6;
	Fri,  2 May 2025 11:12:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DF4C229
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:11:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B74CD41D7D
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:11:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pF4EH1F4PSFK for <buildroot@buildroot.org>;
 Fri,  2 May 2025 11:11:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9440419B7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E9440419B7
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:11:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E72DE863AE; Fri,  2 May 2025 11:11:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 May 2025 12:11:20 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 5d15476ee3f9457697c7048b0a31ba19e8cf1786
X-Git-Newrev: e70f30f4b47029f62e96f16b7bea99ba7d84738c
X-Patchwork-Hint: ignore
Message-Id: <20250502111135.E72DE863AE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
 board/raspberrypi/readme.txt: add pi 400 and cm{, 3, 4, 4s} hints
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
Content-Type: multipart/mixed; boundary="===============9118512928026815152=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============9118512928026815152==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=e70f30f4b47029f62e96f16b7bea99ba7d84738c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

This adds hints for the Raspberry Pi 400, Compute Module 1, 3, 4, and
4s.

Signed-off-by: Gaël PORTAY <gael.portay+rtone@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 649daadbecfa832ab218cb5a9e2f71adfa755ce3)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
 

--===============9118512928026815152==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============9118512928026815152==--
