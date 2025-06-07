Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE73BC5B543
	for <buildroot@archiver.kernel.org>; Sat,  7 Jun 2025 18:21:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8EEA040B0F;
	Sat,  7 Jun 2025 18:21:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RdLYglx1Vwht; Sat,  7 Jun 2025 18:21:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D99C740A4D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D99C740A4D;
	Sat,  7 Jun 2025 18:21:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5B2A21F2
 for <buildroot@buildroot.org>; Sat,  7 Jun 2025 18:21:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3AE5240622
 for <buildroot@buildroot.org>; Sat,  7 Jun 2025 18:21:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lm-mel56wcbL for <buildroot@buildroot.org>;
 Sat,  7 Jun 2025 18:21:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=202.12.124.151;
 helo=fout-b8-smtp.messagingengine.com; envelope-from=jiaxun.yang@flygoat.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E386040639
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E386040639
Received: from fout-b8-smtp.messagingengine.com
 (fout-b8-smtp.messagingengine.com [202.12.124.151])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E386040639
 for <buildroot@buildroot.org>; Sat,  7 Jun 2025 18:21:05 +0000 (UTC)
Received: from phl-compute-03.internal (phl-compute-03.phl.internal
 [10.202.2.43])
 by mailfout.stl.internal (Postfix) with ESMTP id 5C2C211400FB;
 Sat,  7 Jun 2025 14:12:52 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-03.internal (MEProxy); Sat, 07 Jun 2025 14:12:52 -0400
X-ME-Sender: <xms:JIFEaN2usT9qe6ruBGmjWT8bbENqKP6u8HbodrFUf4-ETdtKzpdMTQ>
 <xme:JIFEaEEedOMmTlMIGDF0vxRlhSAyviISeMywz6McuAEUAMCchBr-l3FQuTloJNHDi
 wF2kWET35ppkSRHZIw>
X-ME-Received: <xmr:JIFEaN6f62Qp9v0XvOY3NoUa7oMGVp7GNOMgS0WuACAkR2fHjvQLHOx6xCN3Cg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdeikeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
 rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
 htshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdej
 necuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhi
 hgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepkeekgfdvgfehffevtdevkeejuedt
 ieefhfevtefftddvjeffledujeegtdeikeelnecuffhomhgrihhnpehurghpihdqghhroh
 huphdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhr
 ohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmpdhnsggprhgtphhtth
 hopeeipdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehjihgrgihunhdrhigrnhhg
 sehflhihghhorghtrdgtohhmpdhrtghpthhtohephhhisehsvghniihilhhlrgdrihhopd
 hrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
 pdhrtghpthhtohepghhiuhhlihhordgsvghnvghtthhisegsvghnvghtthhivghnghhinh
 gvvghrihhnghdrtghomhdprhgtphhtthhopehrohhmrghinhdrnhgrohhurhesghhmrghi
 lhdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorh
 hg
X-ME-Proxy: <xmx:JIFEaK3xf9M3YlGlYZcx-GSoCgMtoBZyUhVLXro1KSEyoaSWIv_xfg>
 <xmx:JIFEaAEZWw7Rde_taE0wy8z86QEL1PhO5IM0LYXuOvFjOVsCHxGcwA>
 <xmx:JIFEaL8nE2GoDCCo0kN0XBqphQSP0lxIqmC8vUIE-ehO5adx_vwyOw>
 <xmx:JIFEaNkXj0NmB0rZ9jjXcZOndG7Pzc1KjY53FB71EvMY4cTN3_rmBQ>
 <xmx:JIFEaIwcNZCg2Jfi8RITO92R0LAYEgtNqX9nBYy44iH5eU7mCJgyF1EC>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 7 Jun 2025 14:12:51 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Sat, 07 Jun 2025 19:12:43 +0100
MIME-Version: 1.0
Message-Id: <20250607-loongarch-v2-9-90bc4fda9080@flygoat.com>
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
 :references:reply-to:subject:subject:to:to; s=fm2; t=1749319972;
 x=1749406372; bh=xU0efVL5Eo81Cj7ShBya+r/QGoVJ15+iqjGkva6Jwn4=; b=
 dQL3tifPjDJB34nK0h+jhBFuK/MtA/H0S+DD/wi98hJ16Do7Gn4oTx28Z0fdZw1t
 ctdIYqPFl/5wuhCxsIzM2Tk7puf5V4CBRye3IEe3PeMi3qD8W7VJyUktOuzKB6OW
 avzjRE9AXKauK1D0w61k23U/8ypzliED5Psj8jNIR+TlnSUrUow4hq35c7vRpGzh
 yPytGUDwiMdvv8+kHQjUIRBYsKhNTFwja8pp2DUeeHZvTLrzzc5AkLmSFTg3kagm
 G3+uXMRMUkyvtz2NG8X2QlDcvXo4ehNMXdfbby2U8wGaPec4frVk+XsFBZXVMha2
 ho5qzNH+00RPrYHr9JXwZw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1749319972; x=
 1749406372; bh=xU0efVL5Eo81Cj7ShBya+r/QGoVJ15+iqjGkva6Jwn4=; b=Y
 W6g/E9iXNZ8uJVDvZVPqHQNxR26jDQ92eAvzxVBa8gzGGcgb9i3PXvICV5YrdblC
 TAeIjm2kXEZ8WwydcjL0Q+zc8NwTmUTIQn6TcYsQ614P7NfOeTwXOujuJcrpa8Bf
 ZlHR1BRrfB1db8uVtjJCFRA1FXQXfKcTPk0qQptF2rpjpMwpuTRwjg0hEWPURhhM
 syeq0FThya6PMIAN73OCCWe9XFHTjGlXeAyYBCdBPYjnrojUrwQaBkkBOuhL6Jn+
 aQtmCXqUNWMqXYee7vadRslawSM+SH/szQ8wY6pfdfifoGB4UTz+hlggzuJ1N0zB
 RBZJ1XGV9vNoBwqWfoGEQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=flygoat.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=flygoat.com
 header.i=@flygoat.com header.a=rsa-sha256 header.s=fm2 header.b=dQL3tifP; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=YW6g/E9i
Subject: [Buildroot] [PATCH v2 9/9] board/qemu: Add loongarch64-virt-efi
 variant
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

Add qemu_loongarch64_virt_efi_defconfig, which builds EDK2
and host QEMU to test LoongArch64 buildroot.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 DEVELOPERS                                    |  2 ++
 board/qemu/loongarch64-virt-efi/genimage.cfg  | 33 +++++++++++++++++++++++++++
 board/qemu/loongarch64-virt-efi/grub.cfg      |  6 +++++
 board/qemu/loongarch64-virt-efi/post-image.sh |  5 ++++
 board/qemu/loongarch64-virt-efi/readme.txt    | 31 +++++++++++++++++++++++++
 configs/qemu_loongarch64_virt_efi_defconfig   | 23 +++++++++++++++++++
 6 files changed, 100 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 600cd6c22ff6db57f9ef1da5ba9b6c15b37ca7f8..cac88b6be1dd0daccbba7f26f2e5961274cd3871 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1645,7 +1645,9 @@ F:	package/rtty/
 N:	Jiaxun Yang <jiaxun.yang@flygoat.com>
 F:	arch/Config.in.loongarch
 F:	board/loongarch64-efi
+F:	qemu/loongarch64-virt-efi
 F:	configs/loongarch64_efi_defconfig
+F:	configs/qemu_loongarch64_virt_efi_defconfig
 
 N:	Joachim Wiberg <troglobit@gmail.com>
 F:	configs/globalscale_espressobin_defconfig
diff --git a/board/qemu/loongarch64-virt-efi/genimage.cfg b/board/qemu/loongarch64-virt-efi/genimage.cfg
new file mode 100644
index 0000000000000000000000000000000000000000..95fb59c97c38db772485372a60ee1fe5dad717c6
--- /dev/null
+++ b/board/qemu/loongarch64-virt-efi/genimage.cfg
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
diff --git a/board/qemu/loongarch64-virt-efi/grub.cfg b/board/qemu/loongarch64-virt-efi/grub.cfg
new file mode 100644
index 0000000000000000000000000000000000000000..dc3452fe6a3dba9279c6bd8e0d48542e37555338
--- /dev/null
+++ b/board/qemu/loongarch64-virt-efi/grub.cfg
@@ -0,0 +1,6 @@
+set default="0"
+set timeout="5"
+
+menuentry "Buildroot" {
+	linux /vmlinux.efi root=PARTLABEL=root rootwait console=ttyS0
+}
diff --git a/board/qemu/loongarch64-virt-efi/post-image.sh b/board/qemu/loongarch64-virt-efi/post-image.sh
new file mode 100755
index 0000000000000000000000000000000000000000..fdb17ece7003611d0cd6de84ed4dbd14767e5b68
--- /dev/null
+++ b/board/qemu/loongarch64-virt-efi/post-image.sh
@@ -0,0 +1,5 @@
+#!/bin/sh
+
+BOARD_DIR="$(dirname "$0")"
+
+cp -f "${BOARD_DIR}/grub.cfg" "${BINARIES_DIR}/efi-part/EFI/BOOT/grub.cfg"
diff --git a/board/qemu/loongarch64-virt-efi/readme.txt b/board/qemu/loongarch64-virt-efi/readme.txt
new file mode 100644
index 0000000000000000000000000000000000000000..7c35ee1efe56e9b0e7584c544407a0c944373f10
--- /dev/null
+++ b/board/qemu/loongarch64-virt-efi/readme.txt
@@ -0,0 +1,31 @@
+Intro
+=====
+
+This is a LoongArch 64bit UEFI Linux boot demo in QEMU virt machine.
+
+Build
+=====
+
+    make qemu_loongarch64_virt-efi_defconfig
+    make
+
+Emulation
+=========
+
+Run the emulation with:
+
+    qemu-system-loongarch64 \
+        -M virt \
+        -smp 2 \
+        -m 1024 \
+        -nographic \
+        -bios output/images/QEMU_EFI.fd \
+        -drive file=output/images/disk.img,format=raw \
+        -netdev user,id=net0 \
+        -device virtio-net-pci,netdev=net0 # qemu_loongarch64_virt_efi_defconfig
+
+Note: for information, qemu version >= 9.0.0 is needed for this UEFI
+Linux demo. The host-qemu package in Buildroot (enabled in this
+defconfig) is sufficient to run this demo. In case another qemu is
+used (for example, from the host OS), make sure to check the version
+requirement.
diff --git a/configs/qemu_loongarch64_virt_efi_defconfig b/configs/qemu_loongarch64_virt_efi_defconfig
new file mode 100644
index 0000000000000000000000000000000000000000..cc65158c0282b17e4a995bd1d79a403e8112314a
--- /dev/null
+++ b/configs/qemu_loongarch64_virt_efi_defconfig
@@ -0,0 +1,23 @@
+BR2_loongarch64=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_GLOBAL_PATCH_DIR="board/qemu/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
+BR2_SYSTEM_DHCP="eth0"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/loongarch64-virt-efi/post-image.sh board/qemu/post-image.sh support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG) -c board/qemu/loongarch64-virt-efi/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.27"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="200M"
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_EDK2=y
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
