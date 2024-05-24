Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5834C25B74
	for <buildroot@archiver.kernel.org>; Fri, 24 May 2024 19:37:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 864EF41BCD;
	Fri, 24 May 2024 19:37:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dZsL3AqHY2Z3; Fri, 24 May 2024 19:37:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC13941BD4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CC13941BD4;
	Fri, 24 May 2024 19:37:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5EADF1CFD32
 for <buildroot@lists.busybox.net>; Fri, 24 May 2024 19:36:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 57B5E408FD
 for <buildroot@lists.busybox.net>; Fri, 24 May 2024 19:36:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3jYzL9rr4T07 for <buildroot@lists.busybox.net>;
 Fri, 24 May 2024 19:36:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=103.168.172.159;
 helo=fhigh8-smtp.messagingengine.com; envelope-from=jiaxun.yang@flygoat.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D7009408D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7009408D0
Received: from fhigh8-smtp.messagingengine.com
 (fhigh8-smtp.messagingengine.com [103.168.172.159])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D7009408D0
 for <buildroot@buildroot.org>; Fri, 24 May 2024 19:36:51 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailfhigh.nyi.internal (Postfix) with ESMTP id 0692A1140155;
 Fri, 24 May 2024 15:36:51 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 24 May 2024 15:36:51 -0400
X-ME-Sender: <xms:UuxQZmXuW1bOlERJXTKM6KGrXNkV6TGHoCHlANjH-hin_cDT8UMPyw>
 <xme:UuxQZilbZQCbLa8yoOHKOSCShIdIbDSF0ZXApr61sD_oFQhONDpdKQzYxDR_mrBKZ
 GGqnwlyLB99ZBPkVm4>
X-ME-Received: <xmr:UuxQZqb-Osrlv4PreXKOlvFxevrUkgwI4PWU0_p5uPLQEhPHfFFsLPA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdeikedgudefhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheplfhi
 rgiguhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqe
 enucggtffrrghtthgvrhhnpeekkefgvdfgheffvedtveekjeeutdeifefhveetffdtvdej
 ffeludejgedtieekleenucffohhmrghinhepuhgrphhiqdhgrhhouhhprdhorhhgnecuve
 hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhn
 rdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:UuxQZtX80hXg2ilJHuOyGAQsR3lvfoV3Al9ZBx00HMX68oV_38HOxw>
 <xmx:UuxQZgnJnOAnABaGStDtAQ0cM44_RCeEqkztnMGcxtYADRqOP4jSVg>
 <xmx:UuxQZidLkiJq0aPe06H4nopprA3RtnyTy2hT_y-qGGwp9Fvwx1XBAA>
 <xmx:UuxQZiGbYLTsld9VphdJ-vqmBEn1xQBOjmthBTUp069_0YGIp4i7EQ>
 <xmx:UuxQZvvl_nqXqiv7xGwbsC7NjFreYONwY4eQLfP72Ym7alPuvgyJ05Qg>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 24 May 2024 15:36:49 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Fri, 24 May 2024 20:36:41 +0100
MIME-Version: 1.0
Message-Id: <20240524-loongarch64-v1-7-d24078d79cd5@flygoat.com>
References: <20240524-loongarch64-v1-0-d24078d79cd5@flygoat.com>
In-Reply-To: <20240524-loongarch64-v1-0-d24078d79cd5@flygoat.com>
To: buildroot@buildroot.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5370;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=/dQaOmzuAR00TdVHdZp7p22ohNK+eGOnoLyqF2CSOqA=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrSAN95iXrN/NSk/sl6dUpN8z3HrUjb25Neinr9FxCJTf
 z5aJ1LSUcrCIMbFICumyBIioNS3ofHigusPsv7AzGFlAhnCwMUpABPZqMTwP+/8gS7D5GUPti52
 lq1bmHBOUe4pswmPYPnWGZyqArt0PRn+ii+arHZw94IFnxfuPn5Xflu98/ufhllTzuYa53K01sQ
 9YAAA
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=flygoat.com; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm2; t=1716579411;
 x=1716665811; bh=qxOWvl6D3q5iAYgIruYA5TZ9VQnc8D/RI3tN/kTSE+E=; b=
 gd2R9AzuqFXmoB1uDJKkgLITKoZ3EE9BK4GKoRpbUMj1QmnT/7+Tlu/2Oa0A5Vso
 M5lZ9wqkJG5xxvbwG0z2m85hRbanjx5HwOrzUIWGUOqAuFlrpSWSXrmYLdr3UTTC
 XzC0f5Edf54CV95O8XL9ym9TnzrAoR6AVbdf2Xn5zKSW8X+Xvu6T5XT4AmOVMrO9
 KcTxIHSrUGKAKkhez9wyFj9shllJ+ELd0GsOP9v48Huh5uYCVGQXsC8CM0MiSnx3
 W2nD0GnEVidRYarC8jiKhj0ZUHW8uwzd75sc4qsgGX4CQbj3WdwM3cQzN6UYSyMf
 JJKJvzcy3Fi5Gl3hqEW5OA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1716579411; x=
 1716665811; bh=qxOWvl6D3q5iAYgIruYA5TZ9VQnc8D/RI3tN/kTSE+E=; b=Q
 VLOCQf/OxnCoHYQ4stl9AZYWVc1kQABbVVw9kqzTmVI5xaPC2ne0pGNBRQVEue0n
 ZMn+Gc/xNryjEp3u7zCulNEOOtPcyYqken12qOjviecu/8myZm+wVRNkE8LPjkpg
 eW9JrC1rISx4TZGNWDjbhnAXp/7BNVMFwCA22sRqUa1We96UWF6v4lpUxbk6SA2u
 kubr5aiFPXbV9kn9Sv9UP3p8K9gV6O2GffmUe1xd+9QNDQBhxMYbyKc6LtpDWa97
 mVS3/vyDzUzOX+mUQJ3oBIU/8STSWF//wNzyUNcSiYxal06mZuWGUwaiEKJsd+Qi
 qgTpHSCgTve44zzOcsR8A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=flygoat.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=flygoat.com
 header.i=@flygoat.com header.a=rsa-sha256 header.s=fm2 header.b=gd2R9Azu; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=QVLOCQf/
Subject: [Buildroot] [PATCH RESEND 7/7] board/loongarch64-efi: Introduce the
 new board
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Introduce bread new loongarch64-efi board, with skeleton
from aarch64-efi board.

It corverd most LoongArch64 systems.

Linux 6.6, as the most recent LTS kernel, was chosen
to ensure proper architecture support is included.

A developer entry is created for myself for future contacts
as well.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 DEVELOPERS                             |  5 +++++
 board/loongarch64-efi/genimage-efi.cfg | 33 +++++++++++++++++++++++++++++++
 board/loongarch64-efi/grub.cfg         |  6 ++++++
 board/loongarch64-efi/post-image.sh    |  5 +++++
 board/loongarch64-efi/readme.txt       | 34 ++++++++++++++++++++++++++++++++
 configs/loongarch64_efi_defconfig      | 36 ++++++++++++++++++++++++++++++++++
 6 files changed, 119 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 52c9b84a9d41..333f952cf392 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1568,6 +1568,11 @@ F:	package/libuhttpd/
 F:	package/libuwsc/
 F:	package/rtty/
 
+N:	Jiaxun Yang <jiaxun.yang@flygoat.com>
+F:	arch/Config.in.loongarch
+F:	board/loongarch64-efi
+F:	configs/loongarch64_efi_defconfig
+
 N:	Joachim Wiberg <troglobit@gmail.com>
 F:	configs/globalscale_espressobin_defconfig
 F:	board/globalscale/espressobin/
diff --git a/board/loongarch64-efi/genimage-efi.cfg b/board/loongarch64-efi/genimage-efi.cfg
new file mode 100644
index 000000000000..c78f81016d01
--- /dev/null
+++ b/board/loongarch64-efi/genimage-efi.cfg
@@ -0,0 +1,33 @@
+image efi-part.vfat {
+	vfat {
+		file EFI {
+			image = "efi-part/EFI"
+		}
+		file vmlinuz.efi {
+			image = "vmlinuz.efi"
+		}
+	}
+
+	size = 64M
+}
+
+image disk.img {
+	hdimage {
+		partition-table-type = "gpt"
+	}
+
+	partition boot {
+		image = "efi-part.vfat"
+		partition-type-uuid = U
+		offset = 32K
+		bootable = true
+	}
+
+	partition root {
+		# For partition-type-uuid value, see:
+		# https://uapi-group.org/specifications/specs/discoverable_partitions_specification/
+		# SD_GPT_ROOT_LOONGARCH64
+		partition-type-uuid = 77055800-792c-4f94-b39a-98c91b762bb6
+		image = "rootfs.ext2"
+	}
+}
diff --git a/board/loongarch64-efi/grub.cfg b/board/loongarch64-efi/grub.cfg
new file mode 100644
index 000000000000..42c6cb03ad19
--- /dev/null
+++ b/board/loongarch64-efi/grub.cfg
@@ -0,0 +1,6 @@
+set default="0"
+set timeout="5"
+
+menuentry "Buildroot" {
+	linux /vmlinuz.efi root=PARTLABEL=root rootwait console=ttyS0,115200
+}
diff --git a/board/loongarch64-efi/post-image.sh b/board/loongarch64-efi/post-image.sh
new file mode 100755
index 000000000000..f0214dc8667a
--- /dev/null
+++ b/board/loongarch64-efi/post-image.sh
@@ -0,0 +1,5 @@
+#!/bin/sh
+
+BOARD_DIR="$(dirname $0)"
+
+cp -f ${BOARD_DIR}/grub.cfg ${BINARIES_DIR}/efi-part/EFI/BOOT/grub.cfg
diff --git a/board/loongarch64-efi/readme.txt b/board/loongarch64-efi/readme.txt
new file mode 100644
index 000000000000..4c4e06874c1f
--- /dev/null
+++ b/board/loongarch64-efi/readme.txt
@@ -0,0 +1,34 @@
+The loongarch64_efi_defconfig allows to build a minimal Linux system that
+can boot on all loongarch64 systems providing an EFI firmware.
+
+This includes almost all Loongson-3 series workstations and servers.
+
+Building and booting
+====================
+
+$ make loongarch64_efi_defconfig
+$ make
+
+The file output/images/disk.img is a complete disk image that can be
+booted, it includes the grub2 bootloader, Linux kernel and root
+filesystem.
+
+Testing under Qemu
+==================
+
+This image can also be tested using Qemu:
+
+qemu-system-loongarch64 \
+	-M virt \
+	-cpu la464 \
+	-nographic \
+	-bios </path/to/QEMU_EFI.fd> \
+	-drive file=output/images/disk.img,if=none,format=raw,id=hd0 \
+	-device virtio-blk-pci,drive=hd0 \
+	-netdev user,id=eth0 \
+	-device virtio-net-pci,netdev=eth0
+
+Note that </path/to/QEMU_EFI.fd> needs to point to a valid loongarch64 UEFI
+firmware image for qemu.
+It may be provided by your distribution as a edk2-loongarch64 package,
+in path such as /usr/share/edk2/loongarch64/QEMU_EFI.fd .
diff --git a/configs/loongarch64_efi_defconfig b/configs/loongarch64_efi_defconfig
new file mode 100644
index 000000000000..874ee58be8b8
--- /dev/null
+++ b/configs/loongarch64_efi_defconfig
@@ -0,0 +1,36 @@
+# Architecture
+BR2_loongarch64=y
+BR2_loongarch64_generic=y
+
+# System
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
+
+## Required tools to create bootable media
+BR2_PACKAGE_HOST_GENIMAGE=y
+
+# Bootloader
+BR2_TARGET_GRUB2=y
+BR2_TARGET_GRUB2_LOONGARCH64_EFI=y
+
+# Filesystem / image
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="200M"
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/loongarch64-efi/post-image.sh support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/loongarch64-efi/genimage-efi.cfg"
+
+# Linux headers same as kernel, a 6.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.30"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_LINUX_KERNEL_VMLINUZ_EFI=y
+
+# Host tools for genimage
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_MTOOLS=y

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
