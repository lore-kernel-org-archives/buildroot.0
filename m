Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76CD0EC8733
	for <buildroot@archiver.kernel.org>; Thu,  7 Sep 2023 15:07:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2FAB880F1E;
	Thu,  7 Sep 2023 15:07:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2FAB880F1E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jOJfqTXGdYWu; Thu,  7 Sep 2023 15:07:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 696BF80ED6;
	Thu,  7 Sep 2023 15:07:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 696BF80ED6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 357C91BF3BB
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:51:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1B3DA6124D
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:51:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B3DA6124D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HK4XI4-UMqGx for <buildroot@lists.busybox.net>;
 Thu,  7 Sep 2023 14:51:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 527EF6128D
 for <buildroot@buildroot.org>; Thu,  7 Sep 2023 14:51:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 527EF6128D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4B6D586A22; Thu,  7 Sep 2023 14:51:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 12 Aug 2023 21:54:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: af48ddb139edded01530a76dd3a6c4bd2ae84775
X-Git-Newrev: b9cad01b85f65b0f908c921962c590f17adef759
X-Patchwork-Hint: ignore
Message-Id: <20230907145129.4B6D586A22@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/qemu_or1k_defconfig: enable
 ethernet
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

commit: https://git.buildroot.net/buildroot/commit/?id=b9cad01b85f65b0f908c921962c590f17adef759
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The issue seems to be fixed. I checked qemu and linux git repositories
but can not find any information when this is starting to work.

System gets successfully an IP, no further testing was done.
Tested with Qemu 8.0.3 and Linux 6.1.x.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/qemu/or1k/readme.txt  | 2 --
 configs/qemu_or1k_defconfig | 3 +++
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/board/qemu/or1k/readme.txt b/board/qemu/or1k/readme.txt
index 2ea797440a..ed0359a0f5 100644
--- a/board/qemu/or1k/readme.txt
+++ b/board/qemu/or1k/readme.txt
@@ -3,5 +3,3 @@ Run the emulation with:
  qemu-system-or1k -kernel output/images/vmlinux -nographic # qemu_or1k_defconfig
 
 The login prompt will appear in the terminal that started Qemu.
-
-Ethernet support is not working, yet.
diff --git a/configs/qemu_or1k_defconfig b/configs/qemu_or1k_defconfig
index 166e5ea5ca..37b980a9bd 100644
--- a/configs/qemu_or1k_defconfig
+++ b/configs/qemu_or1k_defconfig
@@ -1,6 +1,9 @@
 # Architecture
 BR2_or1k=y
 
+# System
+BR2_SYSTEM_DHCP="eth0"
+
 # Filesystem
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
