Return-Path: <SRS0=IJqM=OO=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A2BCC433EF
	for <buildroot@archiver.kernel.org>; Fri, 24 Sep 2021 20:04:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1463D61107
	for <buildroot@archiver.kernel.org>; Fri, 24 Sep 2021 20:04:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1463D61107
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8B1D40475;
	Fri, 24 Sep 2021 20:04:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oaTQrfrDDqH0; Fri, 24 Sep 2021 20:04:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12791404A3;
	Fri, 24 Sep 2021 20:04:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 915D81BF86C
 for <buildroot@lists.busybox.net>; Fri, 24 Sep 2021 20:04:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7D3DD404A3
 for <buildroot@lists.busybox.net>; Fri, 24 Sep 2021 20:04:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cOxss6AyoB38 for <buildroot@lists.busybox.net>;
 Fri, 24 Sep 2021 20:04:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 88AE440475
 for <buildroot@buildroot.org>; Fri, 24 Sep 2021 20:04:33 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:e5cb:5ead:8e76:4901])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 85DD47802E5;
 Fri, 24 Sep 2021 22:04:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1632513871;
 bh=/om8S8r5Q0ElaTiThjT+P61BSnFRDRsUL1Lvzcbaggs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cUfXnIs41HRWsiCJfd5vkZmbXtrtc1c8TCje4nTGExe0Ba1ug1z+VwJHBP8KLlaTt
 RhnuVvwF6kBfryuhnu5yncZinrLTuKQZBzTCvwGZVySkZgwPQvJ0yMzLferZoMlu9b
 sHDaVjcIKhj6UJ7KozxZNJ8PdV7WcX6hO3tbq8rsxZn0fSZrNDmNzC3FHJhl52PyAe
 8uuEnX03kkHXvrmumnhF3WPeVaTahATthIm1yR2c3luv/m046MYybLhewJQmtY3bV1
 dYkKHDTWOFP1BqfbVA4FGrVkS8K96PVKmKyJUrTycusuK/ehlYDk8aISLVzaFhEkyz
 gpnze5DPxHWuw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 24 Sep 2021 22:04:27 +0200
Date: Fri, 24 Sep 2021 22:04:27 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20210924200427.GH3176@scaer>
References: <20210923212831.391084-1-romain.naour@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210923212831.391084-1-romain.naour@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] boot/syslinux: add missing python dependency
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

Romain, All,

On 2021-09-23 23:28 +0200, Romain Naour spake thusly:
> Syslinux use some python scripts during the build and they
> are using python interpreter by default. It fail to build
> when there is no python interpreter on the host.
> 
> [...]/syslinux-6.03/com32/cmenu/menugen.py
> make[6]: python: No such file or directory
> 
> Since Syslinux 5.00, we can override the python interpreter
> used during the build:
> 
> https://repo.or.cz/syslinux.git/commitdiff/4dec62ce9c2c0d170f21b3ae2d7c618eb7a30c05
> 
> Add the	missing	host-python3 dependency and override
> it in SYSLINUX_BUILD_CMDS.
> 
> Fixes:
> https://gitlab.com/kubu93/buildroot/-/jobs/1614446766
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  boot/syslinux/syslinux.mk | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/boot/syslinux/syslinux.mk b/boot/syslinux/syslinux.mk
> index 67bc69254e..77bacca9a3 100644
> --- a/boot/syslinux/syslinux.mk
> +++ b/boot/syslinux/syslinux.mk
> @@ -14,7 +14,12 @@ SYSLINUX_LICENSE_FILES = COPYING
>  SYSLINUX_INSTALL_IMAGES = YES
>  
>  # host-util-linux needed to provide libuuid when building host tools
> -SYSLINUX_DEPENDENCIES = host-nasm host-upx util-linux host-util-linux
> +SYSLINUX_DEPENDENCIES = \
> +	host-nasm \
> +	host-python3 \
> +	host-upx \
> +	host-util-linux \
> +	util-linux \

    $ make check-package
    boot/syslinux/syslinux.mk:22: remove trailing backslash

Applied to master with the above fixed, thanks.

Regards,
Yann E. MORIN.

>  ifeq ($(BR2_TARGET_SYSLINUX_LEGACY_BIOS),y)
>  SYSLINUX_TARGET += bios
> @@ -59,6 +64,7 @@ define SYSLINUX_BUILD_CMDS
>  		CC_FOR_BUILD="$(HOSTCC)" \
>  		CFLAGS_FOR_BUILD="$(HOST_CFLAGS)" \
>  		LDFLAGS_FOR_BUILD="$(HOST_LDFLAGS)" \
> +		PYTHON=$(HOST_DIR)/bin/python3 \
>  		$(SYSLINUX_EFI_ARGS) -C $(@D) $(SYSLINUX_TARGET)
>  endef
>  
> -- 
> 2.31.1
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
