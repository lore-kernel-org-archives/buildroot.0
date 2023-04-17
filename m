Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7746C77B7A
	for <buildroot@archiver.kernel.org>; Mon, 17 Apr 2023 17:42:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47DAD41B6C;
	Mon, 17 Apr 2023 17:42:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 47DAD41B6C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QfOxN-gCY7rN; Mon, 17 Apr 2023 17:42:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0691C41B85;
	Mon, 17 Apr 2023 17:42:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0691C41B85
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0041A1BF2F6
 for <buildroot@lists.busybox.net>; Mon, 17 Apr 2023 17:42:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C744460F6B
 for <buildroot@lists.busybox.net>; Mon, 17 Apr 2023 17:42:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C744460F6B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AUUhXIYw-0Nu for <buildroot@lists.busybox.net>;
 Mon, 17 Apr 2023 17:42:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5ED5060F41
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5ED5060F41
 for <buildroot@buildroot.org>; Mon, 17 Apr 2023 17:42:09 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 35B895FFB4;
 Mon, 17 Apr 2023 19:42:03 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 17 Apr 2023 19:42:02 +0200
Date: Mon, 17 Apr 2023 19:42:02 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Message-ID: <20230417174202.GL2819@scaer>
References: <20230416151310.2698912-1-marcus.folkesson@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230416151310.2698912-1-marcus.folkesson@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1681753326;
 bh=fw5GgNH/ShArNYE/ffISakkQpF1uJGj5hvARf8ceFHw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qFiCGALbTxDUHnhCMKJdLXLZR2a2T8Ifj1/4yk5rm1F6m2NBF8PAOwSuDrK5a8LFF
 kMYhPwdl6+gb88PqJPwbKd7ZTrIlQGUXpD8LaRr3hOdKijSJN858Tl9pTTT2jD96Ek
 kEnYjtPwVks7xh4lNYBnGetnoWv1Soprt7hq1f8RRQqVk0O03On9Hv585/PsDH9J9K
 UTQlra+KLkUM173UPBG15pSD46VWkfHAOczBtx/pf/iEBTLNCbrg8TYbZWpThS1vdq
 /E8MQf8CeBNRn+1TkbvQh+e+7nuJvB9DwqFzqy5dn1strade5cpsC2sJ383z8ZUCky
 Qm8tFieiQQDgg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=qFiCGALb
Subject: Re: [Buildroot] [RESEND PATCH v2 1/2] package/pkg-kconfig.mk new
 <pkg>-show-fragment target
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
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Marcus, All,

On 2023-04-16 17:13 +0200, Marcus Folkesson spake thusly:
> This patch introduce the new target to simplify the generation of
> configuration fragments as the output could be directly copied into a
> fragment file as-is.
> 
> It is *heavily* based on the <pkg>-diff-config target, but serves a
> different purpose.
> 
> Output from linux-diff-config:
> -CONFIG_GCC_PLUGIN_ARM_SSP_PER_TASK y
> -CONFIG_GCC_PLUGIN_CYC_COMPLEXITY n
> -CONFIG_GCC_PLUGIN_LATENT_ENTROPY n
> -CONFIG_GCC_PLUGIN_RANDSTRUCT n
> -CONFIG_GCC_PLUGIN_STRUCTLEAK_BYREF n
> -CONFIG_GCC_PLUGIN_STRUCTLEAK_BYREF_ALL n
> -CONFIG_GCC_PLUGIN_STRUCTLEAK_USER n
> -CONFIG_STACKPROTECTOR_PER_TASK y
> CONFIG_CRYPTO_DH n -> y
> CONFIG_CRYPTO_KPP m -> y
> CONFIG_GCC_PLUGINS y -> n
> CONFIG_KEY_DH_OPERATIONS n -> y
> CONFIG_PKCS8_PRIVATE_KEY_PARSER n -> y
> CONFIG_VIDEO_IMX274 n -> m
> 
> Output from linux-show-fragment:
> CONFIG_CRYPTO_DH=y
> CONFIG_CRYPTO_KPP=y
> CONFIG_KEY_DH_OPERATIONS=y
> CONFIG_PKCS8_PRIVATE_KEY_PARSER=y
> CONFIG_VIDEO_IMX274=m

Notice how "# CONFIG_GCC_PLUGINS is not set" is not generated in that
-show-fragment output. But CONFIG_GCC_PLUGINS already has special
handling in Buildrot, so maybe that's just an artifact of that...

So, it looks like it only reports symbols which values has "increased"
(i.e. from 'n' to 'm' or 'y', or from 'm' to 'y'), and completely
ignores symbols which values has "decreased" (i.e. from 'y' to 'm' or
'n', or from 'm' to 'n').

This does not look like it is generating a proper fragment, then,
because if one reuses that, it's gonna miss some (un)settings.

So, even though I do understand the rationale (make it easier to
generate a fragment), it is not going to help much if one can't trust
it, and has to manually compare the result with what has actually
changed, as if -show-fragment did not exist in the first place...

Could check with another symbol, to validate that the fragmetn does
indeed contain un-setting entries?

Still, I am a bit conflicted about that new target.

There have been a lot of requests (not recently, though, granted) from
people that used multiple fragmetns, who requested a way to
automatically update each from the current state of the configuration.
This is not possible at all, of course; -show-fragment won't help in
that case. -show-fragment can not even help to update an existing
fragment; it can only help to *create* a single *additional* fragment.

Indeed, -show-fragment only reports the delta from the current
configuration, with the expansion of the configuration as expresed from
the settings (base + fragment config) in Buildroot's .config.

How that delta can be used will be very dependent on the situation:

  - the delta is re-used as-is to form a new fragment, that stacks
    on-top on the existing fragment list, in which case this risk
    acculating some history (with a latter fragment changing a previous
    one); it may also cause quite some confusiotn, as the user will
    have to also edit Buildroot's .config to add it to the list of
    fragments to apply;

  - the delta is appended as-is to an existing fragment already listed
    in Buildroot's .config; it is like stacking, above, whith all the
    cons; it has the advantage that it does not requires changing
    Buildroot's .config, because the existing fragment is already
    listed.

  - the existing fragments (or config file) have to be modified to
    account for the delta; in this case, -diff-config is probably
    better suited.

So yes, I am a bit unsure...

Plus, see below...

> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---
>  package/pkg-kconfig.mk | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
> index f4f35bf96a..ee96525c47 100644
> --- a/package/pkg-kconfig.mk
> +++ b/package/pkg-kconfig.mk
> @@ -309,12 +309,26 @@ $(1)-diff-config: $(1)-check-configuration-done
>  	$$(Q)cp -a $$($(2)_DIR)/.config.dc.bak $$($(2)_DIR)/$$($(2)_KCONFIG_DOTCONFIG)
>  	$$(Q)rm -f $$($(2)_DIR)/.config.dc.bak
>  
> +# Target to output differences between the configuration obtained via the
> +# defconfig + fragments (if any) and the current configuration.
> +# Output format is suitable to be used as-is in fragment files.
> +# Note: it preserves the timestamp of the current configuration when moving it
> +# around.
> +$(1)-show-fragment: $(1)-check-configuration-done
> +	$$(Q)cp -a $$($(2)_DIR)/$$($(2)_KCONFIG_DOTCONFIG) $$($(2)_DIR)/.config.dc.bak
> +	$$(call kconfig-package-merge-config,$(2),$$($(2)_DIR)/$$($(2)_KCONFIG_DOTCONFIG),\
> +		$$($(2)_KCONFIG_FRAGMENT_FILES))
> +	$$(Q)utils/diffconfig -m $$($(2)_DIR)/$$($(2)_KCONFIG_DOTCONFIG) \
> +		 $$($(2)_DIR)/.config.dc.bak
> +	$$(Q)cp -a $$($(2)_DIR)/.config.dc.bak $$($(2)_DIR)/$$($(2)_KCONFIG_DOTCONFIG)
> +	$$(Q)rm -f $$($(2)_DIR)/.config.dc.bak

So, -show-fragment only differs from -diff-config by the -m option passed
to utils/diffconfig, right?

So, maybe we can simplify things a bit, to really re-use the same code:

    diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
    index f4f35bf96a..1ba39f0ee8 100644
    --- a/package/pkg-kconfig.mk
    +++ b/package/pkg-kconfig.mk
    @@ -304,11 +304,13 @@ $(1)-diff-config: $(1)-check-configuration-done
     	$$(Q)cp -a $$($(2)_DIR)/$$($(2)_KCONFIG_DOTCONFIG) $$($(2)_DIR)/.config.dc.bak
     	$$(call kconfig-package-merge-config,$(2),$$($(2)_DIR)/$$($(2)_KCONFIG_DOTCONFIG),\
     		$$($(2)_KCONFIG_FRAGMENT_FILES))
    -	$$(Q)utils/diffconfig $$($(2)_DIR)/$$($(2)_KCONFIG_DOTCONFIG) \
    +	$$(Q)utils/diffconfig $$(DIFFCONFIG_OPTS) $$($(2)_DIR)/$$($(2)_KCONFIG_DOTCONFIG) \
     		 $$($(2)_DIR)/.config.dc.bak
     	$$(Q)cp -a $$($(2)_DIR)/.config.dc.bak $$($(2)_DIR)/$$($(2)_KCONFIG_DOTCONFIG)
     	$$(Q)rm -f $$($(2)_DIR)/.config.dc.bak

    +$(1)-show-fragment: DIFFCONFIG_OPTS=-m
    +$(1)-show-fragment: $(1)-diff-config

     endif # package enabled

Regards,
Yann E. MORIN.

>  endif # package enabled
>  
>  .PHONY: \
>  	$(1)-diff-config \
>  	$(1)-check-configuration-done \
> +	$(1)-show-fragment \
>  	$$($(2)_DIR)/.kconfig_editor_% \
>  	$$(addprefix $(1)-,$$($(2)_KCONFIG_EDITORS))
>  
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
