Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24F3CC77B75
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 19:29:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C644A81F9B;
	Sun,  7 May 2023 19:29:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C644A81F9B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t7wI9I9r0ACA; Sun,  7 May 2023 19:29:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C04BF80B1F;
	Sun,  7 May 2023 19:29:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C04BF80B1F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 478141BF2CD
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 19:29:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 176E541715
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 19:29:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 176E541715
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QRLaWXHU0Mat for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 19:29:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 80232416F5
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 80232416F5
 for <buildroot@buildroot.org>; Sun,  7 May 2023 19:29:26 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:5f9f:2ea:ec9d:3930])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 4F84619F4B5;
 Sun,  7 May 2023 21:29:19 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 07 May 2023 21:29:19 +0200
Date: Sun, 7 May 2023 21:29:19 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Alistair Francis <alistair23@gmail.com>
Message-ID: <20230507192919.GI252090@scaer>
References: <20230503023711.586439-1-alistair.francis@wdc.com>
 <20230503023711.586439-2-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230503023711.586439-2-alistair.francis@wdc.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683487763;
 bh=Eq9Mi1B3hVUwU4keXwO8fLBY5ANERR+VwdqeycL1r8c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DMVBz5HFBG25S32ZznVrM4OI8L/jVP4bNOOBGY0IhDPRTPqs9sgQrZO8fdZRI/ozB
 YJ9YJtne1iX3L4SF5SjeFhdtduq5jCHdskYUyrU+YFjCZm8kezPlen1gSU+TmxtuVw
 Bl2+oiEEdhoyeeA8mRszOduqTbdIVLPmqawEr5gQGA7GHk4LH14AwaXwD/L8CwbvPi
 kKaQQklUtaWm2HxK6Eru2bhkyf/TP1iSBz4SBkrNt2q5wKQfzwX2tg84KIxrKMRXhD
 mguIBsO4y1EN1WWiWCDBzJM0diJCFrPiSBb+b43svEYUnPxFpXigC0QDMUYsIVdfPZ
 PB9LybG49ejwQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=DMVBz5HF
Subject: Re: [Buildroot] [PATCH 2/2] boot/opensbi: Allow a custom device
 tree path
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
Cc: Alistair Francis <alistair@alistair23.me>,
 Alistair Francis <alistair.francis@wdc.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Alistair, All,

On 2023-05-03 12:37 +1000, Alistair Francis spake thusly:
> Instead of hardcoding the u-boot device tree, allow the user to use a
> custom device tree.
> 
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  boot/opensbi/Config.in  | 16 ++++++++++------
>  boot/opensbi/opensbi.mk |  5 +++--
>  2 files changed, 13 insertions(+), 8 deletions(-)
> 
> diff --git a/boot/opensbi/Config.in b/boot/opensbi/Config.in
> index 5e6b8d158e..62d0c5a56b 100644
> --- a/boot/opensbi/Config.in
> +++ b/boot/opensbi/Config.in
> @@ -109,15 +109,19 @@ config BR2_TARGET_OPENSBI_UBOOT_PAYLOAD
>  	help
>  	  Build OpenSBI with the U-Boot as a Payload.
>  
> +config BR2_TARGET_OPENSBI_FW_FDT_PAYLOAD
> +	bool "Install fw_fdt binary"
> +	help
> +	  This option enables the installation of the fw_fdt
> +	  binary.
> +
>  config BR2_TARGET_OPENSBI_FW_FDT_PATH
> -	bool "Include U-Boot DTB in OpenSBI Payload"
> -	depends on BR2_TARGET_OPENSBI_UBOOT_PAYLOAD
> -	select BR2_TARGET_UBOOT_FORMAT_DTB
> +	string "Include DTB in OpenSBI Payload"
> +	default "$(BINARIES_DIR)/u-boot.dtb"
> +	depends on BR2_TARGET_OPENSBI_FW_FDT_PAYLOAD

With this change, configurations that had BR2_TARGET_OPENSBI_FW_FDT_PATH
set to 'y' will no longer have it set at all, because its type changed.
And BR2_TARGET_OPENSBI_FW_FDT_PAYLOAD will also not be set, because it
is a new config option. So this changes the behaviour for a previously
working config.

I am not sure this is nice, but there is not easy other way. And I agree
that the name of the existing option (ending in _PATH when it is just a
boolean) is going to be confusing...

Also, this has to be a dtb (device Tree Blob), not a dts, so the user
would have to provide an already compiled dtb. That's not very nice...

Can we make that better? Here's my proposal (but it might be a bit
overkill):

    choice
        bool "Deice Tree to include in OpenSBI Payload"

    config BR2_TARGET_OPENSBI_FW_FDT_NONE
        bool "none

    config BR2_TARGET_OPENSBI_FW_FDT_PATH
        bool "U-Boot DTB"
        depends on BR2_TARGET_OPENSBI_UBOOT_PAYLOAD
        select BR2_TARGET_UBOOT_FORMAT_DTB

    config BR2_TARGET_OPENSBI_FW_FDT_CUSTOM_DTS
        bool "custom DTS"

    config BR2_TARGET_OPENSBI_FW_FDT_CUSTOM_DTB
        bool "custom DTB"

    endchoice

    config BR2_TARGET_OPENSBI_FW_FDT_CUSTOM_DTS_PATH
        string "custom DTS path"
        deepends on BR2_TARGET_OPENSBI_FW_FDT_CUSTOM_DTS

    config BR2_TARGET_OPENSBI_FW_FDT_CUSTOM_DTB_PATH
        string "custom DTB path"
        deepends on BR2_TARGET_OPENSBI_FW_FDT_CUSTOM_DTB

(but maybe that's really overkill, please apply common sense if you want
to reuse the above)

Regards,
Yann E. MORIN.

>  	help
>  	  Build OpenSBI with FW_FDT_PATH set to
> -	  $(BINARIES_DIR)/u-boot.dtb. Note that CONFIG_OF_SEPARATE
> -	  must be set in the U-Boot configuration for this file to be
> -	  produced.
> +	  $(BR2_TARGET_OPENSBI_FW_FDT_PATH).
>  
>  config BR2_TARGET_OPENSBI_ADDITIONAL_VARIABLES
>  	string "Additional build variables"
> diff --git a/boot/opensbi/opensbi.mk b/boot/opensbi/opensbi.mk
> index dd113a0bf8..919270aec7 100644
> --- a/boot/opensbi/opensbi.mk
> +++ b/boot/opensbi/opensbi.mk
> @@ -47,9 +47,10 @@ endif
>  ifeq ($(BR2_TARGET_OPENSBI_UBOOT_PAYLOAD),y)
>  OPENSBI_DEPENDENCIES += uboot
>  OPENSBI_MAKE_ENV += FW_PAYLOAD_PATH="$(BINARIES_DIR)/u-boot.bin"
> -ifeq ($(BR2_TARGET_OPENSBI_FW_FDT_PATH),y)
> -OPENSBI_MAKE_ENV += FW_FDT_PATH="$(BINARIES_DIR)/u-boot.dtb"
>  endif
> +
> +ifeq ($(BR2_TARGET_OPENSBI_FW_FDT_PAYLOAD),y)
> +OPENSBI_MAKE_ENV += FW_FDT_PATH="$(BR2_TARGET_OPENSBI_FW_FDT_PATH)"
>  endif
>  
>  define OPENSBI_BUILD_CMDS
> -- 
> 2.39.2
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
