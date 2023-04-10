Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7651EC76196
	for <buildroot@archiver.kernel.org>; Mon, 10 Apr 2023 19:44:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2220161402;
	Mon, 10 Apr 2023 19:44:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2220161402
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 096wVJhL9thW; Mon, 10 Apr 2023 19:44:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 559496FF0D;
	Mon, 10 Apr 2023 19:44:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 559496FF0D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CE9221BF316
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 19:43:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A3EEA40256
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 19:43:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3EEA40256
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bbn2F57kfDQ4 for <buildroot@lists.busybox.net>;
 Mon, 10 Apr 2023 19:43:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E07840239
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2E07840239
 for <buildroot@buildroot.org>; Mon, 10 Apr 2023 19:43:11 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 34CFF5FFA2;
 Mon, 10 Apr 2023 21:43:05 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 10 Apr 2023 21:43:04 +0200
Date: Mon, 10 Apr 2023 21:43:04 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20230410194304.GL2819@scaer>
References: <20230330123509.23696-1-ps.report@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230330123509.23696-1-ps.report@gmx.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1681155788;
 bh=o4F2uDfJ/alQDguPUkz51AoScFFGmH3ftztPhcDnpGA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ItVPLoSYJeepSxpT1wZ0Nl2ODF9sZUJ55W+B71SsPejssOHjJLBBFMcnCWdAJfEx6
 sFLFO6d2JYimm9wJXH+aguNZNYjKaqzIkTYSqt+H5B8mvg7rTGPPxhnJN6vdhfHEdT
 yFMrIULX5DvyqGF5c3jlgumjaw7VVQovNXAw7ktpf7sarYYpKnxbABCJV3/ITvBxMl
 5k9PvXKvZutg8p/SXiYI4Ia0riMDk55YJlDiEvvoIC6CT+92/f63GmQU5RcM53kEL2
 ds00hjC3EmvElDTpvG1nRv6a0pUA6xjeRFHsEqgr8THsyxNGVS7RyRUhdiAtY0FQ4B
 Gu/3yXcScUMmQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ItVPLoSY
Subject: Re: [Buildroot] [PATCH v2 1/2] package/libv4l: bump version to
 1.24.1
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All,

On 2023-03-30 14:35 +0200, Peter Seiderer spake thusly:
> - disable new v4l2-tracer option (fails to compile with rpi4_64 configuration)
> 
> For details see [1].
> 
> [1] https://git.linuxtv.org/v4l-utils.git/tree/ChangeLog?h=stable-1.24
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> Changes v1 -> v2:
>   - fix --disable-v4l-tracer vs. --disable-v4l2-tracer typo
> ---
>  package/libv4l/libv4l.hash | 2 +-
>  package/libv4l/libv4l.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libv4l/libv4l.hash b/package/libv4l/libv4l.hash
> index d99d5e0992..4f694de34b 100644
> --- a/package/libv4l/libv4l.hash
> +++ b/package/libv4l/libv4l.hash
> @@ -1,7 +1,7 @@
>  # Locally calculated after checking signature
>  # https://linuxtv.org/downloads/v4l-utils/v4l-utils-1.20.0.tar.bz2.asc
>  # with key 05D0169C26E41593418129DF199A64FADFB500FF
> -sha256  65c6fbe830a44ca105c443b027182c1b2c9053a91d1e72ad849dfab388b94e31  v4l-utils-1.22.1.tar.bz2
> +sha256  cbb7fe8a6307f5ce533a05cded70bb93c3ba06395ab9b6d007eb53b75d805f5b  v4l-utils-1.24.1.tar.bz2
>  
>  # Locally calculated
>  sha256  391e4da1c54a422a78d83be7bf84b2dfb8bacdd8ad256fa4374e128655584a8a  COPYING
> diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
> index fd69b7ac7a..1142a7442f 100644
> --- a/package/libv4l/libv4l.mk
> +++ b/package/libv4l/libv4l.mk
> @@ -4,12 +4,12 @@
>  #
>  ################################################################################
>  
> -LIBV4L_VERSION = 1.22.1
> +LIBV4L_VERSION = 1.24.1
>  LIBV4L_SOURCE = v4l-utils-$(LIBV4L_VERSION).tar.bz2
>  LIBV4L_SITE = https://linuxtv.org/downloads/v4l-utils
>  LIBV4L_INSTALL_STAGING = YES
>  LIBV4L_DEPENDENCIES = host-pkgconf
> -LIBV4L_CONF_OPTS = --disable-doxygen-doc --disable-qvidcap
> +LIBV4L_CONF_OPTS = --disable-doxygen-doc --disable-qvidcap --disable-v4l2-tracer
>  # needed to get utils/qv4l link flags right
>  LIBV4L_AUTORECONF = YES
>  # add host-gettext for AM_ICONV macro
> -- 
> 2.40.0
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
