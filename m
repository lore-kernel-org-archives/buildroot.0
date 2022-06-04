Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 826F1C433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Jun 2022 16:34:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA05B4196D;
	Sat,  4 Jun 2022 16:34:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xZPwRGNI710H; Sat,  4 Jun 2022 16:34:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA93A4194F;
	Sat,  4 Jun 2022 16:34:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BF8AF1BF3E9
 for <buildroot@lists.busybox.net>; Sat,  4 Jun 2022 16:34:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AE4C0611AB
 for <buildroot@lists.busybox.net>; Sat,  4 Jun 2022 16:34:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L_qzDlpsHZxw for <buildroot@lists.busybox.net>;
 Sat,  4 Jun 2022 16:34:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ADA63607B0
 for <buildroot@buildroot.org>; Sat,  4 Jun 2022 16:34:10 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:e086:bc2a:8b9d:c22])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id DA58B5FF20;
 Sat,  4 Jun 2022 18:34:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1654360448;
 bh=CxOj6UYxaab2bn8wsXJQaNeNdrlcnmQU1IALqlBTmPY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vPJjrMVdcQug+zFa7yNWWzqZOQsIQZ/3jGWJOy6EdJirzDZRcuthHpJyUsIfUYMg3
 rsO6Iq36Jl9KHE87Y7meKw9e70MPJjER2V3YGcnCOOmq+YMa6MZiW8RC5KOewQ3H08
 WtYkHSIn/PDe8ki0+V1aYtUgNO36DwjmeJacHUb/31hG85W29ODVy72FU7ekvuS8Ei
 6PDHCbseu6AJ7I5M89LTyDtt8/iaexj/zGYGlzrE6WqdSeZpLutDt4NFV6qVRWVKRM
 OvE+zCHUVeQeFWJjEHkxEJVs/WtLGLFRXTxu/hUSDx6exdacLp8g9PxLhYXPuSt/z6
 Pd7F1Gd2C3wWA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 04 Jun 2022 18:34:04 +0200
Date: Sat, 4 Jun 2022 18:34:04 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Christian Stewart <christian@paral.in>
Message-ID: <20220604163404.GO427639@scaer>
References: <20220521035129.493797-1-christian@paral.in>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220521035129.493797-1-christian@paral.in>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/go: set goos variable to linux
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

Christian, All,

On 2022-05-20 20:51 -0700, Christian Stewart via buildroot spake thusly:
> This commit fixes a build error when the host environment has GOOS set to
> something other than "linux." For example,
> 
> cd ./buildroot
> GOOS="js" make
> 
> This will cause a build failure. Override GOOS to be either empty for host
> packages or set to "linux" for target packages.
> 
> Signed-off-by: Christian Stewart <christian@paral.in>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/go/go.mk | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/go/go.mk b/package/go/go.mk
> index 305a4926ee..f9445c7dd3 100644
> --- a/package/go/go.mk
> +++ b/package/go/go.mk
> @@ -73,6 +73,7 @@ endif
>  HOST_GO_TOOLDIR = $(HOST_GO_ROOT)/pkg/tool/linux_$(GO_GOARCH)
>  HOST_GO_TARGET_ENV = \
>  	$(HOST_GO_COMMON_ENV) \
> +	GOOS="linux" \
>  	GOARCH=$(GO_GOARCH) \
>  	GOCACHE="$(HOST_GO_TARGET_CACHE)" \
>  	CC="$(TARGET_CC)" \
> @@ -95,6 +96,7 @@ endif
>  HOST_GO_CROSS_ENV = \
>  	CC_FOR_TARGET="$(TARGET_CC)" \
>  	CXX_FOR_TARGET="$(TARGET_CXX)" \
> +	GOOS="linux" \
>  	GOARCH=$(GO_GOARCH) \
>  	$(if $(GO_GO386),GO386=$(GO_GO386)) \
>  	$(if $(GO_GOARM),GOARM=$(GO_GOARM)) \
> @@ -109,6 +111,7 @@ endif # BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
>  # For the convenience of host golang packages
>  HOST_GO_HOST_ENV = \
>  	$(HOST_GO_COMMON_ENV) \
> +	GOOS="" \
>  	GOARCH="" \
>  	GOCACHE="$(HOST_GO_HOST_CACHE)" \
>  	CC="$(HOSTCC_NOCCACHE)" \
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
