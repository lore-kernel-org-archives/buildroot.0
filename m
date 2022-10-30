Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65434C38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 21:23:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0ED4560A90;
	Sun, 30 Oct 2022 21:23:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0ED4560A90
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wjgO9kF-thh8; Sun, 30 Oct 2022 21:23:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C65A605AE;
	Sun, 30 Oct 2022 21:23:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C65A605AE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C8A601BF315
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 21:23:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A4174400DC
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 21:23:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A4174400DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oY_oZiiNbbLG for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 21:23:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A5C7A400CE
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A5C7A400CE
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 21:23:37 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:afdc:c5f1:f1be:8b47])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id F0DE2B0053B;
 Sun, 30 Oct 2022 22:23:33 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 30 Oct 2022 22:23:33 +0100
Date: Sun, 30 Oct 2022 22:23:33 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Angelo Compagnucci <angelo@amarulasolutions.com>
Message-ID: <20221030212333.GI1058960@scaer>
References: <20221014065900.3311604-1-angelo@amarulasolutions.com>
 <20221014065900.3311604-2-angelo@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221014065900.3311604-2-angelo@amarulasolutions.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1667165016;
 bh=InJ2t0k8pSlquStFdizIaYer5RQ+ncUgQTugDZGx19Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=q8p/IEE3/YLPhtAf3eyEzG2jvkpYzeZGfWSvj2n6NPlzLWkfMUAxURq9HCkugRGCm
 9Sr4yQ5lKDOnz10MgYattK9mESWUWvb7y3sMeXxhBW8rX7wM/uF2u9QmAgfYJh4z4U
 5nWQ1vO5IYo8tRoV1Z8EuZQLw3vWxmZPbo7PwPEfuCEioLQpHsmEkLB3Ab6Z2G6RiU
 AroSmKAFh2e8aROT1rp+t5ELDKyEE+QfwsDEff1x3tezvo6NDlMHNiX7c+hDDVnn0h
 FGbzrPGbQvfXkiZlSlbs6M+FSRL1vO9NaCsozbcjVWNfhM4stpfuPRFZWLSv1JQN9n
 IfjiVxqXNv3+A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=q8p/IEE3
Subject: Re: [Buildroot] [PATCH v2 1/5] linux: enable
 CONFIG_EXTRA_FIRMWARE_DIR
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

Angelo, All,

On 2022-10-14 08:58 +0200, Angelo Compagnucci spake thusly:
> CONFIG_EXTRA_FIRMWARE_DIR must point to the directory where firmware
> file from CONFIG_EXTRA_FIRMWARE will be taken to be embedded to the
> kernel.
> The option is removed if CONFIG_EXTRA_FIRMWARE is not used, but it
> defaults to a sensible value when used.
> 
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> ---
>  linux/linux.mk | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/linux/linux.mk b/linux/linux.mk
> index efdc21eff2..9a909c7d7b 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -408,6 +408,9 @@ define LINUX_KCONFIG_FIXUP_CMDS
>  		$(call KCONFIG_ENABLE_OPT,CONFIG_LOGO)
>  		$(call KCONFIG_ENABLE_OPT,CONFIG_LOGO_LINUX_CLUT224))
>  	$(call KCONFIG_DISABLE_OPT,CONFIG_GCC_PLUGINS)
> +	# The kernel CONFIG_EXTRA_FIRMWARE feature requires to have the firmware full
> +	# path for locating firmware file.
> +	$(call KCONFIG_SET_OPT,CONFIG_EXTRA_FIRMWARE_DIR,"$(STAGING_DIR)/lib/firmware")

Besides what Thomas already said: firmware files are not installed in
STAGING_DIR/lib/firmware, but they are in TARGET_DIR/lib/frmware.

Also, some people already point CONFIG_EXTRA_FIRMWARE_DIR=$(INAGES_DIR)
as there are some firmware fiels copied in there already, so we do not
want to force that for them.

Regards,
Yann E. MORIN.

>  	$(PACKAGES_LINUX_CONFIG_FIXUPS)
>  endef
>  
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
