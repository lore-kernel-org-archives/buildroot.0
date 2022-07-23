Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CA1EC433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 17:09:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C05AC40B13;
	Sat, 23 Jul 2022 17:09:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C05AC40B13
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H2oMvBVvqZny; Sat, 23 Jul 2022 17:09:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 67734404DF;
	Sat, 23 Jul 2022 17:09:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 67734404DF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DE92B1BF5DE
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 17:09:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B90F4404DF
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 17:09:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B90F4404DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Go_ScEt30hgL for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 17:09:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5755240179
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5755240179
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 17:09:47 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8acf:5600:a82c:98de:96c7:ec71])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 3D84319F730;
 Sat, 23 Jul 2022 19:09:43 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 23 Jul 2022 19:09:42 +0200
Date: Sat, 23 Jul 2022 19:09:42 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220723170942.GJ2641@scaer>
References: <20220719074042.2214649-1-thomas.petazzoni@bootlin.com>
 <20220719074042.2214649-5-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220719074042.2214649-5-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658596185;
 bh=s8GPgsW79p/kL2NlMCRV/IWUJJKJaUSHhTMPKXoO18g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Q/aAqKMbw9KWD36TDkt+Xbtxi9IIGZ+irJPMciiicRIoPFJE8I9KozRYjP+H75Dpr
 nM4LKV3RidDCVZlE7RvfQcsDQ0KL6Wz7tSNk08VY899MArhdhMEESCTKwuZVYrTeQM
 bVT+SGJiegqLMCfTRw5OCLuYkHFQaFTWXgIfGS+eZ1cxxdWGXPJ1+eDbq1qBY/RfvV
 67sa6k7Yvlix9KiqWOlhJcZcOU3Sqhk2Kk3x7jALDyUMwDV69yCkDRuMTX+KJIkAd0
 qtQv5rgpAj79YYQe40CAEiaNcSWFb0v2SSbC1quccW8T1YfYHqNHakw33mpMw5DBAo
 CLVcd18+pCNbg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Q/aAqKMb
Subject: Re: [Buildroot] [PATCH 4/4] support/testing/tests/boot: new test
 cases for Grub
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2022-07-19 09:40 +0200, Thomas Petazzoni via buildroot spake thusly:
> This commit adds four test cases for Grub:
> 
>  - Grub i386 legacy BIOS
>  - Grub i386 UEFI
>  - Grub x86-64 UEFI
>  - Grub AArch64 UEFI
> 
> There is some overlap with the ISO9660 filesystem test cases, some of
> which use Grub, but we found it relevant to have separate test cases
> for Grub, which were useful to test Grub in non-ISO9660 situations.
> 
> The Grub ARM UEFI case is not tested, as it requires Grub to be
> chain-loaded by U-Boot. Implementing this test case is left as an
> exercise for the reader.

I've removed use to ovmf-bin, which we in the end do not have, in favour
of building edk2 from source. Also, the EFI tests were missing
host-dosfstools, so I added that too.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  DEVELOPERS                                    |   2 +
>  support/testing/tests/boot/test_grub.py       | 153 ++++++++++++++++++
>  .../boot/test_grub/genimage-aarch64-efi.cfg   |  32 ++++
>  .../tests/boot/test_grub/grub-aarch64-efi.cfg |   6 +
>  .../boot/test_grub/linux-aarch64-efi.config   |   1 +
>  .../tests/boot/test_grub/post-build.sh        |   7 +
>  .../boot/test_grub/post-image-aarch64-efi.sh  |   8 +
>  7 files changed, 209 insertions(+)
>  create mode 100644 support/testing/tests/boot/test_grub.py
>  create mode 100644 support/testing/tests/boot/test_grub/genimage-aarch64-efi.cfg
>  create mode 100644 support/testing/tests/boot/test_grub/grub-aarch64-efi.cfg
>  create mode 100644 support/testing/tests/boot/test_grub/linux-aarch64-efi.config
>  create mode 100755 support/testing/tests/boot/test_grub/post-build.sh
>  create mode 100755 support/testing/tests/boot/test_grub/post-image-aarch64-efi.sh
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 34effa6005..3f697e63ec 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2855,6 +2855,8 @@ F:	package/squashfs/
>  F:	package/tinifier/
>  F:	package/wayland/
>  F:	package/weston/
> +F:	support/testing/tests/boot/test_grub.py
> +F:	support/testing/tests/boot/test_grub/
>  F:	support/testing/tests/boot/test_syslinux.py
>  F:	support/testing/tests/package/sample_python_augeas.py
>  F:	support/testing/tests/package/sample_python_flask.py
> diff --git a/support/testing/tests/boot/test_grub.py b/support/testing/tests/boot/test_grub.py
> new file mode 100644
> index 0000000000..33476f212e
> --- /dev/null
> +++ b/support/testing/tests/boot/test_grub.py
> @@ -0,0 +1,153 @@
> +import os
> +
> +import infra.basetest
> +
> +
> +class TestGrubi386BIOS(infra.basetest.BRTest):
> +    config = \
> +        """
> +        BR2_x86_core2=y
> +        BR2_TOOLCHAIN_EXTERNAL=y
> +        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_UCLIBC_STABLE=y
> +        BR2_ROOTFS_POST_BUILD_SCRIPT="board/pc/post-build.sh {}"
> +        BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
> +        BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/pc/genimage-bios.cfg"
> +        BR2_LINUX_KERNEL=y
> +        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.204"
> +        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> +        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/pc/linux.config"
> +        BR2_LINUX_KERNEL_INSTALL_TARGET=y
> +        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> +        BR2_TARGET_ROOTFS_EXT2=y
> +        BR2_TARGET_GRUB2=y
> +        BR2_TARGET_GRUB2_I386_PC=y
> +        BR2_TARGET_GRUB2_INSTALL_TOOLS=y
> +        BR2_PACKAGE_HOST_GENIMAGE=y
> +        """.format(infra.filepath("tests/boot/test_grub/post-build.sh"))
> +
> +    def test_run(self):
> +        hda = os.path.join(self.builddir, "images", "disk.img")
> +        self.emulator.boot(arch="i386", options=["-hda", hda])
> +        self.emulator.login()
> +
> +
> +class TestGrubi386EFI(infra.basetest.BRTest):
> +    config = \
> +        """
> +        BR2_x86_core2=y
> +        BR2_TOOLCHAIN_EXTERNAL=y
> +        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_UCLIBC_STABLE=y
> +        BR2_ROOTFS_POST_BUILD_SCRIPT="board/pc/post-build.sh {}"
> +        BR2_ROOTFS_POST_IMAGE_SCRIPT="board/pc/post-image-efi.sh"
> +        BR2_LINUX_KERNEL=y
> +        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.204"
> +        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> +        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/pc/linux.config"
> +        BR2_LINUX_KERNEL_INSTALL_TARGET=y
> +        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> +        BR2_PACKAGE_EFIVAR=y
> +        BR2_TARGET_ROOTFS_EXT2=y
> +        BR2_TARGET_GRUB2=y
> +        BR2_TARGET_GRUB2_I386_EFI=y
> +        BR2_TARGET_GRUB2_INSTALL_TOOLS=y
> +        BR2_TARGET_OVMF_BIN=y
> +        BR2_PACKAGE_HOST_GENIMAGE=y
> +        BR2_PACKAGE_HOST_MTOOLS=y
> +        """.format(infra.filepath("tests/boot/test_grub/post-build.sh"))
> +
> +    def test_run(self):
> +        hda = os.path.join(self.builddir, "images", "disk.img")
> +        bios = os.path.join(self.builddir, "images", "RELEASEIa32_OVMF.fd")
> +        self.emulator.boot(arch="i386", options=["-bios", bios, "-hda", hda])
> +        self.emulator.login()
> +
> +        cmd = "modprobe efivarfs"
> +        self.assertRunOk(cmd)
> +
> +        cmd = "mount -t efivarfs none /sys/firmware/efi/efivars"
> +        self.assertRunOk(cmd)
> +
> +        cmd = "efivar -l"
> +        self.assertRunOk(cmd)
> +
> +
> +class TestGrubX8664EFI(infra.basetest.BRTest):
> +    config = \
> +        """
> +        BR2_x86_64=y
> +        BR2_x86_corei7=y
> +        BR2_TOOLCHAIN_EXTERNAL=y
> +        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_UCLIBC_STABLE=y
> +        BR2_ROOTFS_POST_BUILD_SCRIPT="board/pc/post-build.sh {}"
> +        BR2_ROOTFS_POST_IMAGE_SCRIPT="board/pc/post-image-efi.sh"
> +        BR2_LINUX_KERNEL=y
> +        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.204"
> +        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> +        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/pc/linux.config"
> +        BR2_LINUX_KERNEL_INSTALL_TARGET=y
> +        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> +        BR2_PACKAGE_EFIVAR=y
> +        BR2_TARGET_ROOTFS_EXT2=y
> +        BR2_TARGET_GRUB2=y
> +        BR2_TARGET_GRUB2_X86_64_EFI=y
> +        BR2_TARGET_GRUB2_INSTALL_TOOLS=y
> +        BR2_TARGET_OVMF_BIN=y
> +        BR2_PACKAGE_HOST_GENIMAGE=y
> +        BR2_PACKAGE_HOST_MTOOLS=y
> +        """.format(infra.filepath("tests/boot/test_grub/post-build.sh"))
> +
> +    def test_run(self):
> +        hda = os.path.join(self.builddir, "images", "disk.img")
> +        bios = os.path.join(self.builddir, "images", "RELEASEX64_OVMF.fd")
> +        self.emulator.boot(arch="x86_64", options=["-bios", bios, "-hda", hda])
> +        self.emulator.login()
> +
> +        cmd = "modprobe efivarfs"
> +        self.assertRunOk(cmd)
> +
> +        cmd = "mount -t efivarfs none /sys/firmware/efi/efivars"
> +        self.assertRunOk(cmd)
> +
> +        cmd = "efivar -l"
> +        self.assertRunOk(cmd)
> +
> +
> +class TestGrubAArch64EFI(infra.basetest.BRTest):
> +    config = \
> +        """
> +        BR2_aarch64=y
> +        BR2_TOOLCHAIN_EXTERNAL=y
> +        BR2_ROOTFS_POST_IMAGE_SCRIPT="{post_image}"
> +        BR2_LINUX_KERNEL=y
> +        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
> +        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> +        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
> +        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{linux_fragment}"
> +        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> +        BR2_PACKAGE_EFIVAR=y
> +        BR2_TARGET_ROOTFS_EXT2=y
> +        BR2_TARGET_GRUB2=y
> +        BR2_TARGET_OVMF_BIN=y
> +        BR2_PACKAGE_HOST_GENIMAGE=y
> +        BR2_PACKAGE_HOST_MTOOLS=y
> +        """.format(post_image=infra.filepath("tests/boot/test_grub/post-image-aarch64-efi.sh"),
> +                   linux_fragment=infra.filepath("tests/boot/test_grub/linux-aarch64-efi.config"))
> +
> +    def test_run(self):
> +        hda = os.path.join(self.builddir, "images", "disk.img")
> +        bios = os.path.join(self.builddir, "images", "RELEASEAARCH64_QEMU_EFI.fd")
> +        self.emulator.boot(arch="aarch64", options=["-M", "virt", "-cpu", "cortex-a53", "-bios", bios, "-hda", hda])
> +        self.emulator.login()
> +
> +        cmd = "modprobe efivarfs"
> +        self.assertRunOk(cmd)
> +
> +        cmd = "mount -t efivarfs none /sys/firmware/efi/efivars"
> +        self.assertRunOk(cmd)
> +
> +        cmd = "efivar -l"
> +        self.assertRunOk(cmd)
> diff --git a/support/testing/tests/boot/test_grub/genimage-aarch64-efi.cfg b/support/testing/tests/boot/test_grub/genimage-aarch64-efi.cfg
> new file mode 100644
> index 0000000000..11615c885a
> --- /dev/null
> +++ b/support/testing/tests/boot/test_grub/genimage-aarch64-efi.cfg
> @@ -0,0 +1,32 @@
> +image efi-part.vfat {
> +	vfat {
> +		file EFI {
> +			image = "efi-part/EFI"
> +		}
> +
> +		file Image {
> +			image = "Image"
> +		}
> +	}
> +
> +	size = 16352K # 16MB - 32KB
> +}
> +
> +image disk.img {
> +	hdimage {
> +		partition-table-type = "gpt"
> +	}
> +
> +	partition boot {
> +		image = "efi-part.vfat"
> +		partition-type-uuid = c12a7328-f81f-11d2-ba4b-00a0c93ec93b
> +		offset = 32K
> +		bootable = true
> +	}
> +
> +	partition root {
> +		partition-type-uuid = 44479540-f297-41b2-9af7-d131d5f0458a
> +		partition-uuid = UUID_TMP
> +		image = "rootfs.ext2"
> +	}
> +}
> diff --git a/support/testing/tests/boot/test_grub/grub-aarch64-efi.cfg b/support/testing/tests/boot/test_grub/grub-aarch64-efi.cfg
> new file mode 100644
> index 0000000000..d40af0df24
> --- /dev/null
> +++ b/support/testing/tests/boot/test_grub/grub-aarch64-efi.cfg
> @@ -0,0 +1,6 @@
> +set default="0"
> +set timeout="5"
> +
> +menuentry "Buildroot" {
> + linux /Image root=PARTUUID=UUID_TMP rootwait console=ttyAMA0
> +}
> diff --git a/support/testing/tests/boot/test_grub/linux-aarch64-efi.config b/support/testing/tests/boot/test_grub/linux-aarch64-efi.config
> new file mode 100644
> index 0000000000..839566bae0
> --- /dev/null
> +++ b/support/testing/tests/boot/test_grub/linux-aarch64-efi.config
> @@ -0,0 +1 @@
> +CONFIG_ACPI=y
> diff --git a/support/testing/tests/boot/test_grub/post-build.sh b/support/testing/tests/boot/test_grub/post-build.sh
> new file mode 100755
> index 0000000000..8d6f0318de
> --- /dev/null
> +++ b/support/testing/tests/boot/test_grub/post-build.sh
> @@ -0,0 +1,7 @@
> +#!/bin/sh
> +
> +if [ -d "$BINARIES_DIR/efi-part/" ]; then
> +    sed -i 's%tty1%ttyS0,115200%' "$BINARIES_DIR/efi-part/EFI/BOOT/grub.cfg"
> +else
> +    sed -i 's%tty1%ttyS0,115200%' "$TARGET_DIR/boot/grub/grub.cfg"
> +fi
> diff --git a/support/testing/tests/boot/test_grub/post-image-aarch64-efi.sh b/support/testing/tests/boot/test_grub/post-image-aarch64-efi.sh
> new file mode 100755
> index 0000000000..2db516ef2d
> --- /dev/null
> +++ b/support/testing/tests/boot/test_grub/post-image-aarch64-efi.sh
> @@ -0,0 +1,8 @@
> +#!/bin/sh
> +
> +set -e
> +
> +UUID=$(dumpe2fs "$BINARIES_DIR/rootfs.ext2" 2>/dev/null | sed -n 's/^Filesystem UUID: *\(.*\)/\1/p')
> +sed "s/UUID_TMP/$UUID/g" support/testing/tests/boot/test_grub/grub-aarch64-efi.cfg > "$BINARIES_DIR/efi-part/EFI/BOOT/grub.cfg"
> +sed "s/UUID_TMP/$UUID/g" support/testing/tests/boot/test_grub/genimage-aarch64-efi.cfg > "$BINARIES_DIR/genimage-aarch64-efi.cfg"
> +support/scripts/genimage.sh -c "$BINARIES_DIR/genimage-aarch64-efi.cfg"
> -- 
> 2.36.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
