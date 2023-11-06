Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4225DC4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 13:03:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BEFDD41D19;
	Mon,  6 Nov 2023 13:03:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BEFDD41D19
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E_goLnHYdwJf; Mon,  6 Nov 2023 13:03:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C861541D60;
	Mon,  6 Nov 2023 13:03:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C861541D60
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2B71A1BF3C1
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 13:03:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0F1E1414B7
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 13:03:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F1E1414B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l8WyUdKzHXa4 for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 13:03:49 +0000 (UTC)
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 32679414B6
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 13:03:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 32679414B6
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:5023:65e3:22e2:e1cc])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 0940119F72F;
 Mon,  6 Nov 2023 14:03:42 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 06 Nov 2023 14:03:42 +0100
Date: Mon, 6 Nov 2023 14:03:42 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20231106130342.GA2625@scaer>
References: <20231105003341.2711310-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231105003341.2711310-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1699275826;
 bh=DVPRlLIOfFKop7HfcoqogLqDifUfNMtTz8dPJH/Pzpo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ewweXiBLTOUr8hcS6k5phpGBFRMzAAI6cnjJtvGlvEsoF8RL+XsleJY41ghfl0QwF
 XGxVpsmFpKREBdsDOSgv5HL/kq4AW3Wp0qPNM/vOsm8E8xR5rHDQRDzRFQS0605bcq
 NlQ4RFOYlmMr2t3uTypYvqOWEkSG1h2X+4jNo6hKvCliR8NKpqzFk70R5462MLmIb7
 XGwCS7WHxpG38qqnBGupaRQpspnVfrXYflfND5jjVBo1sHl2cC7QN5/PnfumCNpiFP
 8eDw1qveY6NDVGXtHganRM6YNgkxuWyVAH7eliyKt94DZnaOueEw/IxKBxAv+XeXqa
 kbuTfhoCKGaoQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ewweXiBL
Subject: Re: [Buildroot] [PATCH 1/1] package/python-asgiref: bump to version
 3.7.2
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

James, All,

On 2023-11-04 18:33 -0600, James Hilliard spake thusly:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks, along with:

    [1859363] 167f4c834e3f  package/python-blinker: bump to version 1.7.0
    [1859362] ce2bf7b96b9d  package/python-bitstring: bump to version 4.1.2
    [1859361] 4eb97cc7e621  package/python-beautifulsoup4: bump to version 4.12.2
    [1859360] 80b8602eebd9  package/python-babel: bump to version 2.13.1
    [1859359] d4b2fc9ae8a4  package/{avro-c, python-avro}: bump to version 1.11.3
    [1859358] 509e05f7af9e  package/python-async-timeout: bump to version 4.0.3
    [1859357] 6f10cd7f8fda  package/python-async-lru: bump to version 2.0.4
    [1859356] cae00fe78395  package/python-asttokens: bump to version 2.4.1
    [1859355] b398c5a21039  package/python-asgiref: bump to version 3.7.2

Regards,
Yann E. MORIN.

> ---
>  package/python-asgiref/python-asgiref.hash | 4 ++--
>  package/python-asgiref/python-asgiref.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-asgiref/python-asgiref.hash b/package/python-asgiref/python-asgiref.hash
> index 26d8e78e47..7f3bca57c0 100644
> --- a/package/python-asgiref/python-asgiref.hash
> +++ b/package/python-asgiref/python-asgiref.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/asgiref/json
> -md5  562ecd896dcbf5576db8c29cb1881ca4  asgiref-3.6.0.tar.gz
> -sha256  9567dfe7bd8d3c8c892227827c41cce860b368104c3431da67a0c5a65a949506  asgiref-3.6.0.tar.gz
> +md5  7cd61836ec3c329f415309f88e92e0e3  asgiref-3.7.2.tar.gz
> +sha256  9e0ce3aa93a819ba5b45120216b23878cf6e8525eb3848653452b4192b92afed  asgiref-3.7.2.tar.gz
>  # Locally computed sha256 checksums
>  sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
> diff --git a/package/python-asgiref/python-asgiref.mk b/package/python-asgiref/python-asgiref.mk
> index bfd90f10e8..abd8962476 100644
> --- a/package/python-asgiref/python-asgiref.mk
> +++ b/package/python-asgiref/python-asgiref.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_ASGIREF_VERSION = 3.6.0
> +PYTHON_ASGIREF_VERSION = 3.7.2
>  PYTHON_ASGIREF_SOURCE = asgiref-$(PYTHON_ASGIREF_VERSION).tar.gz
> -PYTHON_ASGIREF_SITE = https://files.pythonhosted.org/packages/78/2d/797c0537426266d6c9377a2ed6a4ac61e50c2d5b1ab4da101a4b9bfe26e2
> +PYTHON_ASGIREF_SITE = https://files.pythonhosted.org/packages/12/19/64e38c1c2cbf0da9635b7082bbdf0e89052e93329279f59759c24a10cc96
>  PYTHON_ASGIREF_SETUP_TYPE = setuptools
>  PYTHON_ASGIREF_LICENSE = BSD-3-Clause
>  PYTHON_ASGIREF_LICENSE_FILES = LICENSE
> -- 
> 2.34.1
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
