Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE7BBC433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 14:29:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B5D883DF2;
	Mon, 25 Jul 2022 14:29:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B5D883DF2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wTcvjfyVXR4A; Mon, 25 Jul 2022 14:29:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7343F83380;
	Mon, 25 Jul 2022 14:29:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7343F83380
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1FCB91BF3AA
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 14:29:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ED66E61288
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 14:29:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED66E61288
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d7S09UKryy-W for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 14:28:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A805160E11
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A805160E11
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 14:28:59 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9102:8e95:18fd:a25a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 84A0C19F5B2;
 Mon, 25 Jul 2022 16:28:54 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 25 Jul 2022 16:28:54 +0200
Date: Mon, 25 Jul 2022 16:28:54 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: TIAN Yuanhao <tianyuanhao3@163.com>
Message-ID: <20220725142854.GF3168@scaer>
References: <20220725120927.348160-1-tianyuanhao3@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220725120927.348160-1-tianyuanhao3@163.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658759336;
 bh=tLwGksj5+kUEdpLFZkCZ4Qnb3MrYcTelyqm+saN2IlQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UqmMEkujvwiez/tNEM5zK2II2D9sk7fYO8m15vE8TEBvu7qT7mqlY1MV9N84ctut5
 zhGVTY/rhLGFKhA8WE36JwtQZqX3tOKFXFG3tEo/J0gYHSmbuTKxWKVKzhmuzlWFiN
 +F8vlVSApMEwK3YCKcucqNIKM8mYd37TprV78coljVL5nrlGBPmJ/TGGPYdn9n9H/g
 RgOhwkb+NKcZvQTxin79I6YkNzNY2wSZUa7QNEGz9w2pCi9Ysh8X9hE9/tESlfrEjG
 YQaVLkMI2t9gAH6I6xGofXxrbE7P9xekcT+ECtCpm3lzYM7uQSfIA1rrEL84UhWrp7
 txZwlxb8GYlng==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=UqmMEkuj
Subject: Re: [Buildroot] [PATCH] package/pkg-utils: prevent
 KCONFIG_ENABLE_OPT from changing =m to =y
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

TIAN Yuanhao, All,

On 2022-07-25 05:09 -0700, TIAN Yuanhao spake thusly:
> The KCONFIG_ENABLE_OPT is intended to enable a required kernel configuration
> option when a package requires it.
> 
> However, this will often override an existing enabled module with `=m` with `=y`
> which overrides the module to be built-in instead of separate.
> 
> This is undesirable behavior; we often want these as `=m` and not `=y` to reduce
> the size of the kernel image.
> 
> This patch changes KCONFIG_MUNGE_DOT_CONFIG to prevent changing `=m` to `=y`.
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> Co-authored-by: TIAN Yuanhao <tianyuanhao3@163.com>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  package/pkg-utils.mk | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
> index 7d1aea7710..2edd542ba9 100644
> --- a/package/pkg-utils.mk
> +++ b/package/pkg-utils.mk
> @@ -22,12 +22,17 @@ KCONFIG_DOT_CONFIG = $(strip \
>  
>  # KCONFIG_MUNGE_DOT_CONFIG (option, newline [, file])
>  define KCONFIG_MUNGE_DOT_CONFIG
> -	$(SED) "/\\<$(strip $(1))\\>/d" $(call KCONFIG_DOT_CONFIG,$(3))
> +	$(SED) '/^\(# \)\?$(strip $(1))\>/d' $(call KCONFIG_DOT_CONFIG,$(3)) && \

This change should not be needed. We now check that the value is already
set, and if it is, then we do not touch it. So, if we hit this code, it
means we will want to remove any line that has that option.

Additionally, since the option is enclosed with \< and \>, then only
full-word will match. I.e. if option if DOO, then none of FOO_BAR,
BAR_FOO, or BAR_FOO_BUZ would match, so we don't need to optionally
match the leading comment symbol.

>  	echo '$(strip $(2))' >> $(call KCONFIG_DOT_CONFIG,$(3))
>  endef
>  
>  # KCONFIG_ENABLE_OPT (option [, file])
> -KCONFIG_ENABLE_OPT  = $(call KCONFIG_MUNGE_DOT_CONFIG, $(1), $(1)=y, $(2))
> +# If the option is already set to =m or =y, ignore.
> +define KCONFIG_ENABLE_OPT
> +	$(Q)if ! grep -q '^$(strip $(1))=[my]' $(call KCONFIG_DOT_CONFIG,$(2)); then \
> +		$(call KCONFIG_MUNGE_DOT_CONFIG, $(1), $(1)=y, $(2)) || exit 1; \

The return code of an if statement is the one from the last command in
the list. In this case, KCONFIG_MUNGE_DOT_CONFIG expands to a single
(compound) command, so if it fails, the if statement will fail, and so
the if statement will fail. So, the  "|| exit 1"  here should not be
needed.

Additionally, if we ever change KCONFIG_MUNGE_DOT_CONFIG to be multiple
commands, the  "|| exit 1"  would only apply to the last, so that would
not catch all failures either.

Applied to master, after:
  - reverting the SED match
  - dropping the || exit 1

Thanks!

Regards,
Yann E. MORIN.

> +	fi
> +endef
>  # KCONFIG_SET_OPT (option, value [, file])
>  KCONFIG_SET_OPT     = $(call KCONFIG_MUNGE_DOT_CONFIG, $(1), $(1)=$(2), $(3))
>  # KCONFIG_DISABLE_OPT  (option [, file])
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
