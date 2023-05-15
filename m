Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12096C7EE25
	for <buildroot@archiver.kernel.org>; Mon, 15 May 2023 20:14:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AD49741DA9;
	Mon, 15 May 2023 20:14:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD49741DA9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L4uFMKLMSkBO; Mon, 15 May 2023 20:14:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D067541DA7;
	Mon, 15 May 2023 20:14:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D067541DA7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id ACB211BF3AA
 for <buildroot@lists.busybox.net>; Mon, 15 May 2023 20:14:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8550441DA6
 for <buildroot@lists.busybox.net>; Mon, 15 May 2023 20:14:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8550441DA6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2lsMgYTeSOzX for <buildroot@lists.busybox.net>;
 Mon, 15 May 2023 20:14:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9D3CD41450
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9D3CD41450
 for <buildroot@buildroot.org>; Mon, 15 May 2023 20:14:54 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:a7a1:441c:4e0f:17e6])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id DA36C780521;
 Mon, 15 May 2023 22:14:49 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 15 May 2023 22:14:49 +0200
Date: Mon, 15 May 2023 22:14:49 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20230515201449.GN2582048@scaer>
References: <20230515195157.1142476-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230515195157.1142476-1-bernd.kuhls@t-online.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1684181692;
 bh=IFowPHJvYNU6FXxyKcgBR9vXfDJMHK1VVwM5FcR57Gs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=b+4gHqlZ2yzbepTG1nnEhRFfSMwhYlNLSTpC/CjaIKmtLFC573hbJgtYgLidudml/
 7HV5Qzl+VjYtgsNhd0fC+9ziIUSTlLGROMDTB+lx3YnF1CWt5pmiISNuykpD5Oiu6U
 TL2+8BWU2P7wSsejVgnlWL0wMbjFS9UnymViJyhjA4DM4vyIVK6ltkZ5eYuDCMXfyP
 4Hs4HV3/pw+oB/esOe/DkO6CQusDaDlvJNp12+c4Iz4rltrOexr7gwU2XloP7AKfMH
 CcI01UDbm/mtbUfC2M+GbTOKSkP6rEOfL1UaVm2XNYlZQv2d6NxsmjUlaZzWW1FmMG
 RH2WVZZ8yai1A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=b+4gHqlZ
Subject: Re: [Buildroot] [PATCH v2 1/1] package/clamav: fix build on mips64el
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

Bernd, All,

On 2023-05-15 21:51 +0200, Bernd Kuhls spake thusly:
> Fixes:
> http://autobuild.buildroot.net/results/b64/b640937f35b11ddb9f1e29f0e44040eda8850f26/
> 'Could not find specification for target "mips64el-unknown-linux-gnu".'
> 
> This patch changes
>     -DRUST_COMPILER_TARGET=mips64el-unknown-linux-gnu
> to
>     -DRUST_COMPILER_TARGET=mips64el-unknown-linux-gnuabi64
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> v2: use RUSTC_TARGET_NAME (Yann)
> 
>  package/clamav/clamav.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
> index 977b6010b3..68a1799bfc 100644
> --- a/package/clamav/clamav.mk
> +++ b/package/clamav/clamav.mk
> @@ -54,7 +54,7 @@ CLAMAV_CONF_OPTS = \
>  	-DENABLE_MILTER=OFF \
>  	-DENABLE_TESTS=OFF \
>  	-DHAVE_SYSTEM_LFS_FTS=ON \
> -	-DRUST_COMPILER_TARGET=$(ARCH)-unknown-$(TARGET_OS)-$(LIBC)$(ABI) \
> +	-DRUST_COMPILER_TARGET=$(RUSTC_TARGET_NAME) \
>  	-Dtest_run_result=ON \
>  	-Dtest_run_result__TRYRUN_OUTPUT=ON
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
