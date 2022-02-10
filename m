Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D679C433EF
	for <buildroot@archiver.kernel.org>; Thu, 10 Feb 2022 20:46:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0FE32402EB;
	Thu, 10 Feb 2022 20:46:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5r7lG0Qs54pd; Thu, 10 Feb 2022 20:46:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 073FA40129;
	Thu, 10 Feb 2022 20:46:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 999461BF398
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 20:46:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 889F6826DE
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 20:46:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d9SYF98RYSW5 for <buildroot@lists.busybox.net>;
 Thu, 10 Feb 2022 20:46:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9E54382628
 for <buildroot@buildroot.org>; Thu, 10 Feb 2022 20:46:26 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:d4e:c6ab:895c:dfc8])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id D285813F861;
 Thu, 10 Feb 2022 21:46:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1644525984;
 bh=y2bAiDUo4jxse38W+8KwO6j7mQECfuWi99bqsHug3ok=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kOYXwhhjGmbTXHAU/Yz1dF0R0+UO2dKnP1W0h8UVon9/AgysQ/Sw+J45VVMhHUEdd
 rfv6NO6W/FXhs2m0YrimfxfjtSwl+bqilrumI9d+qC90jreHrqbMFWr3wmuTxDCx5C
 /zUQgWIppgsN6YuRGcASwsLPwUF0XC8ATC3rcF995tjfykcNKU+p/XTE66JGyryd7s
 5iaSNmwF+2vwuK+dNYqvz0O08LyZ57MP8vjsdIS1TKI6VrgeJo7XSxVElhgRkHH4Dw
 XBfxMei6FaUsczQQzyRqAqPQCxfEIrPupCissv9daniDQpYYCqMN8f6ilUAdlCjDcz
 iiekyCg4O30oQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 10 Feb 2022 21:46:20 +0100
Date: Thu, 10 Feb 2022 21:46:20 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20220210204620.GB3752867@scaer>
References: <20220210191401.13822-1-peter@korsgaard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220210191401.13822-1-peter@korsgaard.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/gtest: drop python2 host support
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
Cc: Stephan Hoffmann <sho@relinux.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All,

On 2022-02-10 20:14 +0100, Peter Korsgaard spake thusly:
> And simplify the package a bit while we're at it.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Appied to master, along with your three other python-related patches.

Regards,
Yann E. MORIN.

> ---
>  package/gtest/gtest.mk | 13 ++-----------
>  1 file changed, 2 insertions(+), 11 deletions(-)
> 
> diff --git a/package/gtest/gtest.mk b/package/gtest/gtest.mk
> index 673e626c45..e7ce89a3f4 100644
> --- a/package/gtest/gtest.mk
> +++ b/package/gtest/gtest.mk
> @@ -19,16 +19,7 @@ endif
>  
>  HOST_GTEST_LICENSE = Apache-2.0
>  HOST_GTEST_LICENSE_FILES = googlemock/scripts/generator/LICENSE
> -ifeq ($(BR2_PACKAGE_PYTHON3),y)
> -HOST_GTEST_PYTHON_VERSION = $(PYTHON3_VERSION_MAJOR)
> -HOST_GTEST_DEPENDENCIES += host-python3
> -else
> -HOST_GTEST_PYTHON_VERSION = $(PYTHON_VERSION_MAJOR)
> -HOST_GTEST_DEPENDENCIES += host-python
> -endif
> -
> -HOST_GTEST_GMOCK_PYTHONPATH = \
> -	$(HOST_DIR)/lib/python$(HOST_GTEST_PYTHON_VERSION)/site-packages
> +HOST_GTEST_DEPENDENCIES = host-python3
>  
>  # While it is possible to build gtest as shared library, using this gtest shared
>  # library requires to set some special configure option in the project using
> @@ -56,7 +47,7 @@ define HOST_GTEST_POST_INSTALL_PYTHON
>  	$(INSTALL) -D -m 0755 $(@D)/googlemock/scripts/generator/gmock_gen.py \
>  		$(HOST_DIR)/bin/gmock_gen
>  	cp -rp $(@D)/googlemock/scripts/generator/cpp \
> -		$(HOST_GTEST_GMOCK_PYTHONPATH)
> +		$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages
>  endef
>  
>  HOST_GTEST_POST_INSTALL_HOOKS += HOST_GTEST_POST_INSTALL_PYTHON
> -- 
> 2.20.1
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
