Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BFE1C6379F
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 08:32:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB2418289B;
	Tue, 21 Feb 2023 08:32:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB2418289B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P0CCVH63in0e; Tue, 21 Feb 2023 08:32:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9FA71828A5;
	Tue, 21 Feb 2023 08:32:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9FA71828A5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 96E1F1BF292
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 08:32:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 71A1040A59
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 08:32:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 71A1040A59
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hTDiwfz_ka7Z for <buildroot@lists.busybox.net>;
 Tue, 21 Feb 2023 08:32:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 406C040289
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 406C040289
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 08:32:19 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1F7972000C;
 Tue, 21 Feb 2023 08:32:15 +0000 (UTC)
Date: Tue, 21 Feb 2023 09:32:15 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230221093215.419fcf40@windsurf>
In-Reply-To: <20230220223151.12965-1-fontaine.fabrice@gmail.com>
References: <20230220223151.12965-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1676968336;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5KT8+/ayjR9Fjll91s/CHPGvMpD59ZngDB6PTW/BckA=;
 b=Q9XtZK40mxJSlbvorcxgqOY1IDlRKTQamHnPHfwiAFiIebFlM6seYO6ezcflzkCXvShz1l
 uEBOwYmS83kD7aGLurS3hfmujyleKpH8OcVTf3b/Ke4oJmXO669/VROUxZvBGwRbHX/QfB
 eSK7UvcsYwjaQfc5yUKTw0B/DvcqmkEpYdtknhswIDL7/LSI+p3st/I+m2XdPNd7FaHce2
 d4/E1q17hAMtYQbaSEPzugOEhzsQo16xEnEWA/eJgrVlsnskZSt3kRiIZkhkREPhh965Jt
 P2EyG1T1hnABw3UQHDC50sitqLVg4iGFz9q9s7C9bhi40I+GdDZIIcp4RRPlHw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Q9XtZK40
Subject: Re: [Buildroot] [PATCH v4,
 1/1] package/libmodsecurity: needs dynamic library
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
Cc: Frank Vanbever <frank.vanbever@mind.be>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Fabrice,

On Mon, 20 Feb 2023 23:31:51 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> diff --git a/package/libmodsecurity/Config.in b/package/libmodsecurity/Config.in
> index b15d808759..2186d216f4 100644
> --- a/package/libmodsecurity/Config.in
> +++ b/package/libmodsecurity/Config.in
> @@ -3,7 +3,7 @@ config BR2_PACKAGE_LIBMODSECURITY
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	# libmodsecurity embeds several mbedtls source files

I've expanded a bit this comment, as it was not very clear why this
causes problem with static linking.

> -	depends on !(BR2_STATIC_LIBS && BR2_PACKAGE_LIBCURL_MBEDTLS)
> +	depends on !BR2_STATIC_LIBS
>  	select BR2_PACKAGE_PCRE2
>  	help
>  comment "nginx-modsecurity needs a toolchain w/ C++, threads"
>  	depends on BR2_PACKAGE_NGINX_HTTP
> -	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
> -
> -comment "nginx-modsecurity needs a toolchain w/ dynamic library"
> -	depends on BR2_PACKAGE_NGINX_HTTP
> -	depends on BR2_STATIC_LIBS && BR2_PACKAGE_LIBCURL_MBEDTLS
> +	depends on !BR2_INSTALL_LIBSTDCPP || \
> +		!BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS

Something was wrong here: you forgot to update the comment prompt
itself to mention the dependency on dynamic library.

I fixed both minor issues and applied to master. Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
