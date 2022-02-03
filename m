Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86AEFC433F5
	for <buildroot@archiver.kernel.org>; Thu,  3 Feb 2022 20:39:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 074B54048B;
	Thu,  3 Feb 2022 20:39:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hMBjEvD9n7JP; Thu,  3 Feb 2022 20:39:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DABDE40133;
	Thu,  3 Feb 2022 20:39:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 32AFC1BF38D
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 20:39:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2133340221
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 20:39:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pTdaGEY6b6VA for <buildroot@lists.busybox.net>;
 Thu,  3 Feb 2022 20:39:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CB1F6401F9
 for <buildroot@buildroot.org>; Thu,  3 Feb 2022 20:39:20 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:7171:be7f:48d5:d9c])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 088DD13F87C;
 Thu,  3 Feb 2022 21:39:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1643920758;
 bh=Xlvgx+zyUZlu/DDGk64S2VRI4t1H0skiIbL0FlrjyzI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UjHOuwigfP9OhTSbsipssczQd/hsGIk8yUbAC94eJGvfKZk20Z6EbKwC50KT6sIYr
 1i10r9WOBujIvGFTapx5FugqsMUeO8M+oBhDeG5oF72xHU94Gitbia1KcG/ZipRRZz
 YB+fDTjdE/5fK0wrBKbnsV7ZZ9hUpo1VUHk/L/cB4p3wBTT7Lp3kpkq3+sE9P67uIX
 DSjTP8mI/dqnwaOwFI2fcmz92IySFYZgbF/mnRfuFK5kYz0FymHrMQw3V+sKrRYvcZ
 v99HUYUYl0pED4w7FL/IHaHjgzAH2ir+sVuHrXu6Vnrf7s7AU/3kJHmrNPIyz4+elv
 mKz40H9mVuDDQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 03 Feb 2022 21:39:14 +0100
Date: Thu, 3 Feb 2022 21:39:14 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220203203914.GX457876@scaer>
References: <20220202235020.782745-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220202235020.782745-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-python: set
 _PYTHON_PROJECT_BASE
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

James, All,

On 2022-02-02 16:50 -0700, James Hilliard spake thusly:
> This variable is supposed to be set when cross compiling and is
> now required by setuptools to be set correctly after the latest
> version bump.
> 
> Fixes:
> http://autobuild.buildroot.net/results/2e8/2e8093e68d04e8cbb20b095068b24c8bbe5f69ad
> http://autobuild.buildroot.net/results/9e3/9e3cfddb651a59d7f2d04bc88e6fff2a06e9b465
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/pkg-python.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/pkg-python.mk b/package/pkg-python.mk
> index 22ea77352c..00bdb9150a 100644
> --- a/package/pkg-python.mk
> +++ b/package/pkg-python.mk
> @@ -33,6 +33,7 @@ PKG_PYTHON_DISTUTILS_ENV = \
>  	LDSHARED="$(TARGET_CROSS)gcc -shared" \
>  	PYTHONPATH="$(if $(BR2_PACKAGE_PYTHON3),$(PYTHON3_PATH),$(PYTHON_PATH))" \
>  	PYTHONNOUSERSITE=1 \
> +	_PYTHON_PROJECT_BASE="$(if $(BR2_PACKAGE_PYTHON3),$(PYTHON3_DIR),$(PYTHON_DIR))" \
>  	_PYTHON_SYSCONFIGDATA_NAME="$(PKG_PYTHON_SYSCONFIGDATA_NAME)" \
>  	_python_sysroot=$(STAGING_DIR) \
>  	_python_prefix=/usr \
> @@ -60,6 +61,7 @@ HOST_PKG_PYTHON_DISTUTILS_INSTALL_OPTS = \
>  
>  # Target setuptools-based packages
>  PKG_PYTHON_SETUPTOOLS_ENV = \
> +	_PYTHON_PROJECT_BASE="$(if $(BR2_PACKAGE_PYTHON3),$(PYTHON3_DIR),$(PYTHON_DIR))" \
>  	_PYTHON_SYSCONFIGDATA_NAME="$(PKG_PYTHON_SYSCONFIGDATA_NAME)" \
>  	PATH=$(BR_PATH) \
>  	$(TARGET_CONFIGURE_OPTS) \
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
