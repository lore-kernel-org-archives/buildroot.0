Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9C29C3DA7F
	for <buildroot@archiver.kernel.org>; Sun,  4 Aug 2024 06:20:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 56EE7605BE;
	Sun,  4 Aug 2024 06:20:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dse0RiyIVEeS; Sun,  4 Aug 2024 06:20:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 607B2605EF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 607B2605EF;
	Sun,  4 Aug 2024 06:20:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 42B561BF322
 for <buildroot@lists.busybox.net>; Sun,  4 Aug 2024 06:20:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 272EC40398
 for <buildroot@lists.busybox.net>; Sun,  4 Aug 2024 06:20:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id whBbscrFO4iZ for <buildroot@lists.busybox.net>;
 Sun,  4 Aug 2024 06:20:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C06D740394
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C06D740394
Received: from mail.tkos.co.il (wiki.tkos.co.il [84.110.109.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C06D740394
 for <buildroot@buildroot.org>; Sun,  4 Aug 2024 06:20:36 +0000 (UTC)
Received: from localhost (unknown [10.0.8.2])
 by mail.tkos.co.il (Postfix) with ESMTP id 120B344046D;
 Sun,  4 Aug 2024 09:19:10 +0300 (IDT)
To: Joachim Wiberg <troglobit@gmail.com>
In-Reply-To: <20240804060003.735172-1-troglobit@gmail.com> (Joachim Wiberg's
 message of "Sun, 4 Aug 2024 08:00:03 +0200")
References: <20240804060003.735172-1-troglobit@gmail.com>
Date: Sun, 04 Aug 2024 09:20:32 +0300
Message-ID: <87ttg03j2n.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1722752350;
 bh=7uBYnnRP73LPKJBxYvnK/S0oK4SqKRG38sMoD/Dd5jE=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=IDehDq3pe+FwRfVMQbWfmttlFfIUK/dY5HbtSP7QyZefJcBW/wenSa/jFKXq3zsrV
 Fui5nYu3SZIyv7ANF/ak4uqwV1shhFlEyo2VsDrhblKq1HBaqSdo5019RoT+J6l0Wj
 jHwkQzs2MA6DBIlG0XyVeG3WT9KSunRNRXdcc+0BbKgskgRM54tucwOzFe4dIyeIFC
 r/607zPsk53Sk6Jz8ij+rKW7G99ANMHJ5B0e81jw+BXMZXMyV1tXgTtBUP0thrvNZu
 b+0vXgbAaw4oBvsgBQUsV1R4Fg3We+ORT39YGc8r0jFtd3osKz34BFLxYTwB9T8uJo
 D/SsYcDNn+HXg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=IDehDq3p
Subject: Re: [Buildroot] [PATCH 1/1] package/spdlog: add menuconfig option
 to use bundled fmt
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Joachim,

On Sun, Aug 04 2024, Joachim Wiberg wrote:
> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
> ---
>  package/spdlog/Config.in | 10 ++++++++++
>  package/spdlog/spdlog.mk |  9 +++++++--
>  2 files changed, 17 insertions(+), 2 deletions(-)
>
> diff --git a/package/spdlog/Config.in b/package/spdlog/Config.in
> index 877c1b6ab7..170e17a4f1 100644
> --- a/package/spdlog/Config.in
> +++ b/package/spdlog/Config.in
> @@ -9,6 +9,16 @@ config BR2_PACKAGE_SPDLOG
>  
>  	  https://github.com/gabime/spdlog
>  
> +if BR2_PACKAGE_SPDLOG
> +
> +config BR2_PACKAGE_SPDLOG_FMT_EXTERNAL
> +	bool "Use external fmt library"
> +	default y
> +	help
> +	  Use external or bundled fmt library, default external.

What is the advantage of bundled library? The commit log should explain
that.

Also, you should probably move 'select BR2_PACKAGE_FMT' here. We don't
have to build fmt if spdlog doesn't use it.

> +
> +endif
> +
>  comment "spdlog needs a toolchain w/ C++, threads, wchar"
>  	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
>  		|| !BR2_USE_WCHAR
> diff --git a/package/spdlog/spdlog.mk b/package/spdlog/spdlog.mk
> index 6b24357697..c2832c94f3 100644
> --- a/package/spdlog/spdlog.mk
> +++ b/package/spdlog/spdlog.mk
> @@ -13,8 +13,13 @@ SPDLOG_DEPENDENCIES = fmt
>  SPDLOG_CONF_OPTS += \
>  	-DSPDLOG_BUILD_TESTS=OFF \
>  	-DSPDLOG_BUILD_EXAMPLE=OFF \
> -	-DSPDLOG_BUILD_BENCH=OFF \
> -	-DSPDLOG_FMT_EXTERNAL=ON
> +	-DSPDLOG_BUILD_BENCH=OFF
> +
> +ifeq ($(BR2_PACKAGE_SPDLOG_FMT_EXTERNAL),y)
> +SPDLOG_CONF_OPTS += -DSPDLOG_FMT_EXTERNAL=ON

fmt dependency should also move here.

> +else
> +SPDLOG_CONF_OPTS += -DSPDLOG_FMT_EXTERNAL=OFF
> +endif
>  
>  ifeq ($(BR2_STATIC_LIBS),y)
>  SPDLOG_CONF_OPTS += -DSPDLOG_BUILD_SHARED=OFF

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
