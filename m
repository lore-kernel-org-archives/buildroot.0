Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74F6DC38A02
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 10:03:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2CF8040545;
	Mon, 31 Oct 2022 10:03:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2CF8040545
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iUSLlFopT7BV; Mon, 31 Oct 2022 10:03:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 52F17403C4;
	Mon, 31 Oct 2022 10:02:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 52F17403C4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9F6911BF580
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 10:01:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 768C7403D0
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 10:01:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 768C7403D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hNnz2EJafQWS for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 10:01:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F6744019D
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3F6744019D
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 10:01:28 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:afdc:c5f1:f1be:8b47])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 6EF6DB00548;
 Mon, 31 Oct 2022 11:01:22 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 31 Oct 2022 11:01:22 +0100
Date: Mon, 31 Oct 2022 11:01:22 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20221031100122.GW1058960@scaer>
References: <20221030195404.1221968-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221030195404.1221968-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1667210486;
 bh=ct8JKZ6I3Q0MEstGjnoVn/9M6yZCU2crqSsFBPr0ZdI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vG+nwJP30x4iBAhkOgRU87wtHm5sTsesxUt1i5uaUAdOc5sLrsl/NzvRNxHqMuq35
 rBS9RgU/c2yJchEWKaZCSo7hWsgEPyXEsCZPHZ6aVANpVEJnHmFdLIuN1adrPSIsmw
 /l2NE8c/+PtnVOJHYyde1pf1DeJ3dze/9O9wlS0NJdjQq4VypRO27A/Gl3pzHuyg8q
 7xE+8FuS6UbQIHAXptAMc4PgQ4JG662Dg4SNKxXCfL3iCSCFLNEpvaBIp+n/gwfWBs
 A8IvaVtFwYFjjp1AHKajbg54BTjZob809vBM0CtbgYDcF43yPIrQ6hF9hywAnkyB4+
 hrrGvD4WJg/Iw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=vG+nwJP3
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pillow: bump to version
 9.3.0
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2022-10-30 13:54 -0600, James Hilliard spake thusly:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/python-pillow/python-pillow.hash | 4 ++--
>  package/python-pillow/python-pillow.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-pillow/python-pillow.hash b/package/python-pillow/python-pillow.hash
> index 0e407bd55c..46da25dddc 100644
> --- a/package/python-pillow/python-pillow.hash
> +++ b/package/python-pillow/python-pillow.hash
> @@ -1,6 +1,6 @@
>  # md5, sha256 from https://pypi.org/pypi/pillow/json
> -md5  218bdb951f3e59e8b782e329ece3416d  Pillow-9.2.0.tar.gz
> -sha256  75e636fd3e0fb872693f23ccb8a5ff2cd578801251f3a4f6854c6a5d437d3c04  Pillow-9.2.0.tar.gz
> +md5  a6507c1e811a51071d2d6de83070e703  Pillow-9.3.0.tar.gz
> +sha256  c935a22a557a560108d780f9a0fc426dd7459940dc54faa49d83249c8d3e760f  Pillow-9.3.0.tar.gz
>  
>  # Locally computed sha256 checksums
>  sha256  a6554cb737ba6c9b47d3301f78de03b4ed0d3f08d6cf9400714f3d4c894f6943  LICENSE
> diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
> index 31725a3e46..5ea9fcf264 100644
> --- a/package/python-pillow/python-pillow.mk
> +++ b/package/python-pillow/python-pillow.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>  
> -PYTHON_PILLOW_VERSION = 9.2.0
> -PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/8c/92/2975b464d9926dc667020ed1abfa6276e68c3571dcb77e43347e15ee9eed
> +PYTHON_PILLOW_VERSION = 9.3.0
> +PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/16/11/da8d395299ca166aa56d9436e26fe8440e5443471de16ccd9a1d06f5993a
>  PYTHON_PILLOW_SOURCE = Pillow-$(PYTHON_PILLOW_VERSION).tar.gz
>  PYTHON_PILLOW_LICENSE = HPND
>  PYTHON_PILLOW_LICENSE_FILES = LICENSE
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
