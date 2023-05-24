Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CF03C77B73
	for <buildroot@archiver.kernel.org>; Wed, 24 May 2023 19:15:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 33CFD82266;
	Wed, 24 May 2023 19:15:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 33CFD82266
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9uwsJWJLJZlx; Wed, 24 May 2023 19:15:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D09281FF0;
	Wed, 24 May 2023 19:15:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D09281FF0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0BB271BF2F9
 for <buildroot@lists.busybox.net>; Wed, 24 May 2023 19:15:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E694060797
 for <buildroot@lists.busybox.net>; Wed, 24 May 2023 19:15:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E694060797
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BiYcCpZsM99X for <buildroot@lists.busybox.net>;
 Wed, 24 May 2023 19:15:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0EEB60593
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E0EEB60593
 for <buildroot@buildroot.org>; Wed, 24 May 2023 19:15:09 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:f59a:3e7b:43a8:ebfe])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 9BA81B00535;
 Wed, 24 May 2023 21:15:00 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 24 May 2023 21:15:00 +0200
Date: Wed, 24 May 2023 21:15:00 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Message-ID: <20230524191500.GC2623@scaer>
References: <20230524031601.19938-1-bagasdotme@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230524031601.19938-1-bagasdotme@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1684955707;
 bh=5cbY4qTpSqxm0nxidi6/vMGhvZZP2C8OFcD8ECOalno=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TEgype4HjM/biZPs7AukkyvgOaRHAFmMd/fpXnIcERxPTebDhazjg3z72bvS3IGUU
 BtEJfRoYwmzC9KPeFVIKAOyU9SpW4FyAcyrYOL5Y1fbHWPrDRo/nK1Q27Fg1Bvnjc/
 QbFcXGzgG8bLf9uE/8L45c94OuooycdDkZsebiuDFbg+h5L1FFE3Rhl4t+ePosyeax
 PyYZK3kUeHN6ry27YG+1zOdeYbwjyMBAiW8QqPNP9SEgd4OGHgdHNbwYof+OsAoay6
 xR5336RTzXsRDkQPidRFFww/DpLRReO46K37+iWS6gKSgLTjGAy0PS8ljTyyPsGpI8
 saTGV1aO8XcpQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=TEgype4H
Subject: Re: [Buildroot] [PATCH] toolchain-external-custom: Describe
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX
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
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot Development <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bags, All,

On 2023-05-24 10:16 +0700, Bagas Sanjaya spake thusly:
> "Toolchain prefix" option apparently doesn't have any help describing
> it, which causes confusion when using external toolchain. Leaving this
> option at default prefix name ("$(ARCH)-linux") when external toolchain
> components are called with different prefix (e.g.
> "$(ARCH)-unknown-linux-gnu") may cause build failure unless the prefix
> symlink is already in place (e.g. when using Buildroot-generated
> toolchain as external toolchain).
> 
> Describe the option to clarify.
> 
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
> ---
>  .../toolchain-external-custom/Config.in.options       | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
> index 0fd8841e5b..ed62bad990 100644
> --- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
> +++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
> @@ -24,6 +24,17 @@ config BR2_TOOLCHAIN_EXTERNAL_REL_BIN_PATH
>  config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX
>  	string "Toolchain prefix"
>  	default "$(ARCH)-linux"
> +	help
> +	  Component name prefix used by your external toolchain.
> +	  Typically, this is target tuple (e.g. "$(ARCH)-unknown-linux-gnu").
> +	  If unsure, look at "bin" directory of your toolchain and
> +	  note the part of component name before the last dash (i.e. if
> +	  you call the toolchain's gcc as "$(ARCH)-unknown-linux-gnu-gcc",
> +	  the prefix is "$(ARCH)-unknown-linux-gnu").
> +
> +	  Note that Buildroot toolchains have "$(ARCH)-linux" symlink alias
> +	  to the full tuple-named components, so you can leave this option at
> +	  default value if you use them as external toolchain.

    $ ./utils/docker-run make check-package
    toolchain/toolchain-external/toolchain-external-custom/Config.in.options:29: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)
    toolchain/toolchain-external/toolchain-external-custom/Config.in.options:32: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)
    toolchain/toolchain-external/toolchain-external-custom/Config.in.options:35: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)
    toolchain/toolchain-external/toolchain-external-custom/Config.in.options:36: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)

Applied to master with the above fixed (which required that I rephrase
it slightly to keep lines of a consistent length). Thanks.

Regards,
Yann E. MORIN.

>  choice
>  	bool "External toolchain gcc version"
> 
> base-commit: 603df32a0cd416caa2d2688008cb87f14ad68ef3
> -- 
> An old man doll... just what I always wanted! - Clara
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
