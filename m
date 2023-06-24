Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 949EDEB64DA
	for <buildroot@archiver.kernel.org>; Sat, 24 Jun 2023 22:29:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 33CEA40B6B;
	Sat, 24 Jun 2023 22:29:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33CEA40B6B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v59AKvP76rGE; Sat, 24 Jun 2023 22:29:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E3CCF40B70;
	Sat, 24 Jun 2023 22:29:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E3CCF40B70
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0B04C1BF3EE
 for <buildroot@lists.busybox.net>; Sat, 24 Jun 2023 22:29:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E5A7C60B1B
 for <buildroot@lists.busybox.net>; Sat, 24 Jun 2023 22:29:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E5A7C60B1B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NLYsNrcrt5ge for <buildroot@lists.busybox.net>;
 Sat, 24 Jun 2023 22:29:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C7827605E3
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C7827605E3
 for <buildroot@buildroot.org>; Sat, 24 Jun 2023 22:29:05 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:36ab:e848:bc86:4439])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 51849B0053E;
 Sun, 25 Jun 2023 00:28:53 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 25 Jun 2023 00:28:52 +0200
Date: Sun, 25 Jun 2023 00:28:52 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Andreas Dannenberg <dannenberg@ti.com>
Message-ID: <20230624222852.GF24952@scaer>
References: <20230622160212.2063472-1-dannenberg@ti.com>
 <20230622160212.2063472-3-dannenberg@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230622160212.2063472-3-dannenberg@ti.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1687645742;
 bh=PDL8MoI/pBbK/ATZ5pQGiR8QXthOnovvmIkyN67ieRo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nZkUfr+uH36hsDFTAMl9d/S9BBoTWI7eqnPJS9Nd1ICqOmjY59866Ih3v2mgz1e8O
 AnCYo5kouTADj/sERuXfUa4UdOCUWavCPqQAWFFkDl3Js5HsAnGDZ94qMbcNJk997T
 Kz9iflY5LJKrYNFNXpKsyoF57RrPyuNHp9agqxIdwZXQu6dl/1mu8wkmWyeo4n61up
 Ovb+HFapTfrgnH2cN4lqrD8+6sp/8KE95gasxLHqLxESk6APIy1lmiMI6NotsEqRk7
 id4wVPZF+dXD15CI8K3yNPF37husrhQ0OiXnr1tBurt4cjskdJFikVI5IyjIngsKkm
 CjcsnazdWaO3Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=nZkUfr+u
Subject: Re: [Buildroot] [PATCH v9 02/11] boot/ti-k3-image-gen: new package
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
Cc: Bryan Brattlof <bb@ti.com>, Andrew Davis <afd@ti.com>,
 Julien Olivain <ju.o@free.fr>, Xuanhao Shi <x-shi@ti.com>,
 buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>, Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Andreas, All,

On 2023-06-22 11:02 -0500, Andreas Dannenberg via buildroot spake thusly:
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
> ---
[--SNIP--]
> diff --git a/boot/ti-k3-image-gen/Config.in b/boot/ti-k3-image-gen/Config.in
> new file mode 100644
> index 0000000000..910e1b99bc
> --- /dev/null
> +++ b/boot/ti-k3-image-gen/Config.in
> @@ -0,0 +1,57 @@
> +config BR2_TARGET_TI_K3_IMAGE_GEN
> +	bool "ti-k3-image-gen"
> +	depends on BR2_TARGET_TI_K3_R5_LOADER
> +	help
> +	  Use TI's k3-image-gen to build a separate bare metal
> +	  boot binary from a separate SPL that is running on
> +	  the R5 core. Currently supports version 08.06.00.007
> +	  as default.

It is not "as default" as this is indeed the only version possible
(i.e. there is no choice).

Also, we usualy do not reference the version in the help text, because
that makes it another place to track, and it is going to get out of sync
very quickly when the version is updated in the .mk.

> +	  https://git.ti.com/cgit/k3-image-gen/k3-image-gen/
> +
> +if BR2_TARGET_TI_K3_IMAGE_GEN
> +choice
> +	prompt "Firmware type"
> +	default BR2_TARGET_TI_K3_IMAGE_GEN_FW_TYPE_TIFS
> +
> +config BR2_TARGET_TI_K3_IMAGE_GEN_FW_TYPE_TIFS
> +	bool "TIFS"
> +	help
> +	  Use firmware type TIFS for SoCs like AM62x and
> +	  AM62Ax.
> +
> +config BR2_TARGET_TI_K3_IMAGE_GEN_FW_TYPE_TISCI
> +	bool "TISCI"
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

Is there a list of SoCs? Does it make sense to restrict the option o
only the existing list? Or is the list too long?

I'd use the freescale-imx packages as an example:

    choice
        prompt "i.MX platform"

    config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX25_3STACK
        bool "imx25-3stack"

    config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX27ADS
        bool "imx27ads"

    config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX37_3STACK
        bool "imx37-3stack"

    config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX50
        bool "imx50"

    [snip 12 other platforms]
    endchoice

    config BR2_PACKAGE_FREESCALE_IMX_PLATFORM
        string
        default "IMX25_3STACK" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX25_3STACK
        default "IMX27ADS" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX27ADS
        default "IMX37_3STACK" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX37_3STACK
        default "IMX50" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX50
        [snip the other 11 platforms [0]]

If the list for the TI SoCs is short enough (I can see only eight in the
source tree, under soc/), then we should make it a list:

    choice
        bool "SoC"

    config BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62X
        bool "am62x"
        select BR2_TARGET_TI_K3_IMAGE_GEN_HAS_FW_TYPE_TIFS

    config BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62AX
        bool "am62Ax"
        select BR2_TARGET_TI_K3_IMAGE_GEN_HAS_FW_TYPE_TIFS

    config BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM64X
        bool "am64x"
        select BR2_TARGET_TI_K3_IMAGE_GEN_HAS_FW_TYPE_TISCI

    config BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM65X
        bool "am65x"
        select BR2_TARGET_TI_K3_IMAGE_GEN_HAS_FW_TYPE_TISCI

    config BR2_TARGET_TI_K3_IMAGE_GEN_SOC_J7200
        bool "j7200"
        select BR2_TARGET_TI_K3_IMAGE_GEN_HAS_FW_TYPE_TIFS  # This is just for illustration!
        select BR2_TARGET_TI_K3_IMAGE_GEN_HAS_FW_TYPE_TISCI # Adapt as fit, of course!

    endchoice

    config BR2_TARGET_TI_K3_IMAGE_GEN_SOC
        string
        default "am62x" if BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62X
        default "am62ax" if BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62ax
        default "am64x" if BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM64X
        default "am65x" if BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM65X

    config BR2_TARGET_TI_K3_IMAGE_GEN_HAS_FW_TYPE_TIFS
        bool
        help
          Select this if your SoC supports TIFS firmware.

    config BR2_TARGET_TI_K3_IMAGE_GEN_HAS_FW_TYPE_TISCI
        bool
        help
          Select this if your SoC supports TISCI firmware.

    choice
        bool "Firmware type"

    config BR2_TARGET_TI_K3_IMAGE_GEN_FW_TYPE_TIFS
        bool "TIFS"
        depends on BR2_TARGET_TI_K3_IMAGE_GEN_HAS_FW_TYPE_TIFS

    config BR2_TARGET_TI_K3_IMAGE_GEN_FW_TYPE_TISCI
        bool "TISCI"
        depends on BR2_TARGET_TI_K3_IMAGE_GEN_HAS_FW_TYPE_TISCI

    endchoice

    config BR2_TARGET_TI_K3_IMAGE_GEN_FW_TYPE
        string
        default "ti-fs" if BR2_TARGET_TI_K3_IMAGE_GEN_FW_TYPE_TIFS
        default "ti-sci" if BR2_TARGET_TI_K3_IMAGE_GEN_FW_TYPE_TISCI

> +choice
> +	prompt "SoC Security type"
> +	default BR2_TARGET_TI_K3_IMAGE_GEN_SOC_TYPE_HS_FS
> +
> +config BR2_TARGET_TI_K3_IMAGE_GEN_SOC_TYPE_GP
> +	bool "GP (General Purpose)"
> +
> +config BR2_TARGET_TI_K3_IMAGE_GEN_SOC_TYPE_HS_FS
> +	bool "HS-FS (High Security - Field Securable)"
> +
> +config BR2_TARGET_TI_K3_IMAGE_GEN_SOC_TYPE_HS_SE
> +	bool "HS-SE (High Security - Security Enforcing)"
> +
> +endchoice

Do all SoCs support all security types? Or should this be restricted
like the firmware type?

Also, add a string option, it's easier than handling it in the .mk:

    config BR2_TARGET_TI_K3_IMAGE_GEN_SOC_TYPE
        string
        default "gp" if BR2_TARGET_TI_K3_IMAGE_GEN_SOC_TYPE_GP
        default "hs-fs" if BR2_TARGET_TI_K3_IMAGE_GEN_SOC_TYPE_HS_FS
        default "hs" if BR2_TARGET_TI_K3_IMAGE_GEN_SOC_TYPE_HS_SE

> +config BR2_TARGET_TI_K3_IMAGE_GEN_CONFIG
> +	string "Config type"
> +	help
> +	  The board config option for image gen.
> +	  Usually "sk" or "evm".
> +endif

Looking at the source tree, $(CONFIG) is used as a subdirectory to the
SoC directory:

    soc_srcroot = $(BUILD_SRC)/soc/$(BASE_SOC)/$(CONFIG)

And of all eight SoC I could see there, they all only have "evm" as a
subdirectory... So I think that we should just hard-code "evm" for now.

> diff --git a/boot/ti-k3-image-gen/ti-k3-image-gen.hash b/boot/ti-k3-image-gen/ti-k3-image-gen.hash
> new file mode 100644
> index 0000000000..2c73927e0b
> --- /dev/null
> +++ b/boot/ti-k3-image-gen/ti-k3-image-gen.hash
> @@ -0,0 +1,17 @@ 
> +# Locally calculated
> +sha256 f89ea4b1f5c992455b1a682fde48359221b53f3294135df4bf20feea6aea90e4 k3-image-gen-08.06.00.007.tar.gz
> +sha256 f012e8d000d711d0539e5b4c812fc1d3a59c10fc1e3d6ea155556f5b78286845 LICENSE
> +
> +sha256 eca3d0dca65ceabdf17c7efa6b0eb651d365c6056730aa1c67700b7fea2e8bd2 ti-fs-firmware-am62x-gp.bin
> +sha256 9ed6089ca7d59e9e5919b0da92effe788138edef41682e0bf7eaea25a896a4f1 ti-fs-firmware-am62x-hs-cert.bin
> +sha256 655b5ded62b63f26c17b3ae2f23ac3565ae91fbd7fba1b7b0a4cb7807467523b ti-fs-firmware-am62x-hs-enc.bin
> +sha256 5efa229acd122685fa928170a3f2e39597cce0231fca10b03d9b4d519db2259f ti-fs-firmware-am62x-hs-fs-cert.bin
> +sha256 0f49da5e616a95dc8573531799d20fa7697a000f88084d09f3f6f5a665d85680 ti-fs-firmware-am62x-hs-fs-enc.bin
> +
> +sha256 958fdb0613a1dc3a5cb90edf35b84981b94bd70de6255cdf5f220bce2a4b10ef ti-sci-firmware-am64x-gp.bin
> +sha256 cfee8679183577392b513b317a4d9a6af47cde9a59ecbad758704e4bec38196c ti-sci-firmware-am64x-hs-cert.bin
> +sha256 8760b70cc18cd5921d634ce226122aed5a28d64857d90f6ede40f2383dabd169 ti-sci-firmware-am64x-hs-enc.bin
> +sha256 1e78b106a8c7acd1641863ef86946e0d7272ad9b2d0e7ce451936d36a14e70e7 ti-sci-firmware-am64x_sr2-hs-cert.bin
> +sha256 c626bacd4abfbe4de1133b72568394a2e20dbe9a1623a3e77bae9f000e743bb4 ti-sci-firmware-am64x_sr2-hs-enc.bin
> +sha256 1d48d758d9ed940fe4072bd5b024ec502c72782ce2ca1c085f043f104a62ca70 ti-sci-firmware-am64x_sr2-hs-fs-cert.bin
> +sha256 1b22ba9ab5b94a9942e1f9c203b81733030c8bf4543a0aefffd200876a0c66eb ti-sci-firmware-am64x_sr2-hs-fs-enc.bin
> diff --git a/boot/ti-k3-image-gen/ti-k3-image-gen.mk b/boot/ti-k3-image-gen/ti-k3-image-gen.mk
> new file mode 100644
> index 0000000000..b624f93771
> --- /dev/null
> +++ b/boot/ti-k3-image-gen/ti-k3-image-gen.mk
> @@ -0,0 +1,81 @@
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

There are a bunch of python scripts, so you probably also need
$(BR2_PYTHON3_HOST_DEPENDENCY) as a dependency.

> +ifeq ($(BR2_TARGET_TI_K3_IMAGE_GEN_FW_TYPE_TIFS),y)
> +TI_K3_IMAGE_GEN_FW_TYPE = $(call qstrip,"ti-fs")

No need to call qstrip on a constant; just use the unquoted constant to
begin with:

    TI_K3_IMAGE_GEN_FW_TYPE = ti-fs

But see below...

> +else ifeq ($(BR2_TARGET_TI_K3_IMAGE_GEN_FW_TYPE_TISCI),y)
> +TI_K3_IMAGE_GEN_FW_TYPE = $(call qstrip,"ti-sci")
> +else
> +$(error No TI K3 Image Gen firmware type set)

That can't be possible, as this is a choice: exactly one entry in a
choice will be enabled. No less, no more.

> +endif

Much simpler with the kconfig option:
    TI_K3_IMAGE_GEN_FW_TYPE = $(call qstrip,$(BR2_TARGET_TI_K3_IMAGE_GEN_FW_TYPE))

> +TI_K3_IMAGE_GEN_SOC = $(call qstrip,$(BR2_TARGET_TI_K3_IMAGE_GEN_SOC))
> +
> +ifeq ($(BR2_TARGET_TI_K3_IMAGE_GEN_SOC_TYPE_GP),y)
> +TI_K3_IMAGE_GEN_SOC_TYPE = $(call qstrip,"gp")
> +else ifeq ($(BR2_TARGET_TI_K3_IMAGE_GEN_SOC_TYPE_HS_FS),y)
> +TI_K3_IMAGE_GEN_SOC_TYPE = $(call qstrip,"hs-fs")
> +else ifeq ($(BR2_TARGET_TI_K3_IMAGE_GEN_SOC_TYPE_HS_SE),y)
> +TI_K3_IMAGE_GEN_SOC_TYPE = $(call qstrip,"hs")
> +else
> +$(error No TI K3 Image Gen SoC security type set)
> +endif

Much simpler now with the Kconfig option:

    TI_K3_IMAGE_GEN_SOC_TYPE = $(call qstrip,$(BR2_TARGET_TI_K3_IMAGE_GEN_SOC_TYPE))

> +TI_K3_IMAGE_GEN_CONFIG = $(call qstrip,$(BR2_TARGET_TI_K3_IMAGE_GEN_CONFIG))

Not needed as we're going to make it a constant [1]...

> +# This hash comes from the Makefile in ti-k3-image-gen and corresponds to
> +# FW from Git tag 08.06.00.006
> +TI_K3_SYSFW_VERSION = 340194800a581baf976360386dfc7b5acab8d948

Variables must be scoped to the package name, i.e.:

    TI_K3_IMAGE_GEN_SYSFW_VERSION = 340194800a581baf976360386dfc7b5acab8d948

Why can't we use the tag? It at least seemed to work for me here...

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

I do not like that we download files from another repository. Why can't
we have a separate package, in package/ti-linux-firmware/, that
downloads the firmware files and isntalls the needed ones in
$(TARGET_DIR), which ti-k3-image-gen can then grab at will?

We have linux-firmware, rpi-firmware, ambian-firmware, wilc-firmware,
and quite a few others, which sole responsibility is to idneed just
git-clone or wget a firmware package and isntall blobs in $(TARGET_DIR).

> +
> +define TI_K3_SYSFW_COPY
> +	$(foreach f,$(TI_K3_SYSFW_SOURCE), \
> +		cp $(TI_K3_IMAGE_GEN_DL_DIR)/$(f) $(@D)$(sep))
> +endef
> +TI_K3_IMAGE_GEN_POST_EXTRACT_HOOKS += TI_K3_SYSFW_COPY
> +
> +# The ti-k3-image-gen makefiles seem to need some feature from Make v4.0,
> +# similar to u-boot. Explicitly use $(BR2_MAKE) here, as the build
> +# otherwise fails with some misleading error message.
> +TI_K3_IMAGE_GEN_MAKE = $(BR2_MAKE)

Then you also need to add the necessary dependency:

    TI_K3_IMAGE_GEN_DEPENDENCIES = \
        host-arm-gnu-toolchain \
        ti-k3-r5-loader \
        $(BR2_PYTHON3_HOST_DEPENDENCY) \
        $(BR2_MAKE_HOST_DEPENDENCY)

But here is no need for TI_K3_IMAGE_GEN_MAKE, [2]...

> +TI_K3_IMAGE_GEN_MAKE_OPTS = \
> +	SOC=$(TI_K3_IMAGE_GEN_SOC) \
> +	SOC_TYPE=$(TI_K3_IMAGE_GEN_SOC_TYPE) \
> +	CONFIG=$(TI_K3_IMAGE_GEN_CONFIG) \

[1] here: CONFIG=evm

> +	CROSS_COMPILE=$(HOST_DIR)/bin/arm-none-eabi- \
> +	SBL=$(BINARIES_DIR)/r5-u-boot-spl.bin \
> +	O=$(@D)/tmp \
> +	BIN_DIR=$(@D)
> +
> +define TI_K3_IMAGE_GEN_BUILD_CMDS
> +	$(TI_K3_IMAGE_GEN_MAKE) -C $(@D) $(TI_K3_IMAGE_GEN_MAKE_OPTS)

[2] just use $(BR2_MAKE) here.

[0] Yes, there is a discrepancy due to c3568d58f8ea (package/freescale-imx:
add option for i.MX8X) which forgot to add the corresponding entry for
BR2_PACKAGE_FREESCALE_IMX_PLATFORM...

Regards,
Yann E. MORIN.

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
