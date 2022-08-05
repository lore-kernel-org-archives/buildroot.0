Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88ADBC00140
	for <buildroot@archiver.kernel.org>; Fri,  5 Aug 2022 14:35:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A001C41E04;
	Fri,  5 Aug 2022 14:35:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A001C41E04
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OsgY7KD3WAv4; Fri,  5 Aug 2022 14:35:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74C2341DB5;
	Fri,  5 Aug 2022 14:35:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 74C2341DB5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 049561BF868
 for <buildroot@lists.busybox.net>; Fri,  5 Aug 2022 14:35:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 96D8841DB5
 for <buildroot@lists.busybox.net>; Fri,  5 Aug 2022 14:35:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96D8841DB5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JRbJg10TOCJu for <buildroot@lists.busybox.net>;
 Fri,  5 Aug 2022 14:35:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C775B41DCA
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C775B41DCA
 for <buildroot@buildroot.org>; Fri,  5 Aug 2022 14:34:59 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B4BA2240004;
 Fri,  5 Aug 2022 14:34:53 +0000 (UTC)
Date: Fri, 5 Aug 2022 16:34:52 +0200
To: Dominik Michael Rauh <dmrauh@posteo.de>
Message-ID: <20220805163452.4e0d3dd4@windsurf>
In-Reply-To: <20220805131341.13391-1-dmrauh@posteo.de>
References: <20220805102442.8590-1-dmrauh@posteo.de>
 <20220805131341.13391-1-dmrauh@posteo.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659710097;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eKrAVZ/sbBgIiK4FHqIlduJn4XRLbjo2o3qNbWsI5ko=;
 b=p4CPRDlpfiDuWIeocnuEzNbG/PqczvKTsyr/NTlGHLI3xl+/vLX6qorDrtVej5LKwqqtbH
 pKYEKBt8xD3CfuZ2Vd5ah6BmO1foUGRCpyIzLXDzpMoHRgBEVkzJdibFZYb6qpGbw/P+vA
 uwkTOc/7Sol94/xTseio9UO4/tFglfvF7JDN9DSuHvqUDLex6sUt/EnCpb07IWPU8RlHLk
 vfvj0oyqq0/Ljl5l9+2sCNx0cy8HGJ6ipWY2FCW4HPa1b4iR7bAoxeHxuKEawFaKvJxiDD
 ShSOEY/SzBh+WcLuOn6SSZ6pObocEq40JEAjs4n+YfSHKbzovw5OEWfYkr5KRg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=p4CPRDlp
Subject: Re: [Buildroot] [PATCH v3] package/ccache: bump version to 4.6.1
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
Cc: Anders F =?UTF-8?B?QmrDtnJrbHVuZA==?= <anders.f.bjorklund@gmail.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>, buildroot@buildroot.org,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

Thanks for your work!

I did not do a thorough review, but I spotted something that needs to
be change, see below.

On Fri,  5 Aug 2022 13:13:41 +0000
Dominik Michael Rauh <dmrauh@posteo.de> wrote:

> +config BR2_CCACHE_REDIS_BACKEND
> +	bool "Enable Redis storage backend"
> +	default n

This is not needed, the default for an option is to be disabled.

> +	select BR2_PACKAGE_HIREDIS

This is not correct, as it enables hiredis for the target, which we
don't want. Just don't select anything here.

> +HOST_CCACHE_CONF_OPTS += \
> +	-UCMAKE_C_COMPILER_LAUNCHER \
> +	-UCMAKE_CXX_COMPILER_LAUNCHER

Just curious, what are these doing?

> diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
> index 053658fad6..eae12c1465 100644
> --- a/package/cmake/cmake.mk
> +++ b/package/cmake/cmake.mk
> @@ -40,9 +40,16 @@ CMAKE_CONF_OPTS = \
>  HOST_CMAKE_CFLAGS = $(shell echo $(HOST_CFLAGS) | sed -r "s%$(HOST_CPPFLAGS)%%")
>  HOST_CMAKE_CXXFLAGS = $(shell echo $(HOST_CXXFLAGS) | sed -r "s%$(HOST_CPPFLAGS)%%")
>  
> +# we are built before ccache
> +HOST_CMAKE_CONFIGURE_OPTS = \
> +	$(HOST_CONFIGURE_OPTS) \
> +	CC="$(HOSTCC_NOCCACHE)" \
> +	GCC="$(HOSTCC_NOCCACHE)" \
> +	CXX="$(HOSTCXX_NOCCACHE)"
> +
>  define HOST_CMAKE_CONFIGURE_CMDS
>  	(cd $(@D); \
> -		$(HOST_CONFIGURE_OPTS) \
> +		$(HOST_CMAKE_CONFIGURE_OPTS) \

It's really a pity that we need to disable ccache support to build
host-cmake, because host-cmake is notoriously slow to build... But
obviously since ccache is now using cmake as its build system, I don't
really see a much better solution.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
