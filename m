Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F330BC7115B
	for <buildroot@archiver.kernel.org>; Wed, 18 Jun 2025 18:31:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BBDE18115C;
	Wed, 18 Jun 2025 18:31:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F0VhDarnkzJc; Wed, 18 Jun 2025 18:31:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ABB3E8117C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ABB3E8117C;
	Wed, 18 Jun 2025 18:31:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id AD390E2
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 18:31:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AA4D140499
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 18:31:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LYuLbTaaM6GX for <buildroot@buildroot.org>;
 Wed, 18 Jun 2025 18:31:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=103.168.172.147;
 helo=fout-a4-smtp.messagingengine.com; envelope-from=jiaxun.yang@flygoat.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EA9DC40067
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA9DC40067
Received: from fout-a4-smtp.messagingengine.com
 (fout-a4-smtp.messagingengine.com [103.168.172.147])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EA9DC40067
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 18:31:11 +0000 (UTC)
Received: from phl-compute-09.internal (phl-compute-09.phl.internal
 [10.202.2.49])
 by mailfout.phl.internal (Postfix) with ESMTP id 0DA4313804C7;
 Wed, 18 Jun 2025 14:20:57 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-09.internal (MEProxy); Wed, 18 Jun 2025 14:20:57 -0400
X-ME-Sender: <xms:iANTaBH1qrzOdGzt43HOGFeIMrlkV8_CslJBSjIUCEZcTtz4r2Y6qQ>
 <xme:iANTaGW6md4mx67V5aGIPAmsibSS3hv8CZ_PfKhElXe56_e5HPKewk58Z9w6ouLQ-
 qyVcHgN28bK4daGwMo>
X-ME-Received: <xmr:iANTaDJzZ0eTNEemEXLJvVakCJ_HfY3-TZG5wLPuZk8jimUbB5Ws7HlXAg0hc4MzYn0KdN2xV_LEk1v9Lv8bSx4SLq67reyx8q2JCNR6dofRj8uoHggtmkCi_yn546i6Oas4y785leAxisg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdeffeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
 rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
 htshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdej
 necuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhi
 hgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepvdekiefhfeevkeeuveetfeelffek
 gedugefhtdduudeghfeuveegffegudekjeelnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdr
 tghomhdpnhgspghrtghpthhtohepkedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoh
 epthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthht
 ohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehroh
 hmrghinhdrnhgrohhurhesghhmrghilhdrtghomhdprhgtphhtthhopehjuhdrohesfhhr
 vggvrdhfrhdprhgtphhtthhopehgihhulhhiohdrsggvnhgvthhtihessggvnhgvthhtih
 gvnhhgihhnvggvrhhinhhgrdgtohhmpdhrtghpthhtohepjhhirgiguhhnrdihrghnghes
 fhhlhihgohgrthdrtghomhdprhgtphhtthhopehhihesshgvnhiiihhllhgrrdhiohdprh
 gtphhtthhopehrohhmrghinhdrnhgrohhurhesshhmihhlvgdrfhhr
X-ME-Proxy: <xmx:iANTaHFkhit34soTjc1dWOCoqqmK9GE96tQRKNvTMZoJPU7KcdLIgw>
 <xmx:iANTaHUO5hh5WpMGyL-iP5hytnySsEmrqUtPT3zqVE6aLxDzjhX-JA>
 <xmx:iANTaCPis5URO89u1X5avBU-9TPzHn2XBSLu4DtavHUjJAxFXN6L2Q>
 <xmx:iANTaG1MpJ_DF7A5ZfPPEWtiZ0sb644xz5HUn3yjGkKsdqwD2qGN-g>
 <xmx:iQNTaFElACa1dPXV-zk42EpLERtB6zgD4ZqdveRneDFLpcFJOl2Tge8Q>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Jun 2025 14:20:55 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Wed, 18 Jun 2025 19:20:35 +0100
MIME-Version: 1.0
Message-Id: <20250618-loongarch-v3-10-d11baae32eea@flygoat.com>
References: <20250618-loongarch-v3-0-d11baae32eea@flygoat.com>
In-Reply-To: <20250618-loongarch-v3-0-d11baae32eea@flygoat.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>, 
 Romain Naour <romain.naour@gmail.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Dick Olsson <hi@senzilla.io>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Julien Olivain <ju.o@free.fr>, Romain Naour <romain.naour@smile.fr>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5464;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=vKzNEWiHJEncTGiuDUdglCfBDivxF8CiFqSWgUnzbXo=;
 b=owGbwMvMwCHmXMhTe71c8zDjabUkhoxg5spQTe50f9cM963eHH/D1G1f+Tk0BS/qWSH+gcv34
 hwuluSOUhYGMQ4GWTFFlhABpb4NjRcXXH+Q9QdmDisTyBAGLk4BmMiUVEaGs4805c3XWPcpedx1
 EWvyW/i9JWFTbM2Ev4cXr/x6+8TZnYwMs+30/u1p7Msp2b1O+oyIrejmJ+3anE78z733MSfKHLj
 LBgA=
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=flygoat.com; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm2; t=1750270857;
 x=1750357257; bh=INXlDzt6xG1++cJS89VPoVwiYVtq874/WfFxaq7Vc7Y=; b=
 bSOGC4w2SVcGZXq2ddyedcGeX6oFZzd4PMLCqZ6Ss3jojIdXR8wMODewh75CtwPW
 q9cJwxvlaZ8xTn3xcVmH+5bK1yQPU9ZrUTBlZGaVqxTp56dnQ0Mre77IgRgRkS4A
 1aJIyYwXz4A13LI15wn5HhHTtxB1DexpALF6n/9BhZUzvKDQcsyEH1qHcZqd5f6I
 0LuuaRWJ8U1YQ81auqF/gi+S/TrGZNQNR2W6hjltkkF4YCpUqgQ6ygFMi/kmqoY5
 red9U8AtUxYrnwQLd4gl0w2rYJ4e06gzt0Re3whfyb+wpOTmT0tUw7u8A7IwnVTv
 q5LgqaMmXNdZ3Jh3j+54og==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1750270857; x=
 1750357257; bh=INXlDzt6xG1++cJS89VPoVwiYVtq874/WfFxaq7Vc7Y=; b=A
 jMrVPyQsI56jJpxMxPQ0ORFUwpLbbtFTRJoRtOlgbwfD/cvSdaedpFCoy/r2hrho
 r0XZshoLWJP164lQg3yInO5dIkYOQo5aU1ZkhB9d1tm3u+Y5oLZNQJ+/EVLc2WG5
 IeoQCXrwej/7XyXkpS6m/QAsjMN1OSWNyJNM2kCrULs73E+8knffEinPHZ3Er0F5
 Aqi2qR8zLoW75ljAagoCcfKS47CXRgXHCfqGTLLQgzqEoH03i2zPbrCI2QZNg1Ee
 TP7rSYSrTRIjMACR2LfxESwJcoSSwiDue/6MR+6DQrfbDTqKzNxrrxPp8ueKNLk6
 KP++xSfPvbjG0FfENYs1w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=flygoat.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=flygoat.com
 header.i=@flygoat.com header.a=rsa-sha256 header.s=fm2 header.b=bSOGC4w2; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=AjMrVPyQ
Subject: [Buildroot] [PATCH v3 10/11] configs/qemu_loongarch64_virt_efi: new
 defconfig
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
Tested-by: Julien Olivain <ju.o@free.fr>
Reviewed-by: Julien Olivain <ju.o@free.fr>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
Tested-by: Romain Naour <romain.naour@smile.fr>
---
v3: Address comments from Julien
---
 DEVELOPERS                                    |  2 ++
 board/qemu/loongarch64-virt-efi/genimage.cfg  | 30 ++++++++++++++++++++++++++
 board/qemu/loongarch64-virt-efi/grub.cfg      |  6 ++++++
 board/qemu/loongarch64-virt-efi/post-image.sh |  5 +++++
 board/qemu/loongarch64-virt-efi/readme.txt    | 31 +++++++++++++++++++++++++++
 configs/qemu_loongarch64_virt_efi_defconfig   | 25 +++++++++++++++++++++
 6 files changed, 99 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 600cd6c22ff6db57f9ef1da5ba9b6c15b37ca7f8..8030311fd9f8892712841a66ddab3a23a96a9fb0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1645,7 +1645,9 @@ F:	package/rtty/
 N:	Jiaxun Yang <jiaxun.yang@flygoat.com>
 F:	arch/Config.in.loongarch
 F:	board/loongarch64-efi
+F:	board/qemu/loongarch64-virt-efi
 F:	configs/loongarch64_efi_defconfig
+F:	configs/qemu_loongarch64_virt_efi_defconfig
 
 N:	Joachim Wiberg <troglobit@gmail.com>
 F:	configs/globalscale_espressobin_defconfig
diff --git a/board/qemu/loongarch64-virt-efi/genimage.cfg b/board/qemu/loongarch64-virt-efi/genimage.cfg
new file mode 100644
index 0000000000000000000000000000000000000000..24b9a8d943fcfed223a2f9da0093631503fe1579
--- /dev/null
+++ b/board/qemu/loongarch64-virt-efi/genimage.cfg
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
index 0000000000000000000000000000000000000000..945cb9232dadb883829fc1266b7ec7a1e92c03b4
--- /dev/null
+++ b/configs/qemu_loongarch64_virt_efi_defconfig
@@ -0,0 +1,25 @@
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
+BR2_PACKAGE_HOST_QEMU=y
+BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y

-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
