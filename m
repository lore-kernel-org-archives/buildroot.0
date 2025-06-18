Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14A3BC71157
	for <buildroot@archiver.kernel.org>; Wed, 18 Jun 2025 18:26:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D76428114B;
	Wed, 18 Jun 2025 18:26:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QYIAvtR5KYOU; Wed, 18 Jun 2025 18:26:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB1C78113D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB1C78113D;
	Wed, 18 Jun 2025 18:26:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 38AB8E2
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 18:26:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2A9BA404A0
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 18:26:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aQSdmeA-hdgb for <buildroot@buildroot.org>;
 Wed, 18 Jun 2025 18:26:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=103.168.172.147;
 helo=fout-a4-smtp.messagingengine.com; envelope-from=jiaxun.yang@flygoat.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EB10240499
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB10240499
Received: from fout-a4-smtp.messagingengine.com
 (fout-a4-smtp.messagingengine.com [103.168.172.147])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EB10240499
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 18:26:11 +0000 (UTC)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal
 [10.202.2.51])
 by mailfout.phl.internal (Postfix) with ESMTP id 6DEE3138046E;
 Wed, 18 Jun 2025 14:20:53 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-11.internal (MEProxy); Wed, 18 Jun 2025 14:20:53 -0400
X-ME-Sender: <xms:hQNTaBD7AHEYZv_JZAruv6CVc20f81fRGBz553-_j-uzH2ouIesGBw>
 <xme:hQNTaPhhsZmuLE5EINu-Ya4H4e4MmX-icAmk_qelrX31dSFpeCmJTxOFWA7yIsO-W
 0Ny_n8V1qGxtkGbqLE>
X-ME-Received: <xmr:hQNTaMneiya-qViwVHfXH4Hjm55NrJcmOYQW5x3nSxcSY5aLfwkOaysPN_q90WWGq_prQjjSDcMHDaWq23KE_fGJAgYkYfv3PVYDc6vRgowc9KO9x2bOktr4icVp83-1djojVjvORmkxEok>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdeffeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
 rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
 htshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdej
 necuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhi
 hgohgrthdrtghomheqnecuggftrfgrthhtvghrnhephfejiedvleekheefhefftedvkefh
 jeeiledthefgvdehffejheektedujeduheeinecuffhomhgrihhnpehkvghrnhgvlhdroh
 hrghdprghrvgifvghlohhonhhghigvthdrtghomhdpghhithhhuhgsrdgtohhmnecuvehl
 uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrd
 ihrghnghesfhhlhihgohgrthdrtghomhdpnhgspghrtghpthhtohepjedpmhhouggvpehs
 mhhtphhouhhtpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhoth
 hlihhnrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdr
 ohhrghdprhgtphhtthhopehrohhmrghinhdrnhgrohhurhesghhmrghilhdrtghomhdprh
 gtphhtthhopehgihhulhhiohdrsggvnhgvthhtihessggvnhgvthhtihgvnhhgihhnvggv
 rhhinhhgrdgtohhmpdhrtghpthhtohepjhhirgiguhhnrdihrghnghesfhhlhihgohgrth
 drtghomhdprhgtphhtthhopehhihesshgvnhiiihhllhgrrdhiohdprhgtphhtthhopehr
 ohhmrghinhdrnhgrohhurhesshhmihhlvgdrfhhr
X-ME-Proxy: <xmx:hQNTaLzd5QdBAWtJCM1yDMYURFLUcXLljnfeZIfq1PEIrP4sujrU-g>
 <xmx:hQNTaGQVqo82Psp82-8HhtAM1DZPwzFrNP0Z32WGlwrnWzYVWc4k4Q>
 <xmx:hQNTaOaPuevdvbpVf5EL75_sV7t8Ccop0OGo0EZiP6cDobdvbG5XTA>
 <xmx:hQNTaHR68KN7FZQcOVuMz_vEr96NgTKEFCZGPmI16gNwNNfaPnKaXg>
 <xmx:hQNTaHIsqUUpaUYbx9EBR3ElrnQZf-wAristlEzpur7WRybqi3Gn1QrS>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Jun 2025 14:20:52 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Wed, 18 Jun 2025 19:20:32 +0100
MIME-Version: 1.0
Message-Id: <20250618-loongarch-v3-7-d11baae32eea@flygoat.com>
References: <20250618-loongarch-v3-0-d11baae32eea@flygoat.com>
In-Reply-To: <20250618-loongarch-v3-0-d11baae32eea@flygoat.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>, 
 Romain Naour <romain.naour@gmail.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Dick Olsson <hi@senzilla.io>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Romain Naour <romain.naour@smile.fr>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6713;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=QD+nMT1SOuyOabfMKamZijyDld4VGQfUwUP0DAh7D5k=;
 b=owGbwMvMwCHmXMhTe71c8zDjabUkhoxg5krev8X+ulODP/R9mul7K1j9zP71KvesrITiErMnm
 LG0aj/rKGVhEONgkBVTZAkRUOrb0HhxwfUHWX9g5rAygQxh4OIUgIk8Psrwh0O4wV0g8del8osX
 j01tPcLelS6xK3fTE27zR8cfsxp6+zIy9MUzCj+/YfvTJPD06629n87zlrlo1rUvjZv6TItV/Z0
 LLwA=
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=flygoat.com; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm2; t=1750270853;
 x=1750357253; bh=eNqlxPwNFZMMgLBiUETeterjnxYFgFPvUBw9+A9zWJ0=; b=
 udXE+JnRRUj1JCrLIXuFqt7vo7nZItluStPoESa8kbPHYJ6Q8aWue2MzHxoOqPOq
 /cKR1VX72n6FmV+2ZOFjoCiyDBFBgi8DWBRAN23FZb94Ow4DYJhqWH5ssI+/d2J+
 d6EGGsl0jMQucJYyNdoGrJf5mPtYwIJQmSLvfYETpWgnYHq/IHhie3iRoXZFydIi
 gtC+xjelD120Dyh6CQR0SXSzr7NLiceAqT9Q/rgJmVAPExe08ZagPUPi8KUjPC6U
 sNKb6TFLAHmiewoRHAXwhq/v4k1Fljg0sBwvKU8XijwbaEgd3Dt+QkWHBA8YMvXV
 RmV0hhE0+1LEdJKpkj8odg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1750270853; x=
 1750357253; bh=eNqlxPwNFZMMgLBiUETeterjnxYFgFPvUBw9+A9zWJ0=; b=j
 6vC0iZOVg9Y49SXKoBw8i5FhvmraXZ6QsJIUqCei7VR1KTseYPqbokL1o53JJNdm
 fCGKQ1NJ3Dzsjk4xzUPKrQYeniGm5ut+havHaohsu28Q9HqZQ5Pw44zKDWE+fRr5
 sdWTKHXAWL7EleKorBe4Is7HM0n7TZy4M68/o2a7DMTQhOa2qfwi5FQx0SJMx+xm
 J9pB0j1AhOZ3u6g02xS+6S8XMl/3Abd2XC2SQzRyeRGpETR7N1gEK6sQxUitNlus
 rFuWIEOnw5AeLlGC4YZa/Axauqch+lFQNYnW97EgQha018yOwMnOdza7q+rKvRRq
 OxiOUjkBPxc0EaEQHT9uQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=flygoat.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=flygoat.com
 header.i=@flygoat.com header.a=rsa-sha256 header.s=fm2 header.b=udXE+JnR; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=j6vC0iZO
Subject: [Buildroot] [PATCH v3 07/11] configs/loongarch64_efi: new defconfig
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Introduce bread new loongarch64-efi board, with skeleton
from aarch64-efi board.

It corverd most LoongArch64 systems.

Linux 6.12, as the most recent LTS kernel, was chosen
to ensure proper architecture support is included.

This board config is validated on my Lemote A2101
Loongson 3A5000 board.

A developer entry is created for myself for future contacts
as well.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
--
v3:
	- Simplify root partation UUID
	- Add links about machine & firmware
---
 DEVELOPERS                                         |  2 ++
 board/loongarch64-efi/genimage-efi.cfg             | 30 +++++++++++++++++
 board/loongarch64-efi/grub.cfg                     |  6 ++++
 .../patches/linux-headers/linux-headers.hash       |  1 +
 board/loongarch64-efi/patches/linux/linux.hash     |  2 ++
 board/loongarch64-efi/post-image.sh                |  5 +++
 board/loongarch64-efi/readme.txt                   | 38 ++++++++++++++++++++++
 configs/loongarch64_efi_defconfig                  | 22 +++++++++++++
 8 files changed, 106 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index a406ca6a3de4b46243118c3e1e0363a2c1708836..600cd6c22ff6db57f9ef1da5ba9b6c15b37ca7f8 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1644,6 +1644,8 @@ F:	package/rtty/
 
 N:	Jiaxun Yang <jiaxun.yang@flygoat.com>
 F:	arch/Config.in.loongarch
+F:	board/loongarch64-efi
+F:	configs/loongarch64_efi_defconfig
 
 N:	Joachim Wiberg <troglobit@gmail.com>
 F:	configs/globalscale_espressobin_defconfig
diff --git a/board/loongarch64-efi/genimage-efi.cfg b/board/loongarch64-efi/genimage-efi.cfg
new file mode 100644
index 0000000000000000000000000000000000000000..24b9a8d943fcfed223a2f9da0093631503fe1579
--- /dev/null
+++ b/board/loongarch64-efi/genimage-efi.cfg
@@ -0,0 +1,30 @@
+image efi-part.vfat {
+	vfat {
+		file EFI {
+			image = "efi-part/EFI"
+		}
+		file vmlinux.efi {
+			image = "vmlinux.efi"
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
+		partition-type-uuid = root-loongarch64
+		image = "rootfs.ext2"
+	}
+}
diff --git a/board/loongarch64-efi/grub.cfg b/board/loongarch64-efi/grub.cfg
new file mode 100644
index 0000000000000000000000000000000000000000..2006f6d60d9b4bde1f8a12c87d76476f9401c6ca
--- /dev/null
+++ b/board/loongarch64-efi/grub.cfg
@@ -0,0 +1,6 @@
+/set default="0"
+set timeout="5"
+
+menuentry "Buildroot" {
+	linux /vmlinux.efi root=PARTLABEL=root rootwait console=ttyS0,115200
+}
diff --git a/board/loongarch64-efi/patches/linux-headers/linux-headers.hash b/board/loongarch64-efi/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000000000000000000000000000000000..5808d92afe89015ae416e941adf041644162d996
--- /dev/null
+++ b/board/loongarch64-efi/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/loongarch64-efi/patches/linux/linux.hash b/board/loongarch64-efi/patches/linux/linux.hash
new file mode 100644
index 0000000000000000000000000000000000000000..381f3427a60dda4476631271787ff752bca52204
--- /dev/null
+++ b/board/loongarch64-efi/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  a9b020721778384507010177d3929e7d4058f7f6120f05a99d56b5c5c0346a70  linux-6.12.32.tar.xz
diff --git a/board/loongarch64-efi/post-image.sh b/board/loongarch64-efi/post-image.sh
new file mode 100755
index 0000000000000000000000000000000000000000..fdb17ece7003611d0cd6de84ed4dbd14767e5b68
--- /dev/null
+++ b/board/loongarch64-efi/post-image.sh
@@ -0,0 +1,5 @@
+#!/bin/sh
+
+BOARD_DIR="$(dirname "$0")"
+
+cp -f "${BOARD_DIR}/grub.cfg" "${BINARIES_DIR}/efi-part/EFI/BOOT/grub.cfg"
diff --git a/board/loongarch64-efi/readme.txt b/board/loongarch64-efi/readme.txt
new file mode 100644
index 0000000000000000000000000000000000000000..8b92f620f9804be044d152728229e128d4dfbf1c
--- /dev/null
+++ b/board/loongarch64-efi/readme.txt
@@ -0,0 +1,38 @@
+The loongarch64_efi_defconfig allows to build a minimal Linux system that
+can boot on all loongarch64 systems providing an New World [1] EFI firmware.
+
+This includes almost all LoongArch Loongson-3 series workstations and servers,
+see [2] for hardware and firmware information.
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
+
+[1]: https://areweloongyet.com/en/docs/old-and-new-worlds/
+[2]: https://github.com/loongson/Firmware
diff --git a/configs/loongarch64_efi_defconfig b/configs/loongarch64_efi_defconfig
new file mode 100644
index 0000000000000000000000000000000000000000..c98699330d3cd9907043573465a9c8b189d47384
--- /dev/null
+++ b/configs/loongarch64_efi_defconfig
@@ -0,0 +1,22 @@
+BR2_loongarch64=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_GLOBAL_PATCH_DIR="board/loongarch64-efi/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/loongarch64-efi/post-image.sh support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/loongarch64-efi/genimage-efi.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.32"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="200M"
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_GRUB2=y
+BR2_TARGET_GRUB2_LOONGARCH64_EFI=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y

-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
