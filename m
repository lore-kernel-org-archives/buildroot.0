Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0933C3ABC9
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 20:00:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 993A640C7E;
	Fri, 16 May 2025 20:00:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id roQXKkOkM4yM; Fri, 16 May 2025 20:00:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B217D40E00
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B217D40E00;
	Fri, 16 May 2025 20:00:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4B8701137
 for <buildroot@buildroot.org>; Fri, 16 May 2025 20:00:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 30DC640C7E
 for <buildroot@buildroot.org>; Fri, 16 May 2025 20:00:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9fjnQbEkSNYW for <buildroot@buildroot.org>;
 Fri, 16 May 2025 20:00:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8BDCF40E3A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8BDCF40E3A
 for <buildroot@buildroot.org>; Fri, 16 May 2025 20:00:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7B37B86D78; Fri, 16 May 2025 20:00:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 16 May 2025 21:55:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c5c7c44fa5fd7653a9746748ef573e74e49239f6
X-Git-Newrev: a480ae9ffe74007a92a5a5a7a36bc0d0451cebda
X-Patchwork-Hint: ignore
Message-Id: <20250516200052.7B37B86D78@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/grub2/readme.txt: fix loopback mount
 notes
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a480ae9ffe74007a92a5a5a7a36bc0d0451cebda
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 7dd56b6cd9 ("boot/grub2/readme.txt: don't specify /dev/loop0")
changed the description of the loopback mounting to use losetup -f <img>,
but forgot to add the --show option, causing losetup to not print the
loopback device name.

Fix that by adding the --show option.

Signed-off-by: Cherniaev Andrei <dungeonlords789@naver.com>
[Peter: Reword commit message]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
