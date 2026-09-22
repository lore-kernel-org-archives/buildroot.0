Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48766C982FA
	for <buildroot@archiver.kernel.org>; Tue, 22 Sep 2026 20:27:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1705607F3;
	Tue, 22 Sep 2026 20:27:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hKi5eHqsmpbN; Tue, 22 Sep 2026 20:27:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org AC8776067D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790108833;
	b=FDYHkTNv7/A/lGHpfNswo2bXk9jrCgzFbn6068pdIGFjO8BVQEYf/+70cGohlcA+LpeM
	 yR3aEzDSFx/rUEiYcTxsG46casaW8iXx+QV9mZPsqGLEPCgHKjlotzQrp7BZtwSEhXtpE
	 8PlK6X8ta/mTfQl7HlqQHnrZBYEIGSdX3UVu2iWb7BYWVLL8JmtgNAbxSkjsl1MBA4Mfx
	 5hH4N5smsdK5OyRUqs3Yi/G9JSfGVs2C/9f6HYBufQfgvbqWvAptYPKhgyDQW9wWXvyIn
	 sMULcyLodn60mEEc8LQ1B18rCzWebZcXm/W1h/ZjA5CMdOrMxXj20Tk0sPUIJEiaOMw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790108833;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=cSKjnBzLGbIZM6LoVBR00/ilgazDpyD+8z8yyWmfyok=;
	b=OIOt38sBNNYIYv6H/Rzew0e3/mpiW/gkzJbJGvxnhc1sAgE2VHEbTHJiA9PMkggo7g/d
	 1laDPt1AjRKUcoLsuzsXh5HIxpnA6kT1XHbdT7+Jt2cYRhjmutnQqmGrPSdsq3jGgQ3uX
	 AB9vrMra2+zSTZ0gJnlbjJRQ0ToH9/XG2S5akX5/xNibsWQNqKFCIvbxOwYAfytItqFoo
	 m9pJMxsNbGsXr0MEpUJ4GQke1qbdgtDtHPvJzxMVXybPlnRoxbWQUKGQqPoo5d6PyvnX0
	 dkJYCEUoKnCQzOSq1i5cPEJPqIBRi9Xxu9BCyTPnXnB7+gYlraMn8l84TcmwTt7cTjw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790108833;
	bh=cSKjnBzLGbIZM6LoVBR00/ilgazDpyD+8z8yyWmfyok=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=YuNZbGniArwGANIDo15HvNklXjMTMlMJ4lTM8c+E2ZFN7bkSWbxLtfB30olg0smmE
	 swfNIg90+SSEYreH7GJpQeRFOLwAYKZKMpHGe1pJEIGUZAS1ZOEDElCApsvWeMCjP6
	 Y0K7wXmOEs1IVpKgkFNsc14AkKvBAXPRW7ufT9pCIt1ggCG2VNbgyyzs2XtK6rZs1x
	 G8C5JDzkrEPDqSDplQAQzAbT9sDpMBSLkUezh3CjO0vXUz6y+67QFRwDWPC1dbJ+2H
	 LA0jTerJ9oeDasdDAPrOiFNirTZgbql+nbNVmkHlI9dKyLApRUv5ZdDPXlrEib77ou
	 MhH0B2zYEgT4g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC8776067D;
	Tue, 22 Sep 2026 20:27:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DEFF9355
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 20:27:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D10D1406AE
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 20:27:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5r6pK9ZWQc7C for <buildroot@buildroot.org>;
 Tue, 22 Sep 2026 20:27:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 8B965406A8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790108831;
 b=OiH7vLCPmfw1TOg1jDy3WvCrafZHYJMJiOKBDupiJvPJNhFSUjDQN8GJ9JnqLHXLwvEM
 InddF8yogtTc9drEzx/6an1qvftRqE4bfI/ZqcM7YJXOF7fhbGQg+6Vm8hRBaVT4bfsJk
 7ngc/bD2b69zbEehEmjX8RyaiosBf/SZUSI7zNmVxnIrUNisht1+L8fEnGqf/TDRfpQLA
 fgp9WNg6APfQbd4uXPtAhrw5nIPORDQrXAtFHmbbVUT1z+RU9nfslbUyz2MoidXOHqFTM
 qbwguZxfyiAMsDWjNENssHog94EvITf40hKWjmzK+QSdnniZQ78K6+FpdNHmViN9MZA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790108831;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=amoP9VCc5kAXui8GUhjZd6pH8bTwKCXbwDz4bEqTve0=;
 b=rZwQplOb0900ztH/fyzNOvy3RkO6dfyxke61pK5isSLW0HuJ4qoOgKH/7RqL0EShD6v6
 06ER8yZxLHvplUSysJ0GQP6SKtaMKGf7PXmd/bPjzQ1nIo4AhJcwZcSxQEukk5b675b7t
 o0HBP59kskIgWtyETy39kANaDNsOT7F0BxMehbyeLmuB5MymJeShJZ5X1PM78rulogMkT
 rt3wcS81m1O67Zoh/z2ahUNYJr+ZP4l2bKiDd37WL7KOKjRWdv0w4YEkLhMCdwa1oKked
 tnmuAv5jm2X7TJ+yLYVxX3JMc1lpbnm/cWtBOWrzvM7zriiqrx56Z8WKW4y+gnOaUoQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=MLUwkj8T; 
 arc=none smtp.remote-ip=212.27.42.1
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8B965406A8
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 20:27:10 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id BE5FAB0053D;
 Tue, 22 Sep 2026 22:27:06 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 22 Sep 2026 22:27:06 +0200
MIME-Version: 1.0
Date: Tue, 22 Sep 2026 22:27:06 +0200
To: Alsey Coleman Miller <alseycmiller@gmail.com>
Cc: buildroot@buildroot.org, Michael Fischer <mf@go-sys.de>
In-Reply-To: <20260816191830.533747-3-alseycmiller@gmail.com>
References: <20260816191830.533747-1-alseycmiller@gmail.com>
 <20260816191830.533747-3-alseycmiller@gmail.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <f4c7a64fc35c4ce6124debd7c9318b6d@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 2/8] package/plutosvg: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Alsey,

On 16/08/2026 21:18, Alsey Coleman Miller wrote:
> plutosvg is a small SVG rendering library built on plutovg.
> 
> PLUTOSVG_ENABLE_FREETYPE is on because the FreeType integration is what
> provides OpenType-SVG rendering - the hooks FreeType calls for the SVG
> glyphs in a colour emoji font - which is what consumers of this library
> generally want it for.
> 
> Signed-off-by: Alsey Coleman Miller <alseycmiller@gmail.com>

When trying to build this new package with "test-pkg -a -p plutosvg",
the cmake configuration fails for the br-arm-full-nothread toolchain.

See:
https://gitlab.com/jolivain/buildroot/-/pipelines/2872694570

Maybe there is some missing build requirements.

Could you have a look, please?

> ---
>  DEVELOPERS                     |  1 +
>  package/Config.in              |  1 +
>  package/plutosvg/Config.in     | 10 ++++++++++
>  package/plutosvg/plutosvg.hash |  3 +++
>  package/plutosvg/plutosvg.mk   | 18 ++++++++++++++++++
>  5 files changed, 33 insertions(+)
>  create mode 100644 package/plutosvg/Config.in
>  create mode 100644 package/plutosvg/plutosvg.hash
>  create mode 100644 package/plutosvg/plutosvg.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 5e39d38fc9..56b01fa5cc 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -170,6 +170,7 @@ F:	package/xen/
> 
>  N:	Alsey Coleman Miller <alseycmiller@gmail.com>
>  F:	package/liblc3/
> +F:	package/plutosvg/
>  F:	package/plutovg/
> 
>  N:	Alvaro G. M <alvaro.gamez@hazent.com>
> diff --git a/package/Config.in b/package/Config.in
> index d98705e981..5e1601036c 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -350,6 +350,7 @@ comment "Graphic libraries"
>  	source "package/mesa3d-headers/Config.in"
>  	source "package/ocrad/Config.in"
>  	source "package/ogre/Config.in"
> +	source "package/plutosvg/Config.in"
>  	source "package/plutovg/Config.in"
>  	source "package/psplash/Config.in"
>  	source "package/sdl/Config.in"
> diff --git a/package/plutosvg/Config.in b/package/plutosvg/Config.in
> new file mode 100644
> index 0000000000..613b1b8ba6
> --- /dev/null
> +++ b/package/plutosvg/Config.in
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_PLUTOSVG
> +	bool "plutosvg"
> +	select BR2_PACKAGE_FREETYPE
> +	select BR2_PACKAGE_PLUTOVG
> +	help
> +	  plutosvg is a small SVG rendering library built on plutovg. It
> +	  is built with the FreeType integration enabled, which is what
> +	  provides OpenType-SVG (colour emoji) rendering.
> +
> +	  https://github.com/sammycage/plutosvg
> diff --git a/package/plutosvg/plutosvg.hash 
> b/package/plutosvg/plutosvg.hash
> new file mode 100644
> index 0000000000..fb6c210e93
> --- /dev/null
> +++ b/package/plutosvg/plutosvg.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated
> +sha256  
> 49d5cfe772d3aa10cd4879f2f6e189f5083c08e4c8ea01bf3d5b87c97dfca7d2  
> plutosvg-0.0.8.tar.gz
> +sha256  
> a55d1e78eaf75779c336b4ba061e74aae56a21195d234474fb24a398935d6ce1  
> LICENSE
> diff --git a/package/plutosvg/plutosvg.mk 
> b/package/plutosvg/plutosvg.mk
> new file mode 100644
> index 0000000000..17142a1eb4
> --- /dev/null
> +++ b/package/plutosvg/plutosvg.mk
> @@ -0,0 +1,18 @@
> +################################################################################
> +#
> +# plutosvg
> +#
> +################################################################################
> +
> +PLUTOSVG_VERSION = 0.0.8
> +PLUTOSVG_SITE = $(call github,sammycage,plutosvg,v$(PLUTOSVG_VERSION))
> +PLUTOSVG_LICENSE = MIT
> +PLUTOSVG_LICENSE_FILES = LICENSE
> +PLUTOSVG_INSTALL_STAGING = YES
> +PLUTOSVG_DEPENDENCIES = host-pkgconf freetype plutovg
> +
> +PLUTOSVG_CONF_OPTS = \
> +	-DPLUTOSVG_ENABLE_FREETYPE=ON \
> +	-DPLUTOSVG_BUILD_EXAMPLES=OFF
> +
> +$(eval $(cmake-package))
> --
> 2.47.3

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
