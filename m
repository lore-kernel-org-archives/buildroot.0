Return-Path: <SRS0=OlWD=PF=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A00CC433EF
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 20:22:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2CD1A60F59
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 20:22:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2CD1A60F59
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 077D04029E;
	Sun, 17 Oct 2021 20:22:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3He--9g8h0yi; Sun, 17 Oct 2021 20:22:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 589144029B;
	Sun, 17 Oct 2021 20:22:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 510C21BF593
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 20:22:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4DC4040297
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 20:22:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kSzgNSmnm_GJ for <buildroot@lists.busybox.net>;
 Sun, 17 Oct 2021 20:22:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7AE164029B
 for <buildroot@buildroot.org>; Sun, 17 Oct 2021 20:22:32 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4430:5ced:ec21:1036])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id B90827802C2;
 Sun, 17 Oct 2021 22:22:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1634502151;
 bh=kQdIoxG9J/PfZifhco8BdI6Pi5myOkhG62G/eZSUjSg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=L+1vZbGmxBZ0XKr9+k8kydFz3FXkFIc15TN/rOVM/p5OwX+ZnSBP/qjI3J2x1l7yc
 uJLBirKYy7BmuoIl6vIaEPP722rFU0CEEJZNWd1dhlHo1/5w8CQQEHqN4ECOchJGgj
 ouA/f7l5X4t0c9Fm8+390sdV2cRUgk5XFAkiISmkrwunPyyJsov0ZkM/0xI2JBW6wQ
 o6x5ZfzkMv8WpXiJO1etdBrUzISM3rfGB7A78XVKgbNEfN29Lrp9bVBWSRmpuTQ7LS
 eFPXAKzmt+UzjbVcMKywQgKorvddP8dWrWTjHygiuOlVYpZ3piU+SUO5FtrZvrdqH7
 KAq9kSXGH1lMA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 17 Oct 2021 22:22:20 +0200
Date: Sun, 17 Oct 2021 22:22:20 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20211017202220.GO2400@scaer>
References: <20210921202137.7092-1-ps.report@gmx.net>
 <20210921202137.7092-4-ps.report@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210921202137.7092-4-ps.report@gmx.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v5 4/6] package/rpi-firmware: add option for
 the debug set of start/fixup boot files
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
Cc: Martin Bark <martin@barkynet.com>, Arthur Courtel <arthur.courtel@smile.fr>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All,

On 2021-09-21 22:21 +0200, Peter Seiderer spake thusly:
> Add option for the debug set of start/fixup boot files.
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> Changes v1 -> v2:
>   - new patch
> 
> Changes v2 -> v3:
>   - adjust to one-assignment style
> 
> Changes v3 -> v4:
>   - no changes
> 
> Changes v4 -> v5:
>   - rebased
> ---
>  package/rpi-firmware/Config.in       | 10 ++++++++++
>  package/rpi-firmware/rpi-firmware.mk |  4 +++-
>  2 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/package/rpi-firmware/Config.in b/package/rpi-firmware/Config.in
> index 9e401829c6..f9fc0b0e5e 100644
> --- a/package/rpi-firmware/Config.in
> +++ b/package/rpi-firmware/Config.in
> @@ -35,6 +35,11 @@ config BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI_CD
>  	  The cut-down set of files for versions Zero/1/2/3 (only
>  	  features required to boot a Linux kernel).
>  
> +config BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI_DB
> +	bool "rpi 0/1/2/3 (debug)"
> +	help
> +	  The debug set of files for versions Zero/1/2/3.
> +
>  config BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4
>  	bool "rpi 4 (default)"
>  	help
> @@ -53,6 +58,11 @@ config BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4_CD
>  	  The cut-down set of files for versions 4 (only features
>  	  required to boot a Linux kernel).
>  
> +config BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4_DB
> +	bool "rpi 4 (debug)"
> +	help
> +	  The debug set of files for versions 4.
> +
>  config BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE
>  	string "Path to a file stored as boot/config.txt"
>  	help
> diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
> index 38a84100e9..f9568ba50f 100644
> --- a/package/rpi-firmware/rpi-firmware.mk
> +++ b/package/rpi-firmware/rpi-firmware.mk
> @@ -15,9 +15,11 @@ RPI_FIRMWARE_FILES = \
>  	$(if $(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI), start.elf fixup.dat) \
>  	$(if $(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI_X), startx.elf fixupx.dat) \
>  	$(if $(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI_CD), start_cd.elf fixup_cd.dat) \
> +	$(if $(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI_DB), start_db.elf fixup_db.dat) \
>  	$(if $(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4), start4.elf fixup4.dat) \
>  	$(if $(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4_X), start4x.elf fixup4x.dat) \
> -	$(if $(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4_CD), start4cd.elf fixup4cd.dat)
> +	$(if $(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4_CD), start4cd.elf fixup4cd.dat) \
> +	$(if $(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4_DB), start4db.elf fixup4db.dat)
>  
>  define RPI_FIRMWARE_INSTALL_BIN
>  	$(foreach f,$(RPI_FIRMWARE_FILES), \
> -- 
> 2.33.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@lists.buildroot.org
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
