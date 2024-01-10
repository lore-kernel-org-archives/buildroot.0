Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7B58C3DA6E
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 10:36:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7504A613ED;
	Wed, 10 Jan 2024 10:36:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7504A613ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xvuvNpbgsiIx; Wed, 10 Jan 2024 10:36:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B817A613FC;
	Wed, 10 Jan 2024 10:36:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B817A613FC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5DC231BF354
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 10:36:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 32AB5404E7
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 10:36:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 32AB5404E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WcHRguJpLRaf for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 10:36:19 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E6970404DF
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 10:36:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E6970404DF
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 852DBB0055E;
 Wed, 10 Jan 2024 11:36:13 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 10 Jan 2024 11:36:13 +0100
Date: Wed, 10 Jan 2024 11:36:13 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <ZZ5zHcDmANt7f1c-@landeda>
References: <20240109173015.7528-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240109173015.7528-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1704882975;
 bh=lAIBdZuCxKQb15zQOqpoMuD/8DvqOPAo32kI+ETnre4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cgYUhyZIBA9qEBarmI9QKnN6WLqH30nOsAldxYTDfFGRkw6arBY0v/4H3aID0a/9w
 oLgLegt8Gty/EWQuNjOSAASLIJ42oB8am4zfJhhrzO+19MHKqJmVKGapsXigrWg5pr
 fj4as0/NEWl2I9B8c65lp3S1eCtttZFLmsKmAP1HJ9b8Ebpu4FAE+bKr5ugGROg0AP
 Tfc6IS8vkm3GbHwp0TFD3EwUuQjE2zuSvtbaUPxk5wnWQV0je2PwmHB/U2jHg2fyzj
 /HijFqFIuhuCXd3jAfo/Sxaj4P4iNLyRwobu3BYAN/GK3RZrXby/GRkVYA04AVrW3q
 kUwZaDnG3QV/g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=cgYUhyZI
Subject: Re: [Buildroot] [PATCH 1/1] package/madplay: force arm mode instead
 of Thumb mode
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

Fabrice, All,

On 2024-01-09 18:30 +0100, Fabrice Fontaine spake thusly:
> Fix the following build failure raised because madplay uses mad_f_mul
> which is defined in usr/include/mad.h (installed by libmad which has
> been fixed by a similar workaround in commit
> 0aaadd525f2df02911349ffe1518814fa095bf96, unfortunately the fix works
> for compiled code, not mad_f_mul define):
> 
> /tmp/cc5SGGoU.s:102: Error: selected processor does not support `smull r8,r9,r2,r4' in Thumb mode
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/0c0955d4f6726b50cad721f4d3437dabde316e70
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/madplay/madplay.mk | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/package/madplay/madplay.mk b/package/madplay/madplay.mk
> index e1a78bd7d7..91ee44ab5f 100644
> --- a/package/madplay/madplay.mk
> +++ b/package/madplay/madplay.mk
> @@ -15,6 +15,14 @@ MADPLAY_DEPENDENCIES = host-pkgconf libmad libid3tag $(TARGET_NLS_DEPENDENCIES)
>  # Also 0003-configure-ac-use-pkg-config-to-find-id3tag.patch
>  MADPLAY_AUTORECONF = YES
>  
> +# madplay uses libmad which has some assembly function that is not present in
> +# Thumb mode:
> +# Error: selected processor does not support `smull r8,r9,r2,r4' in Thumb mode
> +# so, we desactivate Thumb mode
> +ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
> +MADPLAY_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -marm"
> +endif
> +
>  # Check if ALSA is built, then we should configure after alsa-lib so
>  # ./configure can find alsa-lib.
>  ifeq ($(BR2_PACKAGE_MADPLAY_ALSA),y)
> -- 
> 2.43.0
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
