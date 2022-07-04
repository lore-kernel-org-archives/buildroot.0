Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E62DC43334
	for <buildroot@archiver.kernel.org>; Mon,  4 Jul 2022 20:04:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F23E240002;
	Mon,  4 Jul 2022 20:04:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F23E240002
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Daj8Yx5UzB7H; Mon,  4 Jul 2022 20:04:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CF83040588;
	Mon,  4 Jul 2022 20:04:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF83040588
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E6D571BF20B
 for <buildroot@lists.busybox.net>; Mon,  4 Jul 2022 20:04:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C1050606FF
 for <buildroot@lists.busybox.net>; Mon,  4 Jul 2022 20:04:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C1050606FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1iFbpvC6S6jE for <buildroot@lists.busybox.net>;
 Mon,  4 Jul 2022 20:04:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 48EB760593
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 48EB760593
 for <buildroot@buildroot.org>; Mon,  4 Jul 2022 20:04:35 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:8dbc:d4c9:1472:395c])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 1D032780310;
 Mon,  4 Jul 2022 22:04:27 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 04 Jul 2022 22:04:26 +0200
Date: Mon, 4 Jul 2022 22:04:26 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Quentin Schulz <foss+buildroot@0leil.net>
Message-ID: <20220704200426.GJ2521@scaer>
References: <20220506104658.3174243-1-foss+buildroot@0leil.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220506104658.3174243-1-foss+buildroot@0leil.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1656965071;
 bh=lRit52XGJ7xIOib6kSdUQUjPn5okOoDxdk9QBaGZnvE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PEfeyiPAb+x/DwBBUN1BqrP3GIu6Wa2pA1Jeka4z/zT7FvrWYppH5YO3wiJ6WwTXq
 vk88lCbk/yPn8LVtJeNv43DsImMTV93Q1bPXChkz4bqRfUmoa3zNFh/ObPsy85qlcp
 XWGrGtULntHS16EJt5vFSE8NdkLdwSITUP5L50GHOQV+gZTBut0D3G092m3FQU1x1c
 VacEgpLtB/RvghLkiCygWoWlW4r6Q+4yGsJa2BwZEl0oo7f1jaaIfNAhn2gEclKFRZ
 ke7/ldAw3k6ZcnT08Lv2Nn5sjnRu1gogRh9LzzqsYHFtfJZ3iMxSjd7GvuIcEnwXCS
 WvyoQ8oKJs2zg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=PEfeyiPA
Subject: Re: [Buildroot] [PATCH v2] package/libcamera: strip symbols before
 signing IPA libs
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
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Quentin, All,

Kieran, some question for you toward the end... ;-)

On 2022-05-06 12:46 +0200, Quentin Schulz spake thusly:
> From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> 
> Open-Source IPA shlibs need to be signed in order to be runnable within
> the same process, otherwise they are deemed Closed-Source and run in
> another process and communicate over IPC.
> 
> The shlib installed on the target should be the same as the one signed
> by libcamera during package creation otherwise the signature won't match
> the shlib.
> 
> Buildroot sanitizes RPATH in a post build process. meson gets rid of
> rpath while installing so we don't need to do it manually.
> 
> Buildroot may strip symbols, so we need to do the same before signing.
> Since meson install target is also signing the IPA shlibs, let's strip
> them before this happens.
> 
> Cc: Quentin Schulz <foss+buildroot@0leil.net>
> Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>

Applied to master, thanks.

However, this is a bit fragile, since libcamera may ultimately decide to
do the signing during the build phase (the install step is supposed to
be just about copying files around in theory).

So maybe:
 1. Buildroot needs to learn about FOO_STRIP_EXCLUDE_FILES/DIRS
 2. libcamera needs an option -Dstip-ipa=true/false
 3. libcamera.mk needs to set LIBCAMERA_STRIP_EXCLUDE_FILES/DIRS

Kieran, what do you think?

Regards,
Yann E. MORIN.

> ---
> 
> v2:
>  - use LIBCAMERA_POST_BUILD_HOOKS instead of replacing
>  LIBCAMERA_INSTALL_TARGET_CMDS,
>  - add handling of BR2_STRIP_EXCLUDE_FILES to not strip files which
>  shouldn't,
>  - added --no-run-if-empty to xargs, in case no IPA is selected,
>  - removed stderr redirect and pipe to true to not hide useful
>  information or fail the build if strip does not work,
> 
>  package/libcamera/libcamera.mk | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
> index 77381ab3ca..41d6a5abef 100644
> --- a/package/libcamera/libcamera.mk
> +++ b/package/libcamera/libcamera.mk
> @@ -104,4 +104,24 @@ LIBCAMERA_DEPENDENCIES += libexecinfo
>  LIBCAMERA_LDFLAGS = $(TARGET_LDFLAGS) -lexecinfo
>  endif
>  
> +# Open-Source IPA shlibs need to be signed in order to be runnable within the
> +# same process, otherwise they are deemed Closed-Source and run in another
> +# process and communicate over IPC.
> +# Buildroot sanitizes RPATH in a post build process. meson gets rid of rpath
> +# while installing so we don't need to do it manually here.
> +# Buildroot may strip symbols, so we need to do the same before signing
> +# otherwise the signature won't match the shlib on the rootfs. Since meson
> +# install target is signing the shlibs, we need to strip them before.
> +LIBCAMERA_STRIP_FIND_CMD = \
> +	find $(@D)/build/src/ipa \
> +	$(if $(call qstrip,$(BR2_STRIP_EXCLUDE_FILES)), \
> +		-not \( $(call findfileclauses,$(call qstrip,$(BR2_STRIP_EXCLUDE_FILES))) \) ) \
> +	-type f -name 'ipa_*.so' -print0
> +
> +define LIBCAMERA_BUILD_STRIP_IPA_SO
> +	$(LIBCAMERA_STRIP_FIND_CMD) | xargs --no-run-if-empty -0 $(STRIPCMD)
> +endef
> +
> +LIBCAMERA_POST_BUILD_HOOKS += LIBCAMERA_BUILD_STRIP_IPA_SO
> +
>  $(eval $(meson-package))
> -- 
> 2.35.1
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
