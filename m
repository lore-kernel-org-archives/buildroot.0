Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1377FA3740
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 12:13:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D86D415F0;
	Mon, 31 Oct 2022 12:13:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D86D415F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BaT9BKNB7yJ2; Mon, 31 Oct 2022 12:13:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35D7040929;
	Mon, 31 Oct 2022 12:13:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35D7040929
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 89C001BF417
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 12:13:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6500D40894
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 12:13:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6500D40894
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hUAicTx36Aje for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 12:13:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3BDBA40880
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3BDBA40880
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 12:13:32 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:afdc:c5f1:f1be:8b47])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 52E42B00572;
 Mon, 31 Oct 2022 13:13:27 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 31 Oct 2022 13:13:26 +0100
Date: Mon, 31 Oct 2022 13:13:26 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Message-ID: <20221031121326.GA1058960@scaer>
References: <20220724131202.1364133-1-yann.morin.1998@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220724131202.1364133-1-yann.morin.1998@free.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1667218409;
 bh=eD9AtE2NHoZkU6icQFiDdL/OYJ2gEdp0Ajgh53JtiZA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QWqlcYf08guAP0qrmtehYAcqHnPY0xSyYvxjbPuUYqLQ3WbJuIaQHrWdNeeRya60g
 7x1xuq8OGnfTIE1TERvufB7SYs1rU5H4/zAD1DJPehEOeg4hB6as05TqcuE+WSSBjF
 MicL705phSSt/GfvRbDYwgDjYutvoiiWotKzRGzCJgWz5n4e3s05Q9sG269oQZUxZ6
 biVb/Tcp2gS9DQn8duQSr9WlFe9ShDJPtgKHsJft27UHtMbsGPu6pw2dM2foqBFg0w
 9kG24wXXXo8nBh3qb+280yKUcqbqedVTkMyXPOsWdsdgFYkO+VKPkPUo3K95Eykxb6
 84yQ38DVdIzag==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=QWqlcYf0
Subject: Re: [Buildroot] [PATCH] package/rpi-firmware: add option to use
 custom cmdline.txt
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
Cc: Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

All,

On 2022-07-24 15:12 +0200, Yann E. MORIN spake thusly:
> Currently, the cmdline.txt file is installed in $(BINARIES_DIR) by the
> rpi-firmware package. Overriding files in there can not be done with an
> overlay (which only applies to $(TARGET_DIR)), and thus requires using
> either a post-build or post-image script, which is not always very
> practical when a custom file must be used.
> 
> Like was done in 689b9ac439ab (package/rpi-firmware: rework boot/config
> file handling) for config.txt, add an option to allow users to specify
> the path to a custom cmdline.txt.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Peter Seiderer <ps.report@gmx.net>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  .../rpi-firmware => board/raspberrypi}/cmdline.txt     |  0
>  package/rpi-firmware/Config.in                         |  7 +++++++
>  package/rpi-firmware/rpi-firmware.mk                   | 10 +++++++++-
>  3 files changed, 16 insertions(+), 1 deletion(-)
>  rename {package/rpi-firmware => board/raspberrypi}/cmdline.txt (100%)
> 
> diff --git a/package/rpi-firmware/cmdline.txt b/board/raspberrypi/cmdline.txt
> similarity index 100%
> rename from package/rpi-firmware/cmdline.txt
> rename to board/raspberrypi/cmdline.txt
> diff --git a/package/rpi-firmware/Config.in b/package/rpi-firmware/Config.in
> index 8070dc3019..a9aeaed745 100644
> --- a/package/rpi-firmware/Config.in
> +++ b/package/rpi-firmware/Config.in
> @@ -69,6 +69,13 @@ config BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE
>  	  Path to a file stored as config.txt in the boot partiton
>  	  of the generated SD card image.
>  
> +config BR2_PACKAGE_RPI_FIRMWARE_CMDLINE_FILE
> +	string "Path to a file stored as boot/cmdline.txt"
> +	default "board/raspberrypi/cmdline.txt"  # legacy
> +	help
> +	  Path to a file stored as cmdline.txt in the boot partiton
> +	  of the generated SD card image.
> +
>  config BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS
>  	bool "Install Device Tree Blobs (DTBs)"
>  	default y
> diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
> index d4d1d07b3f..6f5902fd52 100644
> --- a/package/rpi-firmware/rpi-firmware.mk
> +++ b/package/rpi-firmware/rpi-firmware.mk
> @@ -35,6 +35,14 @@ define RPI_FIRMWARE_INSTALL_CONFIG
>  endef
>  endif
>  
> +RPI_FIRMWARE_CMDLINE_FILE = $(call qstrip,$(BR2_PACKAGE_RPI_FIRMWARE_CMDLINE_FILE))
> +ifneq ($(RPI_FIRMWARE_CMDLINE_FILE),)
> +define RPI_FIRMWARE_INSTALL_CMDLINE
> +	$(INSTALL) -D -m 0644 $(RPI_FIRMWARE_CMDLINE_FILE) \
> +		$(BINARIES_DIR)/rpi-firmware/cmdline.txt
> +endef
> +endif
> +
>  ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS),y)
>  define RPI_FIRMWARE_INSTALL_DTB
>  	$(foreach dtb,$(wildcard $(@D)/boot/*.dtb), \
> @@ -79,9 +87,9 @@ endef
>  endif # INSTALL_VCDBG
>  
>  define RPI_FIRMWARE_INSTALL_IMAGES_CMDS
> -	$(INSTALL) -D -m 0644 package/rpi-firmware/cmdline.txt $(BINARIES_DIR)/rpi-firmware/cmdline.txt
>  	$(RPI_FIRMWARE_INSTALL_BIN)
>  	$(RPI_FIRMWARE_INSTALL_CONFIG)
> +	$(RPI_FIRMWARE_INSTALL_CMDLINE)
>  	$(RPI_FIRMWARE_INSTALL_DTB)
>  	$(RPI_FIRMWARE_INSTALL_DTB_OVERLAYS)
>  endef
> -- 
> 2.25.1
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
