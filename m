Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEAC1C3DA78
	for <buildroot@archiver.kernel.org>; Sat, 14 Jan 2023 20:39:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E7874088E;
	Sat, 14 Jan 2023 20:39:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E7874088E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rAS-7T_HxT37; Sat, 14 Jan 2023 20:39:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 00A3440894;
	Sat, 14 Jan 2023 20:39:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 00A3440894
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6EC121BF2A5
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 20:39:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4735840894
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 20:39:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4735840894
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nQ3zcx69IlZ5 for <buildroot@lists.busybox.net>;
 Sat, 14 Jan 2023 20:39:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC3954088E
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BC3954088E
 for <buildroot@buildroot.org>; Sat, 14 Jan 2023 20:39:06 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 33BC85FF88;
 Sat, 14 Jan 2023 21:39:00 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 14 Jan 2023 21:38:59 +0100
Date: Sat, 14 Jan 2023 21:38:59 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Nicolas Carrier <Nicolas.Carrier@orolia.com>
Message-ID: <20230114203859.GC199036@scaer>
References: <d7d0dede27d4b3a026071a3019b58c5e8df9fe7b.camel@orolia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d7d0dede27d4b3a026071a3019b58c5e8df9fe7b.camel@orolia.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1673728743;
 bh=8EoM5cQn4TUfuWZffDBjWM3rGBIsFou51/UEpKaDJuw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WrU2WZhEjOdrHRjeSct+AWYidzjX6Zv3qcnfe314z2fg95x11RZQ8reqMcq7wgIh0
 RHHZxvP6ncZb4okw49Lfs99eKCVFK1ip4a86gaqMGOfoBom2Gno1cI6uCVq4IdD+Lk
 qRrT6tGcO9hpxihy1XRXrxwlhcSYUMe2fK+TXmjzUE64qV7Utt3u2MF0lZRNAErecp
 LaLmBjbyJJaM9tgZ6fKK0jLIz6Rctk+B+PZNuTqCBLNK1QMB3bvaEpu3WuyKUxRvcc
 rxuYYZE/Upm0K+EvYcWpYveKC+e7D+u/wbH8Wl2T68Mg5QkyyRDDqsOnEc3O3HOeTf
 R+0frShqYyjkg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=WrU2WZhE
Subject: Re: [Buildroot] package/pkg-generic.mk: no legal info WARNING if
 REDISTRIBUTE = NO
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
Cc: "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Nicolas, All,

On 2023-01-13 13:20 +0000, Nicolas Carrier spake thusly:
> Hello,
> Here is a patch to remove some legal-info warnings when REDISTRIBUTE is set to NO, for local and
> override packages.
> 
> I can't use git send-email as our IT department has forbidden the standard pop/imap/smtp methods...
> I hope that won't be too much of an issue :/

Yup, it did not go smoothly, but I'm afraid that you'll not be the only
one who can't send patches via proper mail... So, I took some time to
tweak my scripting to adapt to that situation.

> From 60a77caebc6d3b0900e1bbe56a61d821f7c586f9 Mon Sep 17 00:00:00 2001
> From: Nicolas Carrier <nicolas.carrier@orolia.com>
> Date: Fri, 13 Jan 2023 12:46:22 +0100
> Subject: [PATCH 1/1] package/pkg-generic.mk: no legal info WARNING if
>  REDISTRIBUTE = NO
> 
> Packages making use of OVERRIDE_SRC_DIR or of the local SITE_METHOD,
> will trigger a warning when the legal-info target is built, for example:
> 
> WARNING: foo: sources not saved (local packages not handled)
> 
> But in the situation where the packages has explicitly defined
> FOO_REDISTRIBUTE = NO
> in its .mk file, it makes no sense since the sources wouldn't be saved
> anyway.

Yes, it makes sense.

> This patch swap the conditions on the type of package and on the
> REDISTRIBUTE value, so that the warnings get issued only if
> REDISTRIBUTE equals YES.
> 
> Signed-off-by: Nicolas Carrier <nicolas.carrier@orolia.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/pkg-generic.mk | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index f2bea01d7d..2f8ba39edf 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -1145,6 +1145,7 @@ else
>  	$(Q)$$(foreach F,$$($(2)_LICENSE_FILES),$$(call legal-license-file,$$($(2)_RAWNAME),$$($(2)_BASENAME_RAW),$$($(2)_HASH_FILE),$$(F),$$($(2)_DIR)/$$(F),$$(call UPPERCASE,$(4)))$$(sep))
>  endif # license files
>  
> +ifeq ($$($(2)_REDISTRIBUTE),YES)
>  ifeq ($$($(2)_SITE_METHOD),local)
>  # Packages without a tarball: don't save and warn
>  	@$$(call legal-warning-nosource,$$($(2)_RAWNAME),local)
> @@ -1155,7 +1156,6 @@ else ifneq ($$($(2)_OVERRIDE_SRCDIR),)
>  else
>  # Other packages
>  
> -ifeq ($$($(2)_REDISTRIBUTE),YES)
>  # Save the source tarball and any extra downloads, but not
>  # patches, as they are handled specially afterwards.
>  	$$(foreach e,$$($(2)_ACTUAL_SOURCE_TARBALL) $$(notdir $$($(2)_EXTRA_DOWNLOADS)),\
> @@ -1169,9 +1169,9 @@ ifeq ($$($(2)_REDISTRIBUTE),YES)
>  			$$($(2)_REDIST_SOURCES_DIR) || exit 1; \
>  		printf "%s\n" "$$$${f##*/}" >>$$($(2)_REDIST_SOURCES_DIR)/series || exit 1; \
>  	done <$$($(2)_DIR)/.applied_patches_list
> -endif # redistribute
> -
>  endif # other packages
> +
> +endif # redistribute
>  	@$$(call legal-manifest,$$(call UPPERCASE,$(4)),$$($(2)_RAWNAME),$$($(2)_VERSION),$$(subst $$(space)$$(comma),$$(comma),$$($(2)_LICENSE)),$$($(2)_MANIFEST_LICENSE_FILES),$$($(2)_ACTUAL_SOURCE_TARBALL),$$($(2)_ACTUAL_SOURCE_SITE),$$(call legal-deps,$(1)))
>  endif # ifneq ($$(call qstrip,$$($(2)_SOURCE)),)
>  	$$(foreach hook,$$($(2)_POST_LEGAL_INFO_HOOKS),$$(call $$(hook))$$(sep))
> -- 
> 2.30.2
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
