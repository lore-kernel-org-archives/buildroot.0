Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84180C0015E
	for <buildroot@archiver.kernel.org>; Sat, 12 Aug 2023 15:11:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DBB5560AF1;
	Sat, 12 Aug 2023 15:11:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DBB5560AF1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3ln8xoi_mAJd; Sat, 12 Aug 2023 15:11:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E5FB606A0;
	Sat, 12 Aug 2023 15:11:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E5FB606A0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8FCF21BF25B
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 15:11:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 41DF4606A0
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 15:11:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41DF4606A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WIqSA65m1yM9 for <buildroot@lists.busybox.net>;
 Sat, 12 Aug 2023 15:11:22 +0000 (UTC)
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B6A4360655
 for <buildroot@buildroot.org>; Sat, 12 Aug 2023 15:11:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6A4360655
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 3E9C4352BD81; Sat, 12 Aug 2023 17:11:15 +0200 (CEST)
Date: Sat, 12 Aug 2023 17:11:15 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZNehEzTstrXcE4bf@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-21-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1691853076; bh=xHg6c3r9qsk+h//C7qulekHtIHAR3kfwysa1/dFvqIg=;
 h=Date:From:To:Subject:From;
 b=oRSaDOXglUWlKT21E48+gU/ZVCuQThTl7Db8W55gF2ceK62jVW9d3p2EISEWkI1p1
 7HvChtSKtEo6xu1nwExJuOGaoPXDhQLLNJh5tBAuepUhfLLiSOjnjqpQBpAMae9yhU
 KGxOJ1UdeXqO9dKvJGCcMrgykCxSqymkggYq3dY6VkVuNfwadpO03i0giplWuViOCL
 XXSO6DBFtiQIG0q7n9xl2j651Rjnv2T+7q6qhGtxNpAg2l5BgwDyQRN25GMNACDPyY
 yWN8yTzGuhHahTkVYqROPB8qc9mt+ffbGHPDZLLIegZg6baM07El47Y1yjF4eS8pNC
 /0O1MO7t6I4Ag==
Subject: [Buildroot] [PATCH] configs/qemu_or1k_defconfig: enable ethernet
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The issue seems to be fixed. I checked qemu and linux git repositories
but can not find any information when this is starting to work.

System gets successfully an IP, no further testing was done.
Tested with Qemu 8.0.3 and Linux 6.1.x.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
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
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
