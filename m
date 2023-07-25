Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5F69C0015E
	for <buildroot@archiver.kernel.org>; Tue, 25 Jul 2023 20:06:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C546611A2;
	Tue, 25 Jul 2023 20:06:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C546611A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NknR-WDJBF_f; Tue, 25 Jul 2023 20:06:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A65161161;
	Tue, 25 Jul 2023 20:06:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A65161161
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3430C1BF4E5
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 20:04:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0C00B418CD
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 20:04:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C00B418CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xNr65K8vf-BZ for <buildroot@lists.busybox.net>;
 Tue, 25 Jul 2023 20:04:46 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A6F1D41894
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 20:04:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A6F1D41894
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:c1a3:ebab:98d8:8372])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id B95D678034E;
 Tue, 25 Jul 2023 22:04:40 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 25 Jul 2023 22:04:40 +0200
Date: Tue, 25 Jul 2023 22:04:40 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230725200440.GN3544423@scaer>
References: <20230725142540.321108-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230725142540.321108-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1690315483;
 bh=hjSDVy9zhHuXdgiXu7gP5r/7cLE2NGIJyDs2Ugh+t90=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vaWIRJcx1hREb+iZD19v2xSgw4gPNljwdWpZXcH8ns6jk5I+xp1J24OybcA5i+Uc/
 f5Wcpl7JFWgqqU8+z+WCksMpigFvUE3uirxk0STX3VZi3bd1TwR+4sBygZAIuNaqdP
 Pfs/ZZvJI01EB9r0JCSJNk2n4hC9MC0W+zzaGlp1N/syO0PYHqWtgNk/DugLbFYk16
 GCZAJDugz9gzpdTfuFF0n3lAN3wWiH3uA0ilhFUdIlnNgQwOyLx7jth4A2E8iEwsxY
 cl5guGjfCsf8g574meLrnzl5F26CQo4E43BGlnHr4AV7BgXl7RgrYRqRyao8g26/PA
 h/8b9JSjj3XfA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=vaWIRJcx
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pyparsing: bump to
 version 3.1.0
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

On 2023-07-25 08:25 -0600, James Hilliard spake thusly:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, along with the other 15 python package bumps, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/python-pyparsing/python-pyparsing.hash | 4 ++--
>  package/python-pyparsing/python-pyparsing.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-pyparsing/python-pyparsing.hash b/package/python-pyparsing/python-pyparsing.hash
> index 90242bb2e2..0a41a4033a 100644
> --- a/package/python-pyparsing/python-pyparsing.hash
> +++ b/package/python-pyparsing/python-pyparsing.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/pyparsing/json
> -md5  fadc2f3bf5872bf6310576a86c3566e0  pyparsing-3.0.9.tar.gz
> -sha256  2b020ecf7d21b687f219b71ecad3631f644a47f01403fa1d1036b0c6416d70fb  pyparsing-3.0.9.tar.gz
> +md5  93b2b40f3d1ffa5c3dd795aad8f5829e  pyparsing-3.1.0.tar.gz
> +sha256  edb662d6fe322d6e990b1594b5feaeadf806803359e3d4d42f11e295e588f0ea  pyparsing-3.1.0.tar.gz
>  # Locally computed sha256 checksums
>  sha256  10d5120a16805804ffda8b688c220bfb4e8f39741b57320604d455a309e01972  LICENSE
> diff --git a/package/python-pyparsing/python-pyparsing.mk b/package/python-pyparsing/python-pyparsing.mk
> index 55516c3ce8..a7d6ea30d2 100644
> --- a/package/python-pyparsing/python-pyparsing.mk
> +++ b/package/python-pyparsing/python-pyparsing.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_PYPARSING_VERSION = 3.0.9
> +PYTHON_PYPARSING_VERSION = 3.1.0
>  PYTHON_PYPARSING_SOURCE = pyparsing-$(PYTHON_PYPARSING_VERSION).tar.gz
> -PYTHON_PYPARSING_SITE = https://files.pythonhosted.org/packages/71/22/207523d16464c40a0310d2d4d8926daffa00ac1f5b1576170a32db749636
> +PYTHON_PYPARSING_SITE = https://files.pythonhosted.org/packages/4f/13/28e88033cab976721512e7741000fb0635fa078045e530a91abb25aea0c0
>  PYTHON_PYPARSING_LICENSE = MIT
>  PYTHON_PYPARSING_LICENSE_FILES = LICENSE
>  PYTHON_PYPARSING_SETUP_TYPE = flit
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
