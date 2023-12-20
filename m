Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 442EAC3DA6E
	for <buildroot@archiver.kernel.org>; Wed, 20 Dec 2023 13:56:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB1CB40950;
	Wed, 20 Dec 2023 13:56:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB1CB40950
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gNouMi7QQTdM; Wed, 20 Dec 2023 13:56:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F22C40915;
	Wed, 20 Dec 2023 13:56:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F22C40915
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 74EFE1BF292
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 13:56:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 102A96148D
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 13:56:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 102A96148D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4RhbjoDTGoZt for <buildroot@lists.busybox.net>;
 Wed, 20 Dec 2023 13:56:45 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3FC7B61047
 for <buildroot@buildroot.org>; Wed, 20 Dec 2023 13:56:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3FC7B61047
Received: by mail.gandi.net (Postfix) with ESMTPSA id 42EA0E0005;
 Wed, 20 Dec 2023 13:56:42 +0000 (UTC)
Date: Wed, 20 Dec 2023 14:56:41 +0100
To: "J. Langholz" <jlangholzj@gmail.com>
Message-ID: <20231220145641.39b93844@windsurf>
In-Reply-To: <20231220134816.6306-1-jlangholzj@gmail.com>
References: <20231220134816.6306-1-jlangholzj@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703080602;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=50z5NrRyzWXR7MkdPeMPt9Il74YZDsxufkk273A+aj0=;
 b=AbWnMUumwSGluaGPfJQvuE23Gj0HGf4GGXUP85yKmXsIxWbfFnfHNZct84ZRL0wk+VuLyF
 VLu+KVTmXPBv6qy/1KSj0AstaaTVwm0aV1GwK4VnDNz6f2u4kFTn9erNqHtm5cawZSSV42
 /BSgl0sHdSg1PKCPofnfKNJZhMegUHoKZWQwYUkD+B6gdwpG7U1U4L1+31XR4k9GKUBT3Y
 GwTDr1+ugX3jaa08YSl4GxYSFibQCQciOQeOrAWrfOd6GCRZM10PolRdKlngIbCeLYH708
 L8xjAY3Zh8+oC3cMZ5WHhPTyEZ7tuw8pzD87L5Jzddi/OJj4ejKEqHBBigjuYw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=AbWnMUum
Subject: Re: [Buildroot] [PATCH] package/python3: add tk as core module
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

Thanks for your contribution. See below a comment.

On Wed, 20 Dec 2023 08:48:14 -0500
"J. Langholz" <jlangholzj@gmail.com> wrote:

> ---
>  package/python3/Config.in  | 6 ++++++
>  package/python3/python3.mk | 9 +++++++--
>  2 files changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/package/python3/Config.in b/package/python3/Config.in
> index 38f0580aa4..65afd4e6e2 100644
> --- a/package/python3/Config.in
> +++ b/package/python3/Config.in
> @@ -108,6 +108,12 @@ config BR2_PACKAGE_PYTHON3_SQLITE
>  	help
>  	  SQLite database support
>  
> +config BR2_PACKAGE_PYTHON3_TK
> +	bool "tk module"
> +	select BR2_PACKAGE_TK
> +	help
> +	  tk (a.k.a. tkinter) module support
> +
>  config BR2_PACKAGE_PYTHON3_PYEXPAT
>  	bool "xml module"
>  	select BR2_PACKAGE_EXPAT
> diff --git a/package/python3/python3.mk b/package/python3/python3.mk
> index b9c5054a21..ca797f8cda 100644
> --- a/package/python3/python3.mk
> +++ b/package/python3/python3.mk
> @@ -20,7 +20,6 @@ HOST_PYTHON3_CONF_OPTS += \
>  	--without-ensurepip \
>  	--without-cxx-main \
>  	--disable-sqlite3 \
> -	--disable-tk \

This is affecting the host package, but you're not adding host-tk to
the dependencies. Do we need a host python with TK support to be able
to build a target Python with TK support? (I don't think we do).

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
