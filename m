Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C89AC77B7F
	for <buildroot@archiver.kernel.org>; Sat,  6 May 2023 15:29:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09EB381DF2;
	Sat,  6 May 2023 15:29:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09EB381DF2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BC92ZPlkSvRr; Sat,  6 May 2023 15:29:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EAB7381BB2;
	Sat,  6 May 2023 15:29:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EAB7381BB2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 69C5F1BF36C
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 15:29:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5011F405C6
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 15:29:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5011F405C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mZQIebyYbNaa for <buildroot@lists.busybox.net>;
 Sat,  6 May 2023 15:29:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 61873405BC
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 61873405BC
 for <buildroot@buildroot.org>; Sat,  6 May 2023 15:29:18 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:ae89:1f5e:7283:231f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 59378B0053D;
 Sat,  6 May 2023 17:29:12 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 06 May 2023 17:29:12 +0200
Date: Sat, 6 May 2023 17:29:12 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Aaron Sierra <aaron@bubbl-tek.com>
Message-ID: <20230506152912.GD252090@scaer>
References: <20230329155154.75895-1-aaron@bubbl-tek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230329155154.75895-1-aaron@bubbl-tek.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683386955;
 bh=07BilGOzeBvRa7HAlZIfGymy/AorF+hy2iYonvEnDLI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dYeJOUxkLCciV7U4yrOhLVklvHj3gPvRGCSzWhPvzj3c8rxvbYsgluFHUMLbhl2WU
 lIPS2FNHcQl0Del2rT94kGyIkK4M8UgkZ76LU0wZtsInVjpyCJKuL4r28NGNy/2fjd
 P0PCW89QhlKgJUE63l29g9Q9qEI6gwFdBPkiLE7sX1KwYWbiERg6A+DuHNgfsGdDAB
 sjP9S6K3ndw51o9145YVS8kU0kwRat10N3i5J18piDNlKlvXLLUyQfVGVv/5dS158r
 xeIn/DFLgfABH0dKU51EVU9lD3kgLqYMJapnklKBqDsBx3Tw2RD+V0eUWekhcKsFty
 znShtJF1wl0Qw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=dYeJOUxk
Subject: Re: [Buildroot] [PATCH 1/1] package/python-requests: bump to
 version 2.28.2
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Aaron, All,

On 2023-03-29 10:51 -0500, Aaron Sierra spake thusly:
> Get explicit compatibility with charset-normalizer 3.x
> 
> Signed-off-by: Aaron Sierra <aaron@bubbl-tek.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/python-requests/python-requests.hash | 4 ++--
>  package/python-requests/python-requests.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-requests/python-requests.hash b/package/python-requests/python-requests.hash
> index 1383e680d5..b6f696000b 100644
> --- a/package/python-requests/python-requests.hash
> +++ b/package/python-requests/python-requests.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/requests/json
> -md5  796ea875cdae283529c03b9203d9c454  requests-2.28.1.tar.gz
> -sha256  7c5599b102feddaa661c826c56ab4fee28bfd17f5abca1ebbe3e7f19d7c97983  requests-2.28.1.tar.gz
> +md5  09b752e0b0a672d805ae54455c128d42  requests-2.28.2.tar.gz
> +sha256  98b1b2782e3c6c4904938b84c0eb932721069dfdb9134313beff7c83c2df24bf  requests-2.28.2.tar.gz
>  # Locally computed sha256 checksums
>  sha256  09e8a9bcec8067104652c168685ab0931e7868f9c8284b66f5ae6edae5f1130b  LICENSE
> diff --git a/package/python-requests/python-requests.mk b/package/python-requests/python-requests.mk
> index 7a21cca52c..8f9f4b2db4 100644
> --- a/package/python-requests/python-requests.mk
> +++ b/package/python-requests/python-requests.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_REQUESTS_VERSION = 2.28.1
> +PYTHON_REQUESTS_VERSION = 2.28.2
>  PYTHON_REQUESTS_SOURCE = requests-$(PYTHON_REQUESTS_VERSION).tar.gz
> -PYTHON_REQUESTS_SITE = https://files.pythonhosted.org/packages/a5/61/a867851fd5ab77277495a8709ddda0861b28163c4613b011bc00228cc724
> +PYTHON_REQUESTS_SITE = https://files.pythonhosted.org/packages/9d/ee/391076f5937f0a8cdf5e53b701ffc91753e87b07d66bae4a09aa671897bf
>  PYTHON_REQUESTS_SETUP_TYPE = setuptools
>  PYTHON_REQUESTS_LICENSE = Apache-2.0
>  PYTHON_REQUESTS_LICENSE_FILES = LICENSE
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
