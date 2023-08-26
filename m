Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B51AC83F11
	for <buildroot@archiver.kernel.org>; Sat, 26 Aug 2023 19:58:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2865C81F74;
	Sat, 26 Aug 2023 19:58:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2865C81F74
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q9yXBw7k6xko; Sat, 26 Aug 2023 19:58:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C4C481F55;
	Sat, 26 Aug 2023 19:58:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C4C481F55
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A08071BF82C
 for <buildroot@lists.busybox.net>; Sat, 26 Aug 2023 19:58:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 799E381F55
 for <buildroot@lists.busybox.net>; Sat, 26 Aug 2023 19:58:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 799E381F55
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H7UCEc9l9ZEs for <buildroot@lists.busybox.net>;
 Sat, 26 Aug 2023 19:58:26 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 288E081F51
 for <buildroot@buildroot.org>; Sat, 26 Aug 2023 19:58:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 288E081F51
Received: by mail.gandi.net (Postfix) with ESMTPSA id 274BBFF804;
 Sat, 26 Aug 2023 19:58:23 +0000 (UTC)
Date: Sat, 26 Aug 2023 21:58:21 +0200
To: Maksim Kiselev <bigunclemax@gmail.com>
Message-ID: <20230826215821.03533e1b@windsurf>
In-Reply-To: <20230513155030.3207472-2-bigunclemax@gmail.com>
References: <20230513155030.3207472-1-bigunclemax@gmail.com>
 <20230513155030.3207472-2-bigunclemax@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1693079903;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6NuCs5ITrDp6j3y3Biw4OqdFQVHvtph+IIcInr9s8+A=;
 b=Jsw5r7fdtgF4sS0WsDetxpFih5mkYO0PyECjUeYPv98QaoBeJ3Sn0DDp84Ol5T1CSbEg26
 agJloB8xWAliOQHK6woSAuojv/KQWIVhEbBbl4FC+1c7batf8FHGZP/TCpRwlYVd+UGoDh
 2RzpHJk+100a5pVG9j1jZ7cTtLhJtECRaR/KTP3qSnOHWlEK97sSz3BNSg3Rx3V7fM0JnM
 3LDX8DNKe2aKmNyvmm60xO7quUMNgsJyl/vJLrDPqLxkkjKN8XmplI2Ck4o2dARZwsIApD
 eSln4r1UIIDN5s3WkxKQUB1LI7yMDdg5lAS1xBc2Sqj60SgESWADR8SFXzrgdg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Jsw5r7fd
Subject: Re: [Buildroot] [PATCH v2 1/1] package/libdatachannel: new package
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
Cc: Samuel Martin <s.martin49@gmail.com>, "Yann E .
 MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Maksim,

On Sat, 13 May 2023 18:50:30 +0300
Maksim Kiselev <bigunclemax@gmail.com> wrote:

> This patch adds a new package for libdatachannel.
> 
> libdatachannel is an open-source software library implementing WebRTC Data
> Channels, WebRTC Media Transport, and WebSockets. It is written in C++17
> and offers C bindings.
> 
> This library has a lot dependencies.
> Some of them, such as libsrtp and libnice, can be resolved with standalone
> buildroot packages if they enabled. Otherwise dependencies will be satisfy
> by git submodules. Nlohmann JSON dependency will be skipped at all because
> it is only required to build the examples.
> 
> Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>

Thanks for your patch, and sorry for the very slow feedback. See below
some comments. Could you take them into account, and send a v3 of this
patch?

> ---
>  package/Config.in                          |  1 +
>  package/libdatachannel/Config.in           | 10 +++++++
>  package/libdatachannel/libdatachannel.hash |  3 ++
>  package/libdatachannel/libdatachannel.mk   | 34 ++++++++++++++++++++++
>  4 files changed, 48 insertions(+)

Could you please add an entry to the DEVELOPERS file associating you to
this new package?

> diff --git a/package/libdatachannel/Config.in b/package/libdatachannel/Config.in
> new file mode 100644
> index 0000000000..103d933b50
> --- /dev/null
> +++ b/package/libdatachannel/Config.in
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_LIBDATACHANNEL
> +	bool "libdatachannel"
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9 # C++17
> +	depends on !BR2_STATIC_LIBS
> +	select BR2_PACKAGE_OPENSSL
> +	help
> +	  C/C++ WebRTC network library featuring Data Channels,
> +	  Media Transport, and WebSockets.
> +
> +	  https://github.com/paullouisageneau/libdatachannel

You need a Config.in comment to help the user with the dependencies:

comment "libdatachannel needs a toolchain w/ gcc >= 9, dynamic library"
	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_9 || BR2_STATIC_LIBS

> diff --git a/package/libdatachannel/libdatachannel.mk b/package/libdatachannel/libdatachannel.mk
> new file mode 100644
> index 0000000000..b8f25fc1c1
> --- /dev/null
> +++ b/package/libdatachannel/libdatachannel.mk
> @@ -0,0 +1,34 @@
> +################################################################################
> +#
> +# libdatachannel
> +#
> +################################################################################
> +
> +LIBDATACHANNEL_VERSION = v0.18.4
> +LIBDATACHANNEL_SITE_METHOD = git
> +LIBDATACHANNEL_SITE = https://github.com/paullouisageneau/libdatachannel
> +LIBDATACHANNEL_GIT_SUBMODULES = YES
> +LIBDATACHANNEL_INSTALL_STAGING = YES
> +LIBDATACHANNEL_LICENSE = MPL-2.0
> +LIBDATACHANNEL_LICENSE_FILES = LICENSE
> +
> +LIBDATACHANNEL_DEPENDENCIES = libopenssl

You should depend on "openssl", not "libopenssl". Indeed, your package
selects BR2_PACKAGE_OPENSSL, which means you need to use the "openssl"
virtual-package, whose implementation can either be libopenssl (the
original OpenSSL) or libressl.

> +
> +LIBDATACHANNEL_CONF_OPTS = -DNO_EXAMPLES=1 -DNO_TESTS=1 -DUSE_SYSTEM_JSON=0 \
> +	-DUSE_SYSTEM_JUICE=0 -DUSE_SYSTEM_PLOG=0 -DUSE_SYSTEM_USRSCTP=0

We really want to use the system version of all those libraries, by
having separate Buildroot packages for them. This will allow you to
drop LIBDATACHANNEL_GIT_SUBMODULES = YES, and generally have a nicer
packaging.

Could you have a look at doing this?

Thanks a lot!

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
