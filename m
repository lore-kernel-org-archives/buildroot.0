Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 731B8E77374
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 14:14:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F21EA83DF2;
	Sat, 30 Sep 2023 14:14:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F21EA83DF2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CL-rAvwcMXIz; Sat, 30 Sep 2023 14:14:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B53EA83E03;
	Sat, 30 Sep 2023 14:14:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B53EA83E03
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 70A101BF36F
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 14:14:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 56A5041B6F
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 14:14:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56A5041B6F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QXCi43zGKtWW for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 14:14:03 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A12B241B55
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 14:14:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A12B241B55
Received: by mail.gandi.net (Postfix) with ESMTPSA id 937861C0002;
 Sat, 30 Sep 2023 14:14:00 +0000 (UTC)
Date: Sat, 30 Sep 2023 16:13:59 +0200
To: Charles Hardin <ckhardin@gmail.com>
Message-ID: <20230930161359.21efa1af@windsurf>
In-Reply-To: <20230620174321.4774-1-ckhardin@gmail.com>
References: <20230620174321.4774-1-ckhardin@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1696083240;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=haSHH88O22GjW6u3gEf9ijpH8fuuoL7pyz2v7l0vD30=;
 b=RtYe+xTACQNqo8iO4K940e9CDlJjiw+fHRCnrvD655YEb3hVZJMBq3kP0KhqZXWf0lRjO+
 L8QKo7KI3FfNmTOlKa6oshE3niRulorr1RTuGfHfD/TYMvZyBkSjwpcoMvssdPKGe43NCQ
 nLKF63I4/Tt44xRNE51gyBOEi27JXZdCiobDvVDKOi5jga0S2zEF2MtdznUL3AEpgDLM2i
 sNOjmJbwanhTsCFTDNFs+uQShsEDttnLnodWCMllEvUIo/I55I4RoHAwa/l+F1fNG8fFPw
 GMGbI9JKV8c9/Lk0qI+t+2NZkEl3N6SEja7iQYNT2btyVx5Dl2D8fVVpxib4FA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RtYe+xTA
Subject: Re: [Buildroot] [PATCH 1/1] package/sdbus-cpp: add support to build
 the host stub generator
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
Cc: Sergey Bobrenok <bobrofon@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Charles,

On Tue, 20 Jun 2023 10:43:21 -0700
Charles Hardin <ckhardin@gmail.com> wrote:

> Add a host option to build the xml2cpp-codegen part of the
> sdbus-cpp package for use in creating adaptor and proxy
> implementations from the D-Bus IDL.
> 
> Signed-off-by: Charles Hardin <ckhardin@gmail.com>

I've applied, with some small changes, see below.

> diff --git a/package/sdbus-cpp/Config.in.host b/package/sdbus-cpp/Config.in.host
> new file mode 100644
> index 0000000000..79402af441
> --- /dev/null
> +++ b/package/sdbus-cpp/Config.in.host
> @@ -0,0 +1,14 @@
> +config BR2_PACKAGE_HOST_SDBUS_CPP
> +	bool "host-sdbus-c++-xml2cpp"

Changed to:

	bool "host sdbus-c++"

> +	depends on BR2_INSTALL_LIBSTDCPP

Not relevant, as we are a host package, while BR2_INSTALL_LIBSTDCPP
indicates availability of C++ support in the cross-compiler.

> +	depends on BR2_PACKAGE_HOST_SYSTEMD

Not needed for host packages.

> +	select BR2_PACKAGE_HOST_PKGCONF

Same.

> diff --git a/package/sdbus-cpp/sdbus-cpp.mk b/package/sdbus-cpp/sdbus-cpp.mk
> index 0e8d74cfcd..ece18126ba 100644
> --- a/package/sdbus-cpp/sdbus-cpp.mk
> +++ b/package/sdbus-cpp/sdbus-cpp.mk
> @@ -12,4 +12,13 @@ SDBUS_CPP_DEPENDENCIES = host-pkgconf systemd
>  SDBUS_CPP_LICENSE = LGPL-2.1+ with exception (headers)
>  SDBUS_CPP_LICENSE_FILES = COPYING COPYING-LGPL-Exception
>  
> +# Host build for sdbus-c++-xml2cpp
> +HOST_SDBUS_CPP_DEPENDENCIES = host-pkgconf host-systemd

It's pretty silly that host-systemd is needed, because in fact the host
sdbus-c++-xml2cpp is not linked against the sdbus-c++ library, and only
the sdbus-c++ library needs libsystemd. But oh well, since anyway
systemd+host-systemd are built for target sdbus-c++, there's in
practice no overhead.

> +HOST_SDBUS_CPP_CONF_OPTS += \

                            ^^ Changed to just =

Applied with those changes, thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
