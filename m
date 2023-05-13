Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FAEEC77B7D
	for <buildroot@archiver.kernel.org>; Sat, 13 May 2023 10:07:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F23C42E1A;
	Sat, 13 May 2023 10:07:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F23C42E1A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JsiUmwYzF3S8; Sat, 13 May 2023 10:07:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 723D442E02;
	Sat, 13 May 2023 10:07:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 723D442E02
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6E0BB1BF424
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 10:07:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 451E642E02
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 10:07:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 451E642E02
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dDROBg4F1Z4B for <buildroot@lists.busybox.net>;
 Sat, 13 May 2023 10:06:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B8D2F42E01
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B8D2F42E01
 for <buildroot@buildroot.org>; Sat, 13 May 2023 10:06:59 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:b62a:d745:2556:f18])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 0D15719F5A7
 for <buildroot@buildroot.org>; Sat, 13 May 2023 12:06:55 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 13 May 2023 12:06:55 +0200
Date: Sat, 13 May 2023 12:06:55 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Message-ID: <20230513100655.GI2582048@scaer>
References: <cover.1676112761.git.yann.morin.1998@free.fr>
 <912929d06f13459e472f6badf7e9251792b272fe.1676112761.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <912929d06f13459e472f6badf7e9251792b272fe.1676112761.git.yann.morin.1998@free.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683972417;
 bh=FjxomDKNdIMn9G3MdCRXELHiNMHcCJsSfpMwQsva0RQ=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=TyEsLKm8z6YMDsYxYkVk8Wo9VJiqaByuYfrz6IeCe/rx54JYhHXMkuhhkRaB6r2Pl
 GTXmp2AXMUdgVws6hffSaNmTrVvPR/wTrSJWpVbQn6BGg7F6Hj0DJPPztC6N2Dxiiw
 cPY7EpQWMreyYnr5hDbMAsG6YOXBGeg6AA5UxtRVcAAtCSGca0azpPJyCMqoNR3W1g
 ftvoPvSaHHPL/lWx0bbYbtIoYR7K8pMaQbht/9Tt0ASLMWY1738aGNTOR/JlwuI7Qb
 8AJP0CgH3l+27eLH7yq175rMyzvo1d2ZytbKiswKTO+LVzO/GSc34cPkd+/b/TDOAK
 g+7RZDNnEe6uw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=TyEsLKm8
Subject: Re: [Buildroot] [PATCH 1/2] br2-external: make the list of external
 trees public
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

All,

On 2023-02-11 11:52 +0100, Yann E. MORIN spake thusly:
> Currently, the list of external trees is a private variable, but for
> debugging or compliance, one may need to get that list.
> 
> Add a Kconfig option so that the list appears in the .config file, and
> export the already existing .mk variable in the environment, so that
> post-build or post-image scripts can use it.
> 
> Reported-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  support/scripts/br2-external | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/support/scripts/br2-external b/support/scripts/br2-external
> index 2c33e6eacc..5815c6ded0 100755
> --- a/support/scripts/br2-external
> +++ b/support/scripts/br2-external
> @@ -126,7 +126,7 @@ do_mk() {
>          done
>          printf '\n'
>  
> -        printf 'BR2_EXTERNAL_NAMES = \n'
> +        printf 'export BR2_EXTERNAL_NAMES = \n'
>          printf 'BR2_EXTERNAL_DIRS = \n'
>          printf 'BR2_EXTERNAL_MKS = \n'
>  
> @@ -181,6 +181,14 @@ do_kconfig() {
>  
>      printf 'menu "External options"\n\n' >>"${outputdir}/.br2-external.in.menus"
>  
> +    {
> +        printf 'config BR2_EXTERNAL_NAMES\n'
> +        printf '\tstring\n'
> +        # Use star-expansion: we really one a single arg.
> +        printf '\tdefault "%s"\n' "${BR2_EXT_NAMES[*]}"
> +        printf '\n'
> +    } >>"${outputdir}/.br2-external.in.paths"
> +
>      for br2_name in "${BR2_EXT_NAMES[@]}"; do
>          eval br2_desc="\"\${BR2_EXT_DESCS_${br2_name}}\""
>          eval br2_ext="\"\${BR2_EXT_PATHS_${br2_name}}\""
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
