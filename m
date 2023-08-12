Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92439C001E0
	for <buildroot@archiver.kernel.org>; Sat, 12 Aug 2023 19:55:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 39E4640597;
	Sat, 12 Aug 2023 19:55:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 39E4640597
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dmLb-rMh0uI0; Sat, 12 Aug 2023 19:55:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7C7C540533;
	Sat, 12 Aug 2023 19:55:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7C7C540533
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 491F91BF3CD
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 19:55:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8F8114018B
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 19:55:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F8114018B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 70lyviCBV1xc for <buildroot@lists.busybox.net>;
 Sat, 12 Aug 2023 19:55:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CB8ED4051D
 for <buildroot@buildroot.org>; Sat, 12 Aug 2023 19:55:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB8ED4051D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B9214851A5; Sat, 12 Aug 2023 19:55:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 12 Aug 2023 21:54:57 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: af48ddb139edded01530a76dd3a6c4bd2ae84775
X-Git-Newrev: b9cad01b85f65b0f908c921962c590f17adef759
X-Patchwork-Hint: ignore
Message-Id: <20230812195515.B9214851A5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] configs/qemu_or1k_defconfig:
 enable ethernet
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
