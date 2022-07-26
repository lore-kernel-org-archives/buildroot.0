Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0393C433EF
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 08:25:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 75AC983332;
	Tue, 26 Jul 2022 08:25:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 75AC983332
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C-8Ryk45LTvE; Tue, 26 Jul 2022 08:25:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 19AAA832B0;
	Tue, 26 Jul 2022 08:25:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 19AAA832B0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 025391BF239
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 08:25:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DDE7841054
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 08:25:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DDE7841054
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pZK9QMvo0VN2 for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 08:25:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 904A64017B
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 904A64017B
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 08:25:08 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9946:e64:fb26:3d99])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id CD149780518;
 Tue, 26 Jul 2022 10:25:01 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 26 Jul 2022 10:25:01 +0200
Date: Tue, 26 Jul 2022 10:25:01 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Christian Stewart <christian@paral.in>
Message-ID: <20220726082501.GH3168@scaer>
References: <20220726063010.60667-1-christian@paral.in>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220726063010.60667-1-christian@paral.in>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658823905;
 bh=b7EP+FrKwSaLC3FP/anpAKWC5dZgh+towVmwzwi8lBs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=p5Kl6daJDjyvJhHAsgBpDTvBXkRERYcLla2myIqSytmeVrbf9TX+Ng74RE9df/LiW
 DAb3jfNCI8Gnm52TYUP/RwlWHU8zL1N693EpUTMWfXQ+eaSQ8z5xP8QlkOIX37tpgN
 I4BY82dY1dzx+L3aEosqTdbTYx8Ccr7Dg4ozcC+S2KzOeIiDzxr4i4AchdPK8QAwHI
 11ZUNUGq/qN1/WYh2eE2IXnR8yOjYqUZJJ2SFyZUVE+2TLl0qtlUdfOvuz15kmphFA
 7lHtsJWhsT/6vZ3gCROnJR12YJH4vZzIkj4hZZLGxuFmyrOvxizxjNeaJAvJZT0dGI
 RegHwHdRmA0pA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=p5Kl6daJ
Subject: Re: [Buildroot] [PATCH 1/1] package/glibc: Config.in: fix typo
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Christian, All,

On 2022-07-25 23:30 -0700, Christian Stewart via buildroot spake thusly:
> compatibiltiy -> compatibility
> 
> Signed-off-by: Christian Stewart <christian@paral.in>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/glibc/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/glibc/Config.in b/package/glibc/Config.in
> index 56f7299568..f535f9f6eb 100644
> --- a/package/glibc/Config.in
> +++ b/package/glibc/Config.in
> @@ -49,7 +49,7 @@ config BR2_PACKAGE_GLIBC
>  	  https://www.gnu.org/software/libc/
>  
>  config BR2_PACKAGE_GLIBC_KERNEL_COMPAT
> -	bool "Enable compatibiltiy shims to run on older kernels"
> +	bool "Enable compatibility shims to run on older kernels"
>  	help
>  	  Say 'y' here if you plan on running your system on a kernel
>  	  older than the version used for the toolchain headers.
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
