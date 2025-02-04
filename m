Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02F45C282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:12:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BBFC64F101;
	Fri, 28 Feb 2025 17:12:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OW0shkuxfl6L; Fri, 28 Feb 2025 17:12:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8744D4F0C0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8744D4F0C0;
	Fri, 28 Feb 2025 17:12:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0CDCA68
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:43:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AFB4E42527
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gFSe370p1mgO for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C18242F77
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7C18242F77
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7475385FAE; Fri, 28 Feb 2025 16:30:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 4 Feb 2025 15:38:16 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d892350f644e67340091498bd2ab677f19608d85
X-Git-Newrev: 261d33eff8963319aa1c660e4e6bfb59d037175e
X-Patchwork-Hint: ignore
Message-Id: <20250228163030.7475385FAE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] board/mender: sync with
 board/pc
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
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=261d33eff8963319aa1c660e4e6bfb59d037175e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

and fix dd of=sdc because it is very dangerous to have exiting drive in example

Signed-off-by: Cherniaev Andrei <dungeonlords789@naver.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 board/mender/x86_64/readme.txt |  8 ++++----
 board/pc/readme.txt            | 10 ++++++----
 2 files changed, 10 insertions(+), 8 deletions(-)

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
index 99e8f442ea..18b1e3dcf0 100644
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
 
@@ -43,7 +43,9 @@ Emulation in qemu (BIOS)
 
   Since the driver will show up in the virtual machine as /dev/vda,
   change board/pc/grub-bios.cfg to use root=/dev/vda1 instead of
-  root=/dev/sda1. Then rebuild grub2 and the image.
+  root=/dev/sda1. Then rebuild grub2 and the image:
+
+    make grub2-rebuild && make
 
 2. Run the emulation with:
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
