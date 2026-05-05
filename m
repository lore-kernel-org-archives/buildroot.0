Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AB6CCD3441
	for <buildroot@archiver.kernel.org>; Tue,  5 May 2026 21:20:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F5D760B5F;
	Tue,  5 May 2026 21:20:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TucswdmUdKCV; Tue,  5 May 2026 21:20:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6189460B68
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778016036;
	bh=TsKy6B7+qtNZKefNbyIJ+99tpZx1s5SKU6EFW40pWbY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=s33qvKufaypZLnccdaTfeSSuHf7KDmt2dJPQgdVFa+xzDEMbHPtop++ORiXg5/XzN
	 CTt6ndlaiumRS3JI7aDEqbn9AItYhDF/emIzoC2S2jnojl6Ht2xcJb0k/+xZCvVlT5
	 EqNh/ZmHyepqmMhfCzEEZXqGGOiLX5cNEy3pryOcVsxKKAf3KLB8jTxvEY0xhHOcaW
	 M3g4xsyYq+XN8qlQ0lz2CDNSJhXaH56wZdZh+hy0UBP49Kin/4wWlfm1SiU5ot16HE
	 W7XgFJ3IWK2Du1oPDXV7B7ubigYwBAVCNHzUNYG5x4Br4uD1dm+z4PMBPilt4sOPd9
	 vNiMWdr40rHug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6189460B68;
	Tue,  5 May 2026 21:20:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5043D315
 for <buildroot@buildroot.org>; Tue,  5 May 2026 21:20:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 23EC940B58
 for <buildroot@buildroot.org>; Tue,  5 May 2026 21:20:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hYcpqu2DRcdd for <buildroot@buildroot.org>;
 Tue,  5 May 2026 21:20:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 25B0E40B9E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 25B0E40B9E
 for <buildroot@buildroot.org>; Tue,  5 May 2026 21:20:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3E1608469A; Tue,  5 May 2026 21:20:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 5 May 2026 23:18:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2367805ec2bfaaf702c63b7a29380d5aeb80984b
X-Git-Newrev: 64944bcf6441c325ef5b6cc5f6975fa62008b624
X-Patchwork-Hint: ignore
Message-Id: <20260505212026.3E1608469A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: test_iso9660: Bump kernel
 version to last LTS (6.18)
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/64944bcf6441c325ef5b6cc5f6975fa62008b624
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Update the kernel configuration to support modern storage stacks
required for ISO booting on x86_64.

The transition from 4.19 to 6.18 requires explicit activation of:
- CONFIG_PCI: To discover the emulated IDE/SATA controllers.
- CONFIG_ATA & CONFIG_ATA_PIIX: Modern libATA drivers for QEMU's
  chipset (replacing the legacy IDE subsystem).
- CONFIG_SCSI & CONFIG_BLK_DEV_SR: Necessary to handle the CD-ROM
  as a SCSI device (/dev/sr0), which is mandatory for ISO9660.

Without these options, the kernel cannot locate or mount the
rootfs from the ISO image.

Signed-off-by: Dowan Gullient <dowan.gullient@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/testing/conf/minimal-x86-qemu-kernel.config | 4 ++++
 support/testing/tests/fs/test_iso9660.py            | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/support/testing/conf/minimal-x86-qemu-kernel.config b/support/testing/conf/minimal-x86-qemu-kernel.config
index 45994f804d..ca36d95b11 100644
--- a/support/testing/conf/minimal-x86-qemu-kernel.config
+++ b/support/testing/conf/minimal-x86-qemu-kernel.config
@@ -12,9 +12,13 @@ CONFIG_INET=y
 CONFIG_VIRTIO_BLK=y
 CONFIG_BLK_DEV_SD=y
 CONFIG_BLK_DEV_SR=y
+CONFIG_BLK_DEV_SR_VENDOR=y
+CONFIG_SCSI=y
 CONFIG_SCSI_VIRTIO=y
 CONFIG_ATA=y
 CONFIG_ATA_PIIX=y
+CONFIG_PATA_AMD=y
+CONFIG_PCI=y
 CONFIG_NETDEVICES=y
 CONFIG_VIRTIO_NET=y
 CONFIG_NE2K_PCI=y
diff --git a/support/testing/tests/fs/test_iso9660.py b/support/testing/tests/fs/test_iso9660.py
index 947aca5f54..b2edcac460 100644
--- a/support/testing/tests/fs/test_iso9660.py
+++ b/support/testing/tests/fs/test_iso9660.py
@@ -11,7 +11,7 @@ BASIC_CONFIG = \
     BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
     BR2_LINUX_KERNEL=y
     BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-    BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.204"
+    BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.21"
     BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
     BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="{}"
     # BR2_TARGET_ROOTFS_TAR is not set
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
