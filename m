Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 166BFC61DB2
	for <buildroot@archiver.kernel.org>; Sat,  7 Jun 2025 18:21:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD71060E0F;
	Sat,  7 Jun 2025 18:21:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4XIvtmIo0qkS; Sat,  7 Jun 2025 18:21:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D9B7D60E3A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D9B7D60E3A;
	Sat,  7 Jun 2025 18:21:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BCD771F2
 for <buildroot@buildroot.org>; Sat,  7 Jun 2025 18:21:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8AFBF60719
 for <buildroot@buildroot.org>; Sat,  7 Jun 2025 18:21:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PRk3MK58-awp for <buildroot@buildroot.org>;
 Sat,  7 Jun 2025 18:21:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=202.12.124.158;
 helo=fhigh-b7-smtp.messagingengine.com; envelope-from=jiaxun.yang@flygoat.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A383260B35
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A383260B35
Received: from fhigh-b7-smtp.messagingengine.com
 (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A383260B35
 for <buildroot@buildroot.org>; Sat,  7 Jun 2025 18:21:08 +0000 (UTC)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal
 [10.202.2.41])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 58BBD2540113;
 Sat,  7 Jun 2025 14:12:49 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-01.internal (MEProxy); Sat, 07 Jun 2025 14:12:49 -0400
X-ME-Sender: <xms:IYFEaGIVzDALxurbX3_U-Nfk_FCnQUyLCSwP3vP_7KvMNufZdlxZqg>
 <xme:IYFEaOJCaRzzyrT9Nl4iXCLeDFL54uY2A1q_HSSp6RrQNSKmv5k2PSs8OJkPIbIw-
 NM91tLpAmnrclYx-lY>
X-ME-Received: <xmr:IYFEaGveoEanQPqdtMrDD-XBXJfQj37aGhZv1JGtN7ikIa5Jgj0sG7SzqhZcFw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdeikeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
 rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
 htshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdej
 necuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhi
 hgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepleehtdevvdefgeeifffhhfdukeeu
 leekkedvueefvefgieeggeetleelueejudelnecuffhomhgrihhnpehurghpihdqghhroh
 huphdrohhrghdpkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfr
 rghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtg
 homhdpnhgspghrtghpthhtohepiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohep
 jhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomhdprhgtphhtthhopehhihessh
 gvnhiiihhllhgrrdhiohdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihes
 sghoohhtlhhinhdrtghomhdprhgtphhtthhopehgihhulhhiohdrsggvnhgvthhtihessg
 gvnhgvthhtihgvnhhgihhnvggvrhhinhhgrdgtohhmpdhrtghpthhtoheprhhomhgrihhn
 rdhnrghouhhrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessg
 huihhlughrohhothdrohhrgh
X-ME-Proxy: <xmx:IYFEaLZB2rOCd9utgtX5Suuqd8ok3NJOj4kPS43S_i8ukzOK0Ym8Ug>
 <xmx:IYFEaNZCA0-ZuGSh549Y9F_NDMVJsE392pfz2MwP4AijzCWpthE4wg>
 <xmx:IYFEaHBVnkQUhBkWnra87l9MetT2eQzTrgm7QYpYdYK3wicTeJ67fg>
 <xmx:IYFEaDaSCs59IqZ3-n90t0QU7Ziuv6WBoHYT1-UFrxu2VoFrfcHDGA>
 <xmx:IYFEaOngybsLq0UECNPzDItmv6X620xjXQTkeJ_WIou9QPChZXFsmOYk>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 7 Jun 2025 14:12:48 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Sat, 07 Jun 2025 19:12:41 +0100
MIME-Version: 1.0
Message-Id: <20250607-loongarch-v2-7-90bc4fda9080@flygoat.com>
References: <20250607-loongarch-v2-0-90bc4fda9080@flygoat.com>
In-Reply-To: <20250607-loongarch-v2-0-90bc4fda9080@flygoat.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>, 
 Romain Naour <romain.naour@gmail.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Dick Olsson <hi@senzilla.io>, Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.14.2
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=flygoat.com; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm2; t=1749319969;
 x=1749406369; bh=R5b3eAfcFqEPfUB+dh+VodWvQ75FZHY+umj5P1Bxghk=; b=
 aRGLai2KLrdEOn3bWZoHoU1UDZhg9morKZ5KR84Guc3H1Gds3HeetsqbqACI/GkO
 pQ07Kk+OlS0N78hSgnkbdRZeEqxlAWIqe77ZU9xu5pIt85RHd32P4biZYV3sX8mA
 TOAJfgQrhtzpq4SNmrYhWI1M/ehjG4S01mTbYFE1BPVxvxZepO5flcmx+8QKb/TS
 kezR6P2AWioOFS+pDKjOZhjDHXO2xh2GY1lMdtzEKsJam/DYKCOReXkbTO7pU8ZT
 +/cC513BPbeZQLzRoVUzvnbUqjCwXMwiEyXYMgQA6FeUUfGDjOBTmaUpe7vHjjMF
 /UTQw4pofdGJ1epMrCXmbA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1749319969; x=
 1749406369; bh=R5b3eAfcFqEPfUB+dh+VodWvQ75FZHY+umj5P1Bxghk=; b=m
 z1Nr8RPepF0CDaZgvHSLVLcC+bZdzD6y/J7KElLFTttieUsL9QiuxXPp1Xyrh20m
 QSMmKYPsobq3z/foLX0R+/CooaWdXLeldDcjrZLm0MWFeD8rso7Y2TdH+WXsXUQx
 9d8zkcXN/HV18Af8W62xGldDzcYDXotMDKekHeHGc3UuftufoeRgvUgJNAOc2oUI
 efQfbrX/wAI001N0rxuGysS0JAlEbfPMbPrSnsefXjZC1jnpPlzpskuuVJkeSvJ+
 Cj4Jc3RFJxo49MdemEGylZ8ixxagx6fEWYCRglR8y8LtzonFl1DvKGbImF12CyrN
 I+w7Pj2CRnMhqOqcSeWuA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=flygoat.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=flygoat.com
 header.i=@flygoat.com header.a=rsa-sha256 header.s=fm2 header.b=aRGLai2K; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=mz1Nr8RP
Subject: [Buildroot] [PATCH v2 7/9] board/loongarch64-efi: Introduce the new
 board
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

A developer entry is created for myself for future contacts
as well.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 DEVELOPERS                                         |  5 ++++
 board/loongarch64-efi/genimage-efi.cfg             | 33 +++++++++++++++++++++
 board/loongarch64-efi/grub.cfg                     |  6 ++++
 .../patches/linux-headers/linux-headers.hash       |  1 +
 board/loongarch64-efi/patches/linux/linux.hash     |  2 ++
 board/loongarch64-efi/post-image.sh                |  5 ++++
 board/loongarch64-efi/readme.txt                   | 34 ++++++++++++++++++++++
 configs/loongarch64_efi_defconfig                  | 22 ++++++++++++++
 8 files changed, 108 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index a7bb3bd83460017a183f59d05f6a560d7316a6ac..600cd6c22ff6db57f9ef1da5ba9b6c15b37ca7f8 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1642,6 +1642,11 @@ F:	package/libuhttpd/
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
index 0000000000000000000000000000000000000000..95fb59c97c38db772485372a60ee1fe5dad717c6
--- /dev/null
+++ b/board/loongarch64-efi/genimage-efi.cfg
@@ -0,0 +1,33 @@
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
+		# For partition-type-uuid value, see:
+		# https://uapi-group.org/specifications/specs/discoverable_partitions_specification/
+		# SD_GPT_ROOT_LOONGARCH64
+		partition-type-uuid = 77055800-792c-4f94-b39a-98c91b762bb6
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
index 0000000000000000000000000000000000000000..4c4e06874c1fce1bd8e44cd989b7e971304aa4f0
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
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
