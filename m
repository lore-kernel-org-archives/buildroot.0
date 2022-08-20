Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E54BC25B08
	for <buildroot@archiver.kernel.org>; Sat, 20 Aug 2022 15:12:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C206D4098F;
	Sat, 20 Aug 2022 15:12:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C206D4098F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xvSzT8Ty7Xvd; Sat, 20 Aug 2022 15:12:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C8B1040490;
	Sat, 20 Aug 2022 15:12:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C8B1040490
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8B2BA1BF2CA
 for <buildroot@lists.busybox.net>; Sat, 20 Aug 2022 15:12:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7293540490
 for <buildroot@lists.busybox.net>; Sat, 20 Aug 2022 15:12:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7293540490
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FSTLy2fxhzvI for <buildroot@lists.busybox.net>;
 Sat, 20 Aug 2022 15:12:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 582E1401ED
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 582E1401ED
 for <buildroot@buildroot.org>; Sat, 20 Aug 2022 15:12:52 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:18c4:2559:c4a2:6528])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 1A3505FFB7;
 Sat, 20 Aug 2022 17:12:43 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 20 Aug 2022 17:12:43 +0200
Date: Sat, 20 Aug 2022 17:12:43 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Neal Frager <neal.frager@xilinx.com>
Message-ID: <20220820151243.GM2167049@scaer>
References: <20220819063717.33591-1-neal.frager@xilinx.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220819063717.33591-1-neal.frager@xilinx.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1661008369;
 bh=HaqOvbVmN55dQwv5ztKOoCE4n4tsgVjGJGIPKngPKt8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=I4uQkjuFg91OhawMkAWmbwlTI94CoUO/NzQCQugNzxM+/8YZSaDVh2s+6FTOnw1os
 rRwYvg3SMYs+UwjjGczQ6kybqCShOlDvReD8giKYzXPnrMkgrBe751L9E3kJ1Luqrc
 oCAb2PBsVU8T/3BrzAXXxN7Mz8114UkJj8fzH8b1wODu0AZvKULvOK2XExQoZ7n406
 PFHu9X5DUCciFPAMf39xYvH06WN2IXChVwxmILa86OemKqnb2KxV5kzuJ6IWHYNHt8
 jZGDz7AXsFbj+FceypVKzUCJLrhqKv30zvPQciIQezL3GfFkcXLy2nlxwOd3744vHv
 1+ErHqJTNI7Xg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=I4uQkjuF
Subject: Re: [Buildroot] [PATCH v1 1/3] add package/versal-firmware
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
Cc: luca.ceresoli@bootlin.com, michal.simek@amd.com,
 thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Neal, All,

On 2022-08-19 00:37 -0600, Neal Frager spake thusly:
> This patch adds support for downloading versal firmware binaries.
> These are necessary for booting Xilinx versal devices.
[--SNIP--]
> diff --git a/package/versal-firmware/Config.in b/package/versal-firmware/Config.in
> new file mode 100644
> index 0000000000..9ca46b1d16
> --- /dev/null
> +++ b/package/versal-firmware/Config.in
> @@ -0,0 +1,32 @@
> +config BR2_PACKAGE_VERSAL_FIRMWARE
> +	bool "versal-firmware"
> +	depends on BR2_aarch64
> +	help
> +	  Versal Firmware
> +
> +	  Pre-built binaries of the current bootloader firmware
> +
> +	  https://github.com/nealfrager/versal_boot

This looks like your personal git tree, not the official one. (Yeah, I
noticed your email address, but I would still have expected something
under https://github.com/Xilinx/).

The official images are there:
    https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/18842316/Linux+Prebuilt+Images
    https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/2347204609/2022.1+Release

If one tries to download any resource from there, they are redirected
to a login screen, e.g.:
    https://login.xilinx.com/app/xilinxinc_f5awsprod_1/exknv8ms950lm0Ldh0x7/sso/saml

The licensing information is not clearly detailed in the portal, and
being low-level firmware files, I'm afraid there might be restrictions
on the redistribution og those files...

> +if BR2_PACKAGE_VERSAL_FIRMWARE
> +
> +config BR2_PACKAGE_VERSAL_FIRMWARE_LOCATION
> +	string "versal firmware location"

The prompt should be "Custom git repository"

> +	help
> +	  Location of a versal firmware boot.bin.
> +
> +	  The value should be a git repository.

So, there is not even a default location?

> +config BR2_PACKAGE_VERSAL_FIRMWARE_BOARD
> +	string "versal board name"
> +	help
> +	  Name of versal target board.
> +
> +	  Used for installing the appropriate firmware boot.bin.
> 
> +config BR2_PACKAGE_VERSAL_FIRMWARE_VERSION
> +	string "versal firmware version"
> +	help
> +	  Release version of versal firmware.

The version entry should be just after the git tree entry.

> +endif # BR2_PACKAGE_VERSAL_FIRMWARE
> diff --git a/package/versal-firmware/versal-firmware.mk b/package/versal-firmware/versal-firmware.mk
> new file mode 100644
> index 0000000000..b465b2bd83
> --- /dev/null
> +++ b/package/versal-firmware/versal-firmware.mk
> @@ -0,0 +1,25 @@
> +################################################################################
> +#
> +# versal-firmware
> +#
> +################################################################################
> +
> +VERSAL_FIRMWARE_VERSION = $(call qstrip,$(BR2_PACKAGE_VERSAL_FIRMWARE_VERSION))
> +VERSAL_FIRMWARE_SITE = $(BR2_PACKAGE_VERSAL_FIRMWARE_LOCATION)
> +
> +VERSAL_FIRMWARE_INSTALL_IMAGES = YES
> +
> +VERSAL_FIRMWARE_FILES = \
> +	$(if $(BR2_PACKAGE_VERSAL_FIRMWARE), boot.bin)

This does not make sense: if the versal-firmware package is not enabled,
then it will not be installed, so there is no need to condition some
variables/values to the package being enabled or not.

> +define VERSAL_FIRMWARE_INSTALL_BIN
> +	$(foreach f,$(VERSAL_FIRMWARE_FILES), \
> +		$(INSTALL) -D -m 0644 $(@D)/$(BR2_PACKAGE_VERSAL_FIRMWARE_BOARD)/$(f) $(BINARIES_DIR)/$(f)

VERSAL_FIRMWARE_FILES is only ever one item, boot.bin, the loop will
always be on one item, so there is no need for the loop.

Also, no need for a seaprate macro; just add this code to
VERSAL_FIRMWARE_INSTALL_IMAGES_CMDS.

In the end, I don't think we should apply this package, as it looks like
it tries to circumvent the official distrobution restrictions on these
firmware files.

Regards,
Yann E. MORIN.

> +	)
> +endef
> +
> +define VERSAL_FIRMWARE_INSTALL_IMAGES_CMDS
> +	$(VERSAL_FIRMWARE_INSTALL_BIN)
> +endef
> +
> +$(eval $(generic-package))
> -- 
> 2.17.1
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
