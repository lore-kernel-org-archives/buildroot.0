Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8FCCEE4993
	for <buildroot@archiver.kernel.org>; Tue, 22 Aug 2023 10:29:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F561814A0;
	Tue, 22 Aug 2023 10:29:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F561814A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZfetxKRK9eDQ; Tue, 22 Aug 2023 10:29:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 41E5B818A2;
	Tue, 22 Aug 2023 10:29:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41E5B818A2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CCF951BF354
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 10:29:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A5BF3402BC
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 10:29:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5BF3402BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J024JzkLqrTA for <buildroot@lists.busybox.net>;
 Tue, 22 Aug 2023 10:29:10 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AB3EC41693
 for <buildroot@buildroot.org>; Tue, 22 Aug 2023 10:29:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB3EC41693
Received: by mail.gandi.net (Postfix) with ESMTPSA id C67DF1C0004;
 Tue, 22 Aug 2023 10:29:04 +0000 (UTC)
Date: Tue, 22 Aug 2023 12:29:03 +0200
To: Andreas Dannenberg via buildroot <buildroot@buildroot.org>
Message-ID: <20230822122903.7502f8b6@windsurf>
In-Reply-To: <20230616002359.4139814-3-dannenberg@ti.com>
References: <20230616002359.4139814-1-dannenberg@ti.com>
 <20230616002359.4139814-3-dannenberg@ti.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692700145;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xXQflvsH9pu/5Zqqk23yr0co2L+X8PGf+HH3vw/raBY=;
 b=CaijtHWF1BZCLSlhs8+wyeB6zCiWx2i6biQ3BarubGPllytqheRdSdLvZmOMGVwwvyhdfo
 4ikQmNx0bx8snwNwTlAMN5r9LVamgHa17JEbSTdWmlXxw79iR8jZagom+IzkJvFkRkMjVB
 ytX22m8TPfME2Iv6RGBE+6g4dGvctwTD5c5HmYn5vd175AFaBvgHKbak0wzgsRqqQoKimq
 2/vSGemHy9SFE6uxuYPn+6oc3XJi4cuefp44tKJDRYJNz2syB/pV4vshd/EOxpr+cnE3sx
 JM0TmzPY0JqC8nwHOGgNmHVu1jIJp21TszYRYorDkJYeULXGn8f8vEvIyxjWbQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CaijtHWF
Subject: Re: [Buildroot] [PATCH v8 02/10] boot/ti-k3-image-gen: new package
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
Cc: Bryan Brattlof <bb@ti.com>, Andrew Davis <afd@ti.com>,
 Julien Olivain <ju.o@free.fr>, Xuanhao Shi <x-shi@ti.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Anand Gadiyar <gadiyar@ti.com>, Romain Naour <romain.naour@gmail.com>,
 Andreas Dannenberg <dannenberg@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Andreas,

On Thu, 15 Jun 2023 19:23:51 -0500
Andreas Dannenberg via buildroot <buildroot@buildroot.org> wrote:

> From: Xuanhao Shi <x-shi@ti.com>
> 
> This is the image generator that builds the initial boot binary,
> tiboot3.bin, for the R5 core on TI's K3 family of devices.
> This requires the R5 SPL output from the ti-k3-r5-loader package.
> 
> https://git.ti.com/cgit/k3-image-gen/k3-image-gen
> 
> Signed-off-by: Xuanhao Shi <x-shi@ti.com>
> Signed-off-by: Anand Gadiyar <gadiyar@ti.com>
> Signed-off-by: Andreas Dannenberg <dannenberg@ti.com>
> Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Acked-by: Andrew Davis <afd@ti.com>
> Tested-by: Bryan Brattlof <bb@ti.com>
> Cc: Romain Naour <romain.naour@gmail.com>
> Reviewed-by: Francois Perrad <francois.perrad@gadz.org>
> Reviewed-by: Julien Olivain <ju.o@free.fr>

I have applied this, but after doing a lot of changes.

The first major change is that I have created a
boot/ti-k3-boot-firmware/ package that is responsible for downloading
the ti-sysfw and ti-dm firmware files, and installing them in
$(BINARIES_DIR). Indeed your solution of downloading them directly from
ti-k3-image-gen (for ti-sysfw) and from uboot (for ti-dm) really wasn't
very clean, and it didn't allow to associate those firmware files to
their license, which is quite important considering they are
closed-source binary blobs.

In boot/ti-k3-boot-firmware/, I hesitated a long time between
downloading only the firmware files themselves directly, or downloading
the whole repository. In the end, I opted for downloading the whole
repository. Indeed, the firmware files themselves don't have a version
number in their file name, so once they land in the download directory,
we cannot have multiple versions of the firmware files sitting side by
side. Yes, the hash would detect that a firmware file is no longer
correct and needs to be re-downloaded. But if you alternate between
Buildroot versions that use different firmware versions, it would
constantly get an invalid and redownload, which I found not very nice.
So, this package download the monster 200+ MB .tar.gz, only to extra a
few hundreds of KBs of firmware files.


> diff --git a/boot/ti-k3-image-gen/Config.in b/boot/ti-k3-image-gen/Config.in
> new file mode 100644
> index 0000000000..97cb470119
> --- /dev/null
> +++ b/boot/ti-k3-image-gen/Config.in
> @@ -0,0 +1,55 @@
> +config BR2_TARGET_TI_K3_IMAGE_GEN
> +	bool "ti-k3-image-gen"
> +	depends on BR2_TARGET_TI_K3_R5_LOADER

Changed to:

+       depends on BR2_TARGET_TI_K3_R5_LOADER
+       select BR2_TARGET_TI_K3_BOOT_FIRMWARE
+       # We need FIT support in uboot-tools, which is why we select a
+       # host package
+       select BR2_PACKAGE_HOST_UBOOT_TOOLS
+       select BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT

> +	help
> +	  Use TI's k3-image-gen to build a separate bare metal
> +	  boot binary from a separate SPL that is running on
> +	  the R5 core. Currently supports version 08.06.00.007
> +	  as default.

Remove the reference to the version. We don't want to update the
Config.in help text when we update the package version.


> +if BR2_TARGET_TI_K3_IMAGE_GEN
> +choice
> +	prompt "SoC firmware type for image gen"
> +	default BR2_TARGET_TI_K3_IMAGE_GEN_FW_TYPE_TIFS
> +
> +config BR2_TARGET_TI_K3_IMAGE_GEN_FW_TYPE_TIFS
> +	bool "Firmware type TIFS"
> +	help
> +	  Use firmware type TIFS for SoCs like AM62x and
> +	  AM62Ax.
> +
> +config BR2_TARGET_TI_K3_IMAGE_GEN_FW_TYPE_TISCI
> +	bool "Firmware type TISCI"
> +	help
> +	  Use firmware type TISCI for SoCs like AM64x and
> +	  AM65x.
> +
> +endchoice
> +
> +config BR2_TARGET_TI_K3_IMAGE_GEN_SOC
> +	string "SoC"
> +	help
> +	  The target SoC option for image gen.
> +	  For example, "am64x" for AM64x boards.
> +
> +config BR2_TARGET_TI_K3_IMAGE_GEN_SOC_TYPE
> +	string "security type"
> +	help
> +	  The target SoC security type option for image gen.
> +	  Valid options are "gp" for General Purpose devices,
> +	  "hs-fs" for High Security - Field Securable devices, or
> +	  "hs" for High Security - Security Enforcing devices.
> +	  Note for all High Security device variants the
> +	  TI_SECURE_DEV_PKG environmental variable must be defined
> +	  at build time pointing to a valid core-secdev-k3 folder
> +	  location, otherwise the build will fail, see
> +	  https://git.ti.com/cgit/security-development-tools/core-secdev-k3
> +
> +config BR2_TARGET_TI_K3_IMAGE_GEN_CONFIG
> +	string "config type"
> +	help
> +	  The board config option for image gen.
> +	  Usually "sk" or "evm".
> +endif

I've changed this whole thing to use choices for the SoC and security
type. For the "config type", it was always "evm" for now, and the
firmware files only exist for "evm", so I dropped this option and
simply hardcoded "evm" in the package. It can always be revisited later
on. So it looks like this:

+if BR2_TARGET_TI_K3_IMAGE_GEN
+choice
+       prompt "SoC family"
+
+config BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62AX
+       bool "am62ax"
+
+config BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62X
+       bool "am62x"
+
+config BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM64X
+       bool "am64x"
+
+config BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM65X
+       bool "am65x"
+
+endchoice
+
+choice
+       prompt "Security type"
+       help
+         The target SoC security type option for image gen.  Valid
+         options are "gp" for General Purpose devices, "hs-fs" for
+         High Security - Field Securable devices, or "hs" for High
+         Security - Security Enforcing devices.  Note for all High
+         Security device variants the TI_SECURE_DEV_PKG environmental
+         variable must be defined at build time pointing to a valid
+         core-secdev-k3 folder location, otherwise the build will
+         fail, see
+         https://git.ti.com/cgit/security-development-tools/core-secdev-k3
+
+config BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE_GP
+       bool "gp"
+
+config BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE_HS_FS
+       bool "hs-fs"
+
+config BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE_HS
+       bool "hs"
+
+endchoice
+
+config BR2_TARGET_TI_K3_IMAGE_GEN_SOC
+       string
+       default "am62ax" if BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62AX
+       default "am62x"  if BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62X
+       default "am64x"  if BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM64X
+       default "am65x"  if BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM65X
+
+config BR2_TARGET_TI_K3_IMAGE_GEN_FW_TYPE
+       string
+       default "ti-fs"  if BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62AX
+       default "ti-fs"  if BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62X
+       default "ti-sci" if BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM64X
+       default "ti-sci" if BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM65X
+
+config BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE
+       string
+       default "gp"    if BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE_GP
+       default "hs-fs" if BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE_HS_FS
+       default "hs"    if BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE_HS

> diff --git a/boot/ti-k3-image-gen/ti-k3-image-gen.hash b/boot/ti-k3-image-gen/ti-k3-image-gen.hash
> new file mode 100644
> index 0000000000..6fb8c4c1eb
> --- /dev/null
> +++ b/boot/ti-k3-image-gen/ti-k3-image-gen.hash
> @@ -0,0 +1,23 @@
> +# Locally calculated
> +sha256  f89ea4b1f5c992455b1a682fde48359221b53f3294135df4bf20feea6aea90e4  k3-image-gen-08.06.00.007.tar.gz
> +sha256  f012e8d000d711d0539e5b4c812fc1d3a59c10fc1e3d6ea155556f5b78286845  LICENSE
> +
> +sha256  eca3d0dca65ceabdf17c7efa6b0eb651d365c6056730aa1c67700b7fea2e8bd2  ti-fs-firmware-am62x-gp.bin
> +sha256  9ed6089ca7d59e9e5919b0da92effe788138edef41682e0bf7eaea25a896a4f1  ti-fs-firmware-am62x-hs-cert.bin
> +sha256  655b5ded62b63f26c17b3ae2f23ac3565ae91fbd7fba1b7b0a4cb7807467523b  ti-fs-firmware-am62x-hs-enc.bin
> +sha256  5efa229acd122685fa928170a3f2e39597cce0231fca10b03d9b4d519db2259f  ti-fs-firmware-am62x-hs-fs-cert.bin
> +sha256  0f49da5e616a95dc8573531799d20fa7697a000f88084d09f3f6f5a665d85680  ti-fs-firmware-am62x-hs-fs-enc.bin
> +
> +sha256  c5c91d005b228a926fdc518f1e4365d2f693248a63f2432fccfbde10e5717499  ti-fs-firmware-am62ax-gp.bin
> +sha256  6de6d6a249217b15dd78dfb2b0ca99bda95aa15b7e4867a2cbe0d5a169422522  ti-fs-firmware-am62ax-hs-cert.bin
> +sha256  b1b3b25409013174fa5969b5bfaa572c0a79eee9e8b7445b3ac7867646eaf402  ti-fs-firmware-am62ax-hs-enc.bin
> +sha256  652b1369bed586cc294a65ee690056763a12034e4c9f0d05ea3838dd60ec8aba  ti-fs-firmware-am62ax-hs-fs-cert.bin
> +sha256  b37f82dad0998921672b36b6aeb1473197ab2720f612c2409292a81561ddc602  ti-fs-firmware-am62ax-hs-fs-enc.bin
> +
> +sha256  958fdb0613a1dc3a5cb90edf35b84981b94bd70de6255cdf5f220bce2a4b10ef  ti-sci-firmware-am64x-gp.bin
> +sha256  cfee8679183577392b513b317a4d9a6af47cde9a59ecbad758704e4bec38196c  ti-sci-firmware-am64x-hs-cert.bin
> +sha256  8760b70cc18cd5921d634ce226122aed5a28d64857d90f6ede40f2383dabd169  ti-sci-firmware-am64x-hs-enc.bin
> +sha256  1e78b106a8c7acd1641863ef86946e0d7272ad9b2d0e7ce451936d36a14e70e7  ti-sci-firmware-am64x_sr2-hs-cert.bin
> +sha256  c626bacd4abfbe4de1133b72568394a2e20dbe9a1623a3e77bae9f000e743bb4  ti-sci-firmware-am64x_sr2-hs-enc.bin
> +sha256  1d48d758d9ed940fe4072bd5b024ec502c72782ce2ca1c085f043f104a62ca70  ti-sci-firmware-am64x_sr2-hs-fs-cert.bin
> +sha256  1b22ba9ab5b94a9942e1f9c203b81733030c8bf4543a0aefffd200876a0c66eb  ti-sci-firmware-am64x_sr2-hs-fs-enc.bin

I dropped all of those hashes for .bin files, now that these firmware
files are downloaded and installed by ti-k3-boot-firmware.

> diff --git a/boot/ti-k3-image-gen/ti-k3-image-gen.mk b/boot/ti-k3-image-gen/ti-k3-image-gen.mk
> new file mode 100644
> index 0000000000..cdeac13cfa
> --- /dev/null
> +++ b/boot/ti-k3-image-gen/ti-k3-image-gen.mk
> @@ -0,0 +1,71 @@
> +################################################################################
> +#
> +# ti-k3-image-gen
> +#
> +################################################################################
> +
> +TI_K3_IMAGE_GEN_VERSION = 08.06.00.007
> +TI_K3_IMAGE_GEN_SITE = https://git.ti.com/cgit/k3-image-gen/k3-image-gen/snapshot
> +TI_K3_IMAGE_GEN_SOURCE = k3-image-gen-$(TI_K3_IMAGE_GEN_VERSION).tar.gz
> +TI_K3_IMAGE_GEN_LICENSE = BSD-3-Clause
> +TI_K3_IMAGE_GEN_LICENSE_FILES = LICENSE
> +TI_K3_IMAGE_GEN_INSTALL_IMAGES = YES
> +
> +# ti-k3-image-gen is used to build tiboot3.bin, using the r5-u-boot-spl.bin file
> +# from the ti-k3-r5-loader package. Hence the dependency on ti-k3-r5-loader.
> +TI_K3_IMAGE_GEN_DEPENDENCIES = host-arm-gnu-toolchain ti-k3-r5-loader

Changed to:

+# - ti-k3-image-gen is used to build tiboot3.bin, using the
+#   r5-u-boot-spl.bin file from the ti-k3-r5-loader package. Hence the
+#   dependency on ti-k3-r5-loader.
+# - the ti-k3-image-gen makefiles seem to need some feature from Make
+#   v4.0, similar to u-boot.
+TI_K3_IMAGE_GEN_DEPENDENCIES = \
+       host-arm-gnu-toolchain \
+       host-python3 \
+       host-openssl \
+       host-uboot-tools \
+       ti-k3-r5-loader \
+       ti-k3-boot-firmware \
+       $(BR2_MAKE_HOST_DEPENDENCY)

We need host-python3 because ti-k3-image-gen contains Python scripts
executed on the host. We need host-openssl because the Makefile of
ti-k3-image-gen generates some SSL certificates using the openssl tool.
We need host-uboot-tools because the Makefile of ti-k3-image-gen
invokes mkimage. We need ti-k3-boot-firmware to have the ti-sysfw
firmware files installed. And we need $(BR2_MAKE_HOST_DEPENDENCY)
otherwise using $(BR2_MAKE) is not correct.

> +ifeq ($(BR2_TARGET_TI_K3_IMAGE_GEN_FW_TYPE_TIFS),y)
> +TI_K3_IMAGE_GEN_FW_TYPE = $(call qstrip,"ti-fs")
> +else ifeq ($(BR2_TARGET_TI_K3_IMAGE_GEN_FW_TYPE_TISCI),y)
> +TI_K3_IMAGE_GEN_FW_TYPE = $(call qstrip,"ti-sci")
> +else
> +$(error No TI K3 Image Gen firmware type set)
> +endif

Dropped, this is now done in Config.in based on the selected SoC.

> +TI_K3_IMAGE_GEN_SOC = $(call qstrip,$(BR2_TARGET_TI_K3_IMAGE_GEN_SOC))
> +TI_K3_IMAGE_GEN_SOC_TYPE = $(call qstrip,$(BR2_TARGET_TI_K3_IMAGE_GEN_SOC_TYPE))
> +TI_K3_IMAGE_GEN_CONFIG = $(call qstrip,$(BR2_TARGET_TI_K3_IMAGE_GEN_CONFIG))

I now have:

+TI_K3_IMAGE_GEN_FW_TYPE = $(call qstrip,$(BR2_TARGET_TI_K3_IMAGE_GEN_FW_TYPE))
+TI_K3_IMAGE_GEN_SOC = $(call qstrip,$(BR2_TARGET_TI_K3_IMAGE_GEN_SOC))
+TI_K3_IMAGE_GEN_SECTYPE = $(call qstrip,$(BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE))
+
+TI_K3_IMAGE_GEN_SYSFW = $(TI_K3_IMAGE_GEN_FW_TYPE)-firmware-$(TI_K3_IMAGE_GEN_SOC)-$(TI_K3_IMAGE_GEN_SECTYPE).bin

> +# This hash comes from the Makefile in ti-k3-image-gen and corresponds to
> +# FW from Git tag 08.06.00.006
> +TI_K3_SYSFW_VERSION = 340194800a581baf976360386dfc7b5acab8d948
> +TI_K3_SYSFW_SITE = https://git.ti.com/processor-firmware/ti-linux-firmware/blobs/raw/$(TI_K3_SYSFW_VERSION)/ti-sysfw
> +ifeq ($(TI_K3_IMAGE_GEN_SOC_TYPE),gp)
> +TI_K3_SYSFW_SOURCE = \
> +	$(TI_K3_IMAGE_GEN_FW_TYPE)-firmware-$(TI_K3_IMAGE_GEN_SOC)-$(TI_K3_IMAGE_GEN_SOC_TYPE).bin
> +else
> +TI_K3_SYSFW_SOURCE = \
> +	$(TI_K3_IMAGE_GEN_FW_TYPE)-firmware-$(TI_K3_IMAGE_GEN_SOC)-$(TI_K3_IMAGE_GEN_SOC_TYPE)-cert.bin \
> +	$(TI_K3_IMAGE_GEN_FW_TYPE)-firmware-$(TI_K3_IMAGE_GEN_SOC)-$(TI_K3_IMAGE_GEN_SOC_TYPE)-enc.bin
> +endif
> +TI_K3_IMAGE_GEN_EXTRA_DOWNLOADS = $(patsubst %,$(TI_K3_SYSFW_SITE)/%,$(TI_K3_SYSFW_SOURCE))

This has entirely been dropped, as it is done by the separate
ti-k3-boot-firmware package.

> +define TI_K3_SYSFW_COPY
> +	$(foreach f,$(TI_K3_SYSFW_SOURCE), \
> +		cp $(TI_K3_IMAGE_GEN_DL_DIR)/$(f) $(@D)$(sep))
> +endef
> +TI_K3_IMAGE_GEN_POST_EXTRACT_HOOKS += TI_K3_SYSFW_COPY

I've instead added a:

+define TI_K3_IMAGE_GEN_CONFIGURE_CMDS
+       cp $(BINARIES_DIR)/ti-sysfw/$(TI_K3_IMAGE_GEN_SYSFW) $(@D)
+endef

It needs to be a configure command and not a post-extract as the
firmware files are now built/installed by ti-k3-boot-firmware, and
build dependencies are only guaranteed to be ready before our configure
step.

> +
> +# The ti-k3-image-gen makefiles seem to need some feature from Make v4.0,
> +# similar to u-boot. Explicitly use $(BR2_MAKE) here, as the build
> +# otherwise fails with some misleading error message.
> +TI_K3_IMAGE_GEN_MAKE = $(BR2_MAKE)
> +TI_K3_IMAGE_GEN_MAKE_OPTS = \
> +	SOC=$(TI_K3_IMAGE_GEN_SOC) \
> +	SOC_TYPE=$(TI_K3_IMAGE_GEN_SOC_TYPE) \
> +	CONFIG=$(TI_K3_IMAGE_GEN_CONFIG) \
> +	CROSS_COMPILE=$(HOST_DIR)/bin/arm-none-eabi- \
> +	SBL=$(BINARIES_DIR)/r5-u-boot-spl.bin \
> +	O=$(@D)/tmp \
> +	BIN_DIR=$(@D)
> +
> +define TI_K3_IMAGE_GEN_BUILD_CMDS
> +	$(TI_K3_IMAGE_GEN_MAKE) -C $(@D) $(TI_K3_IMAGE_GEN_MAKE_OPTS)
> +endef

The intermediate variables were not really useful, so changed to:

+define TI_K3_IMAGE_GEN_BUILD_CMDS
+       $(TARGET_MAKE_ENV) \
+       $(BR2_MAKE) -C $(@D) \
+               SOC=$(TI_K3_IMAGE_GEN_SOC) \
+               SOC_TYPE=$(TI_K3_IMAGE_GEN_SECTYPE) \
+               CONFIG=evm \
+               CROSS_COMPILE=$(HOST_DIR)/bin/arm-none-eabi- \
+               SBL=$(BINARIES_DIR)/r5-u-boot-spl.bin \
+               O=$(@D)/tmp \
+               BIN_DIR=$(@D)
+endef

The $(TARGET_MAKE_ENV) was also important as it allowed the build logic
to find our host tools in $(HOST_DIR)/bin, especially python3, mkimage
and openssl.

See the final commits of:

 - ti-k3-boot-firmware:
   https://gitlab.com/buildroot.org/buildroot/-/commit/2389c76a95725b91ba538b56fb7da70877c7d3ad

 - ti-k3-image-gen:
   https://gitlab.com/buildroot.org/buildroot/-/commit/6134872d2878f46f8f2800c81baf917281bc79b0

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
