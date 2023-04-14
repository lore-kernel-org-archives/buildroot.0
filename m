Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C44BC77B72
	for <buildroot@archiver.kernel.org>; Fri, 14 Apr 2023 19:39:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3AD2942C2F;
	Fri, 14 Apr 2023 19:39:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3AD2942C2F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F9vytHL-jCdR; Fri, 14 Apr 2023 19:39:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6032642BE2;
	Fri, 14 Apr 2023 19:39:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6032642BE2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 760021C3F79
 for <buildroot@lists.busybox.net>; Fri, 14 Apr 2023 19:39:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4EF9D60BCE
 for <buildroot@lists.busybox.net>; Fri, 14 Apr 2023 19:39:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4EF9D60BCE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vtQZRHUBe1pl for <buildroot@lists.busybox.net>;
 Fri, 14 Apr 2023 19:39:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1427060BEC
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1427060BEC
 for <buildroot@buildroot.org>; Fri, 14 Apr 2023 19:39:32 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 19CC15FFA2;
 Fri, 14 Apr 2023 21:39:25 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 14 Apr 2023 21:39:24 +0200
Date: Fri, 14 Apr 2023 21:39:24 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Witold Lipieta <witold.lipieta@thaumatec.com>
Message-ID: <20230414193924.GZ2819@scaer>
References: <20230413113416.3445526-1-witold.lipieta@thaumatec.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230413113416.3445526-1-witold.lipieta@thaumatec.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1681501169;
 bh=IQOywM2Lt9eyJzmdy7/nyV+ZqWjf9feMCQH0/A3kI7A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Xz+dgn28Rxp5b4zF5Yh5VmD4UFZiZKYaKzBSqOdFz5UqSozLjgyCt/olP2dVY5b6S
 5cliO4Ma9vdPLGSF2kamRuIkdq03rmRnMsNGG32GNQav5rZigQCsGNMv01qLZekSph
 KsA6kRaQnfRx3GZlD9YOcD0oEIQuyZ4uVf+Frv4kKaYOvVF9JYE+VqAJVgZDIAoqCH
 yvKPh4ci1/1MSaBohHrEW3OgAcrX6XEC0k5iI+QCHYWhK5MQl/aj2/AypwwvZ0lH1g
 qi4QjajsWJsOIg5zvurRh3PmZesxFo2qXBgi9zd9i06EhJekGGV/nK19m5PrjE1aAT
 FhTBOaBdVE/vQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Xz+dgn28
Subject: Re: [Buildroot] [PATCH 1/1] package: python-esptool: Bump version
 to 4.5.1
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
Cc: Bartosz Bilas <b.bilas@grinn-global.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Witold, All,

On 2023-04-13 13:34 +0200, Witold Lipieta spake thusly:
> Signed-off-by: Witold Lipieta <witold.lipieta@thaumatec.com>

Applied to master, after changing the title to:

    package/python-esptool: Bump version to 4.5.1

Thanks!

Regards,
Yann E. MORIN.

> ---
>  package/python-esptool/python-esptool.hash | 4 ++--
>  package/python-esptool/python-esptool.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-esptool/python-esptool.hash b/package/python-esptool/python-esptool.hash
> index b7246f9788..e1d3188658 100644
> --- a/package/python-esptool/python-esptool.hash
> +++ b/package/python-esptool/python-esptool.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/esptool/json
> -md5  92c38551bc33bd5271bdea033aa51610  esptool-4.4.tar.gz
> -sha256  8acd4dfe70819b1302861ae92894380fb4700b377f5a4739479a4ec276e0b256  esptool-4.4.tar.gz
> +md5  fbad6fb6024580fd2645331f92a74555  esptool-4.5.1.tar.gz
> +sha256  e3eb59836123e5ebf793ef639311f7d85645526487d8b1c2b51159b455106b9a  esptool-4.5.1.tar.gz
>  # Locally computed sha256 checksums
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
> diff --git a/package/python-esptool/python-esptool.mk b/package/python-esptool/python-esptool.mk
> index 0a71e1a78b..34bdf6cc96 100644
> --- a/package/python-esptool/python-esptool.mk
> +++ b/package/python-esptool/python-esptool.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_ESPTOOL_VERSION = 4.4
> +PYTHON_ESPTOOL_VERSION = 4.5.1
>  PYTHON_ESPTOOL_SOURCE = esptool-$(PYTHON_ESPTOOL_VERSION).tar.gz
> -PYTHON_ESPTOOL_SITE = https://files.pythonhosted.org/packages/8b/4c/82d7fe5fa0643415bbb90bebff1f861816903c481ee5156fabd6d76dc684
> +PYTHON_ESPTOOL_SITE = https://files.pythonhosted.org/packages/04/80/8eb97d1793cfaf830a4c0a7ea1d8f0674ccba8c23b7d02dcce074b5f44ea
>  PYTHON_ESPTOOL_SETUP_TYPE = setuptools
>  PYTHON_ESPTOOL_LICENSE = GPL-2.0+
>  PYTHON_ESPTOOL_LICENSE_FILES = LICENSE
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
