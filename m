Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A353DC44500
	for <buildroot@archiver.kernel.org>; Sun,  5 Jul 2026 12:46:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D85B34087D;
	Sun,  5 Jul 2026 12:46:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4E-VH3itRI2w; Sun,  5 Jul 2026 12:46:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E0D16407E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783255616;
	bh=ODv+qXSzHmcbWY1oExqTZBsgp81LHtV+Rr48xSutuYw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=N0GW3O1egLrwjnl+/ikVRuqMbK9klXw0w+JvTJpiHC31yZK4ltWxpSg6ci/h0JX6y
	 eOii32Sv/kri4gHI+z4dWX19glH2AmxJNyCYzuKC/5rwIInufRss/plnGPPKGud8vb
	 JkEpd9mn+iJZ7jIMZMJBo+jd+/MYg7V/0Qvdoa3Yxz95x6XjtAoVWtLHr92raz/RfM
	 IZou+Ecia1UXGBJabB2YLJPr4tAZnAADCrS5Y48PencSbVv2q6mkG0jdeoqGz6YaKi
	 byQJ37z2hIcEEcNQDCIVWWbYy/019F7dD9PXEV8NBHmz/Z980NCXzYj1JCFCFEgLvK
	 45SEXJjC0Gvsg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E0D16407E7;
	Sun,  5 Jul 2026 12:46:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 294BFF2
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 12:46:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0F8CC606E3
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 12:46:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YUrn1mOyEEz2 for <buildroot@buildroot.org>;
 Sun,  5 Jul 2026 12:46:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D1A060617
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0D1A060617
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 12:46:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9FC978847D; Sun,  5 Jul 2026 12:46:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 5 Jul 2026 14:46:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bff9d7181f53886332df55877eda9507cbda2ec4
X-Git-Newrev: d250f65cf6394adcfdf0d10262374be0dd1e7bf1
X-Patchwork-Hint: ignore
Message-Id: <20260705124622.9FC978847D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/aarch64_efi: support net boot with
 devicetree
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
Content-Type: multipart/mixed; boundary="===============8337619625253102446=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8337619625253102446==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d250f65cf6394adcfdf0d10262374be0dd1e7bf1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

UEFI platforms with a Devicetree have recently gained support for some form
of network booting. [1][2]

On those platforms, the UEFI firmware downloads the disk image over the
network and presents it to UEFI applications using the simple filesystem
protocol. This is sufficient for OS loaders such as e.g. GRUB to find their
configuration and load the kernel image.

The firmware must also describe the ramdisk to the OS, so that it finds its
root filesystem. On ACPI based platforms this is done with an NVDIMM
Firmware Interface Table (NFIT). On Devicetree based platforms, this can be
done with a pmem node. [3]

Add a kernel config fragment to add pmem support, which enables network
boot on UEFI platforms with Devicetree.
Also, briefly mention that we support this scenario in the readme.

This can be tested on Qemu, with the following procedure:

Build aarch64_efi_defconfig in a folder, to obtain output/images/disk.img,
and serve the image over HTTP with python:

  $ python -m http.server -d output/images/

In another terminal and another folder, configure a U-Boot based firmware
starting from qemu_aarch64_ebbr_defconfig, and with the following
additional configurations:

  BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.04"
  BR2_TARGET_UBOOT_NEEDS_DTC=y

Add the following U-Boot configurations to
board/qemu/aarch64-ebbr/u-boot.fragment:

  CONFIG_EFI_HTTP_BOOT=y
  CONFIG_NET_LWIP=y

Build everything; you should obtain output/images/flash.bin.

Start Qemu as per board/qemu/aarch64-ebbr/readme.txt, but omitting the hd0
-device and -drive stanzas.
U-Boot should start; interrupt it with enter.

At U-Boot prompt, type the following commands:

  => setenv loadaddr 0x43000000
  => efidebug boot rm 0
  => efidebug boot add -u 0 net http://10.0.2.2:8000/disk.img
  => efidebug boot order 0
  => bootefi bootmgr

U-Boot should download the disk image over HTTP and boot Linux with UEFI.
Look for the following message in Linux boot log, to confirm that it did
indeed mount its rootfs from the downloaded image:

  EXT4-fs (pmem0p2): mounted filesystem ...

Link: https://www.linaro.org/blog/installing-fedora-with-uefi-http-boot/ [1]
Link: https://docs.u-boot-project.org/en/latest/develop/uefi/uefi.html#uefi-http-boot-using-the-legacy-tcp-stack [2]
Link: https://github.com/ARM-software/edge-iot-arch-guide/blob/main/source/http-boot/pmem_node.md [3]
Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
Cc: Dick Olsson <hi@senzilla.io>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/aarch64-efi/linux-pmem-netboot.fragment |  3 +++
 board/aarch64-efi/readme.txt                  | 11 +++++++++++
 configs/aarch64_efi_defconfig                 |  1 +
 3 files changed, 15 insertions(+)

diff --git a/board/aarch64-efi/linux-pmem-netboot.fragment b/board/aarch64-efi/linux-pmem-netboot.fragment
new file mode 100644
index 0000000000..8c3e910919
--- /dev/null
+++ b/board/aarch64-efi/linux-pmem-netboot.fragment
@@ -0,0 +1,3 @@
+CONFIG_BLK_DEV_PMEM=y
+CONFIG_LIBNVDIMM=y
+CONFIG_OF_PMEM=y
diff --git a/board/aarch64-efi/readme.txt b/board/aarch64-efi/readme.txt
index 0e7ea0b5dd..259eb5b8c9 100644
--- a/board/aarch64-efi/readme.txt
+++ b/board/aarch64-efi/readme.txt
@@ -48,6 +48,17 @@ alternative to QEMU_EFI.fd. You will also need to change the machine
 specification to "-M virt,secure=on" on qemu command line, to enable TrustZone
 support, and you will need to increase the memory with "-m 1024".
 
+HTTP boot
+---------
+
+Some U-Boot and Devicetree based firmwares are capable of booting with UEFI from
+HTTP(s). [4]
+
+The aarch64_efi_defconfig has appropriate persistent memory support compiled in
+the Linux kernel to support this scenario. [5]
+
 [1]: https://github.com/ARM-software/ebbr
 [2]: https://developer.arm.com/architectures/system-architectures/arm-systemready
 [3]: https://github.com/glikely/u-boot-tfa-build
+[4]: https://docs.u-boot-project.org/en/latest/develop/uefi/uefi.html#uefi-http-boot-using-the-legacy-tcp-stack
+[5]: https://github.com/ARM-software/edge-iot-arch-guide/blob/main/source/http-boot/pmem_node.md
diff --git a/configs/aarch64_efi_defconfig b/configs/aarch64_efi_defconfig
index 390f3fc6ac..78292c0cc4 100644
--- a/configs/aarch64_efi_defconfig
+++ b/configs/aarch64_efi_defconfig
@@ -11,6 +11,7 @@ BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.14"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/aarch64-efi/linux-pmem-netboot.fragment"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_LINUX_KERNEL_NEEDS_HOST_PYTHON3=y
 BR2_TARGET_ROOTFS_EXT2=y

--===============8337619625253102446==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8337619625253102446==--
