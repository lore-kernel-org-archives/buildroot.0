Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F09DC5AE59
	for <buildroot@archiver.kernel.org>; Sat, 31 May 2025 16:55:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EEB9983F0C;
	Sat, 31 May 2025 16:55:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8PQMaKWxac-I; Sat, 31 May 2025 16:55:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 084E983EF6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 084E983EF6;
	Sat, 31 May 2025 16:55:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B3123235
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:55:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E58A9401E1
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:55:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V-mUOs0iVpaq for <buildroot@buildroot.org>;
 Sat, 31 May 2025 16:55:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1357B40205
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1357B40205
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:55:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 11DCB8770B; Sat, 31 May 2025 16:55:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 26 May 2025 17:48:59 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: a23909547ff8f82b4e355853ed19ee226a0581d6
X-Git-Newrev: 4970691c0e5ea16f3fb33df646cced72794272f7
X-Patchwork-Hint: ignore
Message-Id: <20250531165510.11DCB8770B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] boot/grub2/readme.txt:
 fix loopback mount notes
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

commit: https://git.buildroot.net/buildroot/commit/?id=4970691c0e5ea16f3fb33df646cced72794272f7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Commit 7dd56b6cd9 ("boot/grub2/readme.txt: don't specify /dev/loop0")
changed the description of the loopback mounting to use losetup -f <img>,
but forgot to add the --show option, causing losetup to not print the
loopback device name.

Fix that by adding the --show option.

Signed-off-by: Cherniaev Andrei <dungeonlords789@naver.com>
[Peter: Reword commit message]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit a480ae9ffe74007a92a5a5a7a36bc0d0451cebda)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
