Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25667C433F5
	for <buildroot@archiver.kernel.org>; Tue, 28 Dec 2021 20:45:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D915560B52;
	Tue, 28 Dec 2021 20:45:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Knkd1vI1yiMe; Tue, 28 Dec 2021 20:45:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37A2860B09;
	Tue, 28 Dec 2021 20:45:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E8CF61BF344
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 20:45:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D61A340253
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 20:45:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eVijy_SmJRdF for <buildroot@lists.busybox.net>;
 Tue, 28 Dec 2021 20:44:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 492C84023F
 for <buildroot@buildroot.org>; Tue, 28 Dec 2021 20:44:59 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:25ef:2aa8:94fa:832d])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 822A313F7F0;
 Tue, 28 Dec 2021 21:44:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1640724296;
 bh=ReUsdYoT2VK7ZQ2bPST7qg0GNGgzu/8s/SSWHciKsYk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NXM5mkDCa1phL22EkjzFAsLtA9sX0vqvuoHO80+ZqHcmxVeSee3zrSsxz8xyhu1LK
 77W0SHOzvt81mtl0KVSKHoWfLQb33ApZRxLYQYNeeac1loCSwM8fLoeEKrx3RIjoMt
 3ecjZT4t24PzxOdJnB7YxrAAlMK2Vvf4fut3K6hSQS4iPAeKH0Onz+ehV5bVO2wE8b
 MZWpG2nxBBfroR6o3YZ+11YjlK/GEEar2rRxeEIu48Jvj4L82iiG8PyV9RkHSN8TIk
 +o27dEwxV/FLcseV51cHCLBwA6tfXbzHhQSZfAwabH40ROobWa1+W8XAlx9HU8eCrg
 ulYWWt1jvKu1A==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 28 Dec 2021 21:44:48 +0100
Date: Tue, 28 Dec 2021 21:44:48 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20211228204448.GB3390456@scaer>
References: <20211227215833.1136054-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211227215833.1136054-1-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/gcc/Config.in.host: fix
 BR2_GCC_VERSION_ARC select of BR2_TOOLCHAIN_GCC_AT_LEAST_xyz
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2021-12-27 22:58 +0100, Thomas Petazzoni spake thusly:
> When the gcc arc version was bumped to a version using gcc
> 10.x (arc-2020.09-release) in commit
> 0791abfba0227803b19895ea22326f4e17ac93dc, the select of
> BR2_GCC_VERSION_ARC on the appropriate BR2_TOOLCHAIN_GCC_AT_LEAST_xyz
> was not updated. This commit fixes this issue.

I've slightly rephrased the commit log to also add a reference to
0b4c7ba01cfe (toolchain: update option descriptions for ARC tools
arc-2020.09-release) which also missed updating the select.

Nice catch, applied to master, thanks.

Regards,
Yann E. MORIN.

> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/gcc/Config.in.host | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
> index aa2665cbee..a1fe192d3a 100644
> --- a/package/gcc/Config.in.host
> +++ b/package/gcc/Config.in.host
> @@ -12,7 +12,7 @@ config BR2_GCC_VERSION_ARC
>  	bool "gcc arc (10.x)"
>  	# Only supported architecture
>  	depends on BR2_arc
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
> +	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
>  
>  config BR2_GCC_VERSION_POWERPC_SPE
>  	bool "gcc powerpc spe"
> -- 
> 2.31.1
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
