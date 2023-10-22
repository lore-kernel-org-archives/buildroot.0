Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43662CDB474
	for <buildroot@archiver.kernel.org>; Sun, 22 Oct 2023 18:37:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EBB224168F;
	Sun, 22 Oct 2023 18:37:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EBB224168F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ugt3EHX7MsHV; Sun, 22 Oct 2023 18:37:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2759C41686;
	Sun, 22 Oct 2023 18:37:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2759C41686
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0F31A1BF399
 for <buildroot@lists.busybox.net>; Sun, 22 Oct 2023 18:37:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DCF106005E
 for <buildroot@lists.busybox.net>; Sun, 22 Oct 2023 18:37:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DCF106005E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ewwa0QYHUljK for <buildroot@lists.busybox.net>;
 Sun, 22 Oct 2023 18:37:44 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DA7D060807
 for <buildroot@buildroot.org>; Sun, 22 Oct 2023 18:37:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA7D060807
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:9668:e224:b510:3431])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id BB35EB00579;
 Sun, 22 Oct 2023 20:37:36 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 22 Oct 2023 20:37:36 +0200
Date: Sun, 22 Oct 2023 20:37:36 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <20231022183736.GT2607@scaer>
References: <20231020082703.1610281-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231020082703.1610281-1-adam.duskett@amarulasolutions.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1697999861;
 bh=M1UektjFbhOsH9dwgZ0iYWTqSYwHthnXL7O0qf1sk5c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=txAYP4Pcbcdt4Ousxus3WG/qmKrNS3HDCBnTihLPCZLdQZa4tj4zn/bb+5ExiAH47
 GMgEmtAqigrT1j+lsfWPxjKnnKuuAEdVlebrQ+bIB3NxDL2EmM42pcNmgKf2OQBfMG
 TsgfVwkBmts1k3hip2BOOrY8olvQd55XO/Ohxxff/jEJWpXui/+CsbhQVnMAV0M/KH
 3tb8v0Iq5Qd7jTEsqaw4UHZ9zqaTeh7B2V1R36CsWHz5HSh6ghZ9BauVizPN5VP1U3
 y5ebZvbYMhfkccvyDWPLsZ/0n/PKnbStZbVp1BQGPPmdf1O9lJLGUiGvsBmBdJQkEL
 O1pwLFXY9GR1Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=txAYP4Pc
Subject: Re: [Buildroot] [PATCH 1/1] package/python-django: bump version to
 4.2.6
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Oli Vogt <oli.vogt.pub01@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Adam, All,

On 2023-10-20 10:27 +0200, Adam Duskett spake thusly:
> Tested with tests.package.test_python_django.TestPythonPy3Django.test_run in
> Fedora 38 and Debian 11
> 
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/python-django/python-django.hash | 4 ++--
>  package/python-django/python-django.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
> index ee1776b44f..b68f4231fa 100644
> --- a/package/python-django/python-django.hash
> +++ b/package/python-django/python-django.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/django/json
> -md5  3720c85a8c25cacbce2f95d345d0f5ad  Django-4.1.10.tar.gz
> -sha256  56343019a9fd839e2e5bf203daf45f25af79d5bffa4c71d56eae4f4404d82ade  Django-4.1.10.tar.gz
> +md5  ad84c2b9bbebaa26427a2a656fe5ceea  Django-4.2.6.tar.gz
> +sha256  08f41f468b63335aea0d904c5729e0250300f6a1907bf293a65499496cdbc68f  Django-4.2.6.tar.gz
>  # Locally computed sha256 checksums
>  sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
> diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
> index 61dfd54dcd..79065ab60a 100644
> --- a/package/python-django/python-django.mk
> +++ b/package/python-django/python-django.mk
> @@ -4,10 +4,10 @@
>  #
>  ################################################################################
>  
> -PYTHON_DJANGO_VERSION = 4.1.10
> +PYTHON_DJANGO_VERSION = 4.2.6
>  PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
>  # The official Django site has an unpractical URL
> -PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/70/d4/eded564fa5928f68771d082ec0eef4d023f9d19dfa1d2923305bc3e62afe
> +PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/23/7b/f47d10d870fabfcaa1fba403460a4e482ab7dbba4d715d43981d1f8c8d85
>  PYTHON_DJANGO_LICENSE = BSD-3-Clause
>  PYTHON_DJANGO_LICENSE_FILES = LICENSE
>  PYTHON_DJANGO_CPE_ID_VENDOR = djangoproject
> -- 
> 2.41.0
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
