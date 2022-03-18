Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 431CAC433EF
	for <buildroot@archiver.kernel.org>; Fri, 18 Mar 2022 21:59:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DE55D404B4;
	Fri, 18 Mar 2022 21:59:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qi1jGi5GYlAF; Fri, 18 Mar 2022 21:59:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 968C340491;
	Fri, 18 Mar 2022 21:59:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 338CA1BF215
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 21:59:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 237E3403AC
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 21:59:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HP4MO2g6c_44 for <buildroot@lists.busybox.net>;
 Fri, 18 Mar 2022 21:59:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 34BEB402BB
 for <buildroot@buildroot.org>; Fri, 18 Mar 2022 21:59:42 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:20af:3c78:ddff:75e1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 6E96A13F81D;
 Fri, 18 Mar 2022 22:59:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1647640779;
 bh=a/V3LFdWNtvmGacHBFbKq/dFKPb3PSpwDjiHhVpVjqc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UUuoCTo42PSx53oWtg52GHrcbkliULLo6fdB32quIxO2yZrieWPS+ni5I0aUPiGQu
 eDKB5M14Pv5YfPy6rk4SJ9BieWjrZTNVWogFmhwfr9PeK1f4+M1e67iRWefceDxC1u
 2maekmeYpSHGGuVIpaFlwV1QFUfL8xgkq3VmR9ZCQemhQYM1VOWDiuB5VkFQFi/Xcn
 ALo39HRQSh4yN2xBsB1d1DgZ+4yxHMo/UEThPYHbx0FWGF6q0zojIJu44do7kJ1p3H
 09L29/QKZEQwmv1H8L+mLbkw92b77wSw0tj6L8FFNoNznzAJ8Wy8Bw+YCt0jREXg8C
 vxjnCIcVhsMMw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 18 Mar 2022 22:59:37 +0100
Date: Fri, 18 Mar 2022 22:59:37 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20220318215937.GO283544@scaer>
References: <20220317220121.21498-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220317220121.21498-1-ju.o@free.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/openblas: add
 OPENBLAS_CPE_ID_VENDOR
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

Julien, All,

On 2022-03-17 23:01 +0100, Julien Olivain spake thusly:
> cpe:2.3:a:openblas_project:openblas is a valid CPE identifier for this
> package:
> 
> https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aopenblas_project%3Aopenblas
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/openblas/openblas.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/openblas/openblas.mk b/package/openblas/openblas.mk
> index 608c2f24ea..085d32acc3 100644
> --- a/package/openblas/openblas.mk
> +++ b/package/openblas/openblas.mk
> @@ -9,6 +9,7 @@ OPENBLAS_SITE = https://github.com/xianyi/OpenBLAS/releases/download/v$(OPENBLAS
>  OPENBLAS_LICENSE = BSD-3-Clause
>  OPENBLAS_LICENSE_FILES = LICENSE
>  OPENBLAS_INSTALL_STAGING = YES
> +OPENBLAS_CPE_ID_VENDOR = openblas_project
>  
>  # Initialise OpenBLAS make options to $(TARGET_CONFIGURE_OPTS)
>  OPENBLAS_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS)
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
