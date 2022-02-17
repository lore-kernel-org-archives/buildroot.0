Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB431C43217
	for <buildroot@archiver.kernel.org>; Thu, 17 Feb 2022 20:33:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B0EA96F764;
	Thu, 17 Feb 2022 20:33:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rq0M0JXUKaxZ; Thu, 17 Feb 2022 20:33:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE8D46F747;
	Thu, 17 Feb 2022 20:33:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C19451BF3B5
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 20:33:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BDE788138C
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 20:33:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J34h5XuBtUs3 for <buildroot@lists.busybox.net>;
 Thu, 17 Feb 2022 20:33:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E214D8132E
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 20:33:42 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:d44f:202d:8a3e:695f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 55A0113F838;
 Thu, 17 Feb 2022 21:33:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1645130019;
 bh=JpFo3lKR/5TFC7/Ae482nXUEJgeH9MSaIC5M3zuZC2g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GPpzFk+NKtyVyAAKOaJHFkb/a91/wQ+6ZnK6qWws16D0jJWGJNGsA8Ea03FlwzysO
 yOAmwEdOU3NVogEUDtYzSetKyQYEnIfuTUfDNmtgTKj1ZYdkBgWAM1pZmoUK8wJCYS
 Z0iun7Qd5wQeBsc4HXXQA+3/OPYqM3sMwjC/GAx1Yw2UoPPMdU46GVbJ6LskMTTNIz
 DXOecCGlg81IEZAi2QXEa0YP+jgaBPHvoWTx1uGeHgXpW9eeFbUI1i7DJAwYY0+RpW
 yFHli50OpPe4N3ZHLWac8eJh24UQvVGfYFkBfSE+Is0E7TARduptjE5I9kNWHkVpZH
 Xgs7MgwIt04CA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 17 Feb 2022 21:33:35 +0100
Date: Thu, 17 Feb 2022 21:33:35 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20220217203335.GG522310@scaer>
References: <20220217182202.11640-1-peter@korsgaard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220217182202.11640-1-peter@korsgaard.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/pkg-python.mk: drop references to
 PYTHON_{PATH, DIR}
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

Peter, All,

On 2022-02-17 19:21 +0100, Peter Korsgaard spake thusly:
> With python 2.x support dropped these variables no longer exist, so
> unconditionally use the python3 variant.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/pkg-python.mk | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/pkg-python.mk b/package/pkg-python.mk
> index 02df061a19..b8dc9cd9e5 100644
> --- a/package/pkg-python.mk
> +++ b/package/pkg-python.mk
> @@ -38,10 +38,10 @@ PKG_PYTHON_DISTUTILS_ENV = \
>  	PATH=$(BR_PATH) \
>  	$(TARGET_CONFIGURE_OPTS) \
>  	LDSHARED="$(TARGET_CROSS)gcc -shared" \
> -	PYTHONPATH="$(if $(BR2_PACKAGE_PYTHON3),$(PYTHON3_PATH),$(PYTHON_PATH))" \
> +	PYTHONPATH="$(PYTHON3_PATH)" \
>  	PYTHONNOUSERSITE=1 \
>  	_PYTHON_HOST_PLATFORM="$(PKG_PYTHON_HOST_PLATFORM)" \
> -	_PYTHON_PROJECT_BASE="$(if $(BR2_PACKAGE_PYTHON3),$(PYTHON3_DIR),$(PYTHON_DIR))" \
> +	_PYTHON_PROJECT_BASE="$(PYTHON3_DIR)" \
>  	_PYTHON_SYSCONFIGDATA_NAME="$(PKG_PYTHON_SYSCONFIGDATA_NAME)" \
>  	_python_sysroot=$(STAGING_DIR) \
>  	_python_prefix=/usr \
> @@ -70,11 +70,11 @@ HOST_PKG_PYTHON_DISTUTILS_INSTALL_OPTS = \
>  # Target setuptools-based packages
>  PKG_PYTHON_SETUPTOOLS_ENV = \
>  	_PYTHON_HOST_PLATFORM="$(PKG_PYTHON_HOST_PLATFORM)" \
> -	_PYTHON_PROJECT_BASE="$(if $(BR2_PACKAGE_PYTHON3),$(PYTHON3_DIR),$(PYTHON_DIR))" \
> +	_PYTHON_PROJECT_BASE="$(PYTHON3_DIR)" \
>  	_PYTHON_SYSCONFIGDATA_NAME="$(PKG_PYTHON_SYSCONFIGDATA_NAME)" \
>  	PATH=$(BR_PATH) \
>  	$(TARGET_CONFIGURE_OPTS) \
> -	PYTHONPATH="$(if $(BR2_PACKAGE_PYTHON3),$(PYTHON3_PATH),$(PYTHON_PATH))" \
> +	PYTHONPATH="$(PYTHON3_PATH)" \
>  	PYTHONNOUSERSITE=1 \
>  	_python_sysroot=$(STAGING_DIR) \
>  	_python_prefix=/usr \
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
