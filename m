Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EC16C4332F
	for <buildroot@archiver.kernel.org>; Wed, 21 Dec 2022 09:49:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC1D94085D;
	Wed, 21 Dec 2022 09:49:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC1D94085D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L-4gP1lXLJtm; Wed, 21 Dec 2022 09:49:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5E5D4175A;
	Wed, 21 Dec 2022 09:49:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5E5D4175A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2369B1BF2A1
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 09:49:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8B66060AE6
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 09:48:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B66060AE6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o0jx861ey1ZO for <buildroot@lists.busybox.net>;
 Wed, 21 Dec 2022 09:48:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DEC2260ACF
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DEC2260ACF
 for <buildroot@buildroot.org>; Wed, 21 Dec 2022 09:48:57 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:a2ac:472c:b44e:1236])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 1905D78035E;
 Wed, 21 Dec 2022 10:48:48 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 21 Dec 2022 10:48:48 +0100
Date: Wed, 21 Dec 2022 10:48:48 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Christian Hitz <christian@klarinett.li>
Message-ID: <20221221094848.GJ2909@scaer>
References: <20221220133454.1931855-1-christian@klarinett.li>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221220133454.1931855-1-christian@klarinett.li>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1671616134;
 bh=pgCotnJFxGib8+tmarGQ/ll197grqYuSAO22IM2ubGM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=McGiTtTFtTOBjsog89Pnp1Az0fE7m89+0nNdhV2V11DmJlFHNRirfn94RjFaJKzra
 6Iu7OnrZa/ViAehTaUGOpiY3ulApZlopc5RbfxpcYB94kAscyhuOtafJ9V278KGNr5
 IW74JQb1m/k/v3qwL3/3x2faa+kiSyWjhOUjVBJC7i5tKQtjNjrYf4YM6IFO2cCjAU
 rI+jN8w0RYohmvm6ibjAJJ6pNWhQe1d/H6eCfB7jbWcvDEfSBeud83wAKZX5wS6lna
 OyfzH1Fk5O7Z7sGRo/zXlX0CbVPdSTo35E4kAJKKGFM6MC15Ovq1fHUFLXytkHJ+/S
 GUi7IZ6I06ozQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=McGiTtTF
Subject: Re: [Buildroot] [PATCH] package/freescale-imx/firmware-imx: fix
 installation with merged usr dirs
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
Cc: Gary Bisson <bisson.gary@gmail.com>, Christian Hitz <christian.hitz@bbv.ch>,
 Refik Tuzakli <tuzakli.refik@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Christian, All,

On 2022-12-20 14:34 +0100, Christian Hitz spake thusly:
> From: Christian Hitz <christian.hitz@bbv.ch>
> 
> Currently, the firmware files are installed to /lib/firmware/imx. With
> BR2_ROOTFS_MERGED_USR=y /lib is replaced with a symlink to /usr/lib
> effectively deleting the installed firmware files.

That does not make sense: the /lib symlink is created by the skeleton,
which is the very first package to be installed, and so all packages to
get to see the symlink. /lib as a directory is never deleted, because it
never existed in the first place.

And indeed, with the current master, so without your patch applied, I
just tried the following defconfig:

    BR2_arm=y
    BR2_TOOLCHAIN_EXTERNAL=y
    BR2_ROOTFS_MERGED_USR=y
    BR2_PACKAGE_FREESCALE_IMX=y
    BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN=y
    BR2_PACKAGE_FIRMWARE_IMX=y

And I do get the firmware file as expected in /usr/lib/firmware:

    $ tar tf images/rootfs.tar |grep firmware |sort
    ./usr/lib/firmware/
    ./usr/lib/firmware/imx/
    ./usr/lib/firmware/imx/easrc/
    ./usr/lib/firmware/imx/easrc/easrc-imx8mn.bin
    ./usr/lib/firmware/imx/sdma/
    ./usr/lib/firmware/imx/sdma/sdma-imx7d.bin

And this is the same files that are installed without merged usr.

Could you provide a defconfig that exhibits the issue, please?

Regards,
Yann E. MORIN.

> Install the firmware files into the /usr/lib/firmware/imx prefix instead.
> 
> Signed-off-by: Christian Hitz <christian.hitz@bbv.ch>
> ---
> Backport to: 2022.02.x, 2022.11.x
> ---
>  .../firmware-imx/firmware-imx.mk              | 29 ++++++++++++-------
>  1 file changed, 18 insertions(+), 11 deletions(-)
> 
> diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
> index 99fe71a91c..2171ce592e 100644
> --- a/package/freescale-imx/firmware-imx/firmware-imx.mk
> +++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
> @@ -128,14 +128,21 @@ define FIRMWARE_IMX_INSTALL_IMAGE_HDMI_FW
>  endef
>  endif
>  
> +# /lib is really /usr/lib with merged /usr, so adjust path
> +ifeq ($(BR2_ROOTFS_MERGED_USR),y)
> +FIRMWARE_IMX_TARGET_LIBRARY_PATH = $(TARGET_DIR)/usr/lib/firmware
> +else
> +FIRMWARE_IMX_TARGET_LIBRARY_PATH = $(TARGET_DIR)/lib/firmware
> +endif
> +
>  #
>  # EASRC firmware
>  #
>  
>  ifeq ($(BR2_PACKAGE_FIRMWARE_IMX_NEEDS_EASRC_FW),y)
>  define FIRMWARE_IMX_INSTALL_TARGET_EASRC_FW
> -	mkdir -p $(TARGET_DIR)/lib/firmware/imx
> -	cp -r $(@D)/firmware/easrc $(TARGET_DIR)/lib/firmware/imx
> +	mkdir -p $(FIRMWARE_IMX_TARGET_LIBRARY_PATH)/imx
> +	cp -r $(@D)/firmware/easrc $(FIRMWARE_IMX_TARGET_LIBRARY_PATH)/imx
>  endef
>  endif
>  
> @@ -145,10 +152,10 @@ endif
>  
>  ifeq ($(BR2_PACKAGE_FIRMWARE_IMX_NEEDS_EPDC_FW),y)
>  define FIRMWARE_IMX_INSTALL_TARGET_EPDC_FW
> -	mkdir -p $(TARGET_DIR)/lib/firmware/imx
> -	cp -r $(@D)/firmware/epdc $(TARGET_DIR)/lib/firmware/imx
> -	mv $(TARGET_DIR)/lib/firmware/imx/epdc/epdc_ED060XH2C1.fw.nonrestricted \
> -		$(TARGET_DIR)/lib/firmware/imx/epdc/epdc_ED060XH2C1.fw
> +	mkdir -p $(FIRMWARE_IMX_TARGET_LIBRARY_PATH)/imx
> +	cp -r $(@D)/firmware/epdc $(FIRMWARE_IMX_TARGET_LIBRARY_PATH)/imx
> +	mv $(FIRMWARE_IMX_TARGET_LIBRARY_PATH)/imx/epdc/epdc_ED060XH2C1.fw.nonrestricted \
> +		$(FIRMWARE_IMX_TARGET_LIBRARY_PATH)/imx/epdc/epdc_ED060XH2C1.fw
>  endef
>  endif
>  
> @@ -159,9 +166,9 @@ endif
>  FIRMWARE_IMX_SDMA_FW_NAME = $(call qstrip,$(BR2_PACKAGE_FIRMWARE_IMX_SDMA_FW_NAME))
>  ifneq ($(FIRMWARE_IMX_SDMA_FW_NAME),)
>  define FIRMWARE_IMX_INSTALL_TARGET_SDMA_FW
> -	mkdir -p $(TARGET_DIR)/lib/firmware/imx/sdma
> +	mkdir -p $(FIRMWARE_IMX_TARGET_LIBRARY_PATH)/imx/sdma
>  	cp -r $(@D)/firmware/sdma/sdma-$(FIRMWARE_IMX_SDMA_FW_NAME)*.bin \
> -	       $(TARGET_DIR)/lib/firmware/imx/sdma/
> +	       $(FIRMWARE_IMX_TARGET_LIBRARY_PATH)/imx/sdma/
>  endef
>  endif
>  
> @@ -172,10 +179,10 @@ endif
>  FIRMWARE_IMX_VPU_FW_NAME = $(call qstrip,$(BR2_PACKAGE_FIRMWARE_IMX_VPU_FW_NAME))
>  ifneq ($(FIRMWARE_IMX_VPU_FW_NAME),)
>  define FIRMWARE_IMX_INSTALL_TARGET_VPU_FW
> -	mkdir -p $(TARGET_DIR)/lib/firmware/vpu
> +	mkdir -p $(FIRMWARE_IMX_TARGET_LIBRARY_PATH)/vpu
>  	for i in $$(find $(@D)/firmware/vpu/vpu_fw_$(FIRMWARE_IMX_VPU_FW_NAME)*.bin); do \
> -		cp $$i $(TARGET_DIR)/lib/firmware/vpu/ ; \
> -		ln -sf vpu/$$(basename $$i) $(TARGET_DIR)/lib/firmware/$$(basename $$i) ; \
> +		cp $$i $(FIRMWARE_IMX_TARGET_LIBRARY_PATH)/vpu/ ; \
> +		ln -sf vpu/$$(basename $$i) $(FIRMWARE_IMX_TARGET_LIBRARY_PATH)/$$(basename $$i) ; \
>  	done
>  endef
>  endif
> -- 
> 2.38.2
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
