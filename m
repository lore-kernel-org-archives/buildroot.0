Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3128EC7EE22
	for <buildroot@archiver.kernel.org>; Mon,  8 May 2023 20:42:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB4784288E;
	Mon,  8 May 2023 20:42:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB4784288E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y-H58jMbfn60; Mon,  8 May 2023 20:42:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9388941E4E;
	Mon,  8 May 2023 20:42:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9388941E4E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2D5501BF34E
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 20:42:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EB46041E4E
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 20:42:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB46041E4E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HBG-DhVjSuzX for <buildroot@lists.busybox.net>;
 Mon,  8 May 2023 20:42:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9334141E33
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9334141E33
 for <buildroot@buildroot.org>; Mon,  8 May 2023 20:42:50 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:89f6:f9b6:d1a9:3e6e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 6C26A78035B;
 Mon,  8 May 2023 22:42:44 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 08 May 2023 22:42:44 +0200
Date: Mon, 8 May 2023 22:42:44 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Maksim Kiselev <bigunclemax@gmail.com>
Message-ID: <20230508204244.GR252090@scaer>
References: <20230426161402.3251010-1-bigunclemax@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230426161402.3251010-1-bigunclemax@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683578567;
 bh=dkpwBL2eCBa2gM1uBlFsk2+q1cWPxxJhiXnBQnPq5oE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HylBC50UdBbGx9Kq+wlJc6cHaRYTVd5A373a0OwgOFtvr8h0e6Zcyl3dZoZ+Lz98W
 DsqMvuEnfWybIR8cGWN7jqnw9g63n3b4cWX+cQ9zFE2PqPaAE7ZG81+S75uyp0SO1r
 mX596a1+pEAIJ+WEcoigacve9mfdt21QMaRgPSQVdNP94Pbbt9sAmks1H2BfHLG923
 q30yMJKMG8aSx6z8x1+j1FcRpBKA4dBT4lK5FNv0PBVkFpXtQrCpMtTk7TJ/BafLiz
 Gwjsp+mfF1rz35NM7iQCrmd6K+Zo/onzulZiKxwXSLVRgltMa1DrD6oNiX8O9gg08z
 gu3Apfvx8BTfg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=HylBC50U
Subject: Re: [Buildroot] [PATCH] package/libdatachannel: new package
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
Cc: Samuel Martin <s.martin49@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Maxim, All,

On 2023-04-26 19:14 +0300, Maksim Kiselev spake thusly:
> This patch adds a new package for libdatachannel.
> 
> libdatachannel is an open-source software library implementing WebRTC Data
> Channels, WebRTC Media Transport, and WebSockets. It is written in C++17
> and offers C bindings.
> 
> Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>

Thanks for this new package. Please see below for a quick review...

[--SNIP--]
> diff --git a/package/Config.in b/package/Config.in
> index eaac32a01a..c323409e37 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1408,6 +1408,7 @@ menu "Audio/Sound"
>  	source "package/libcodec2/Config.in"
>  	source "package/libcue/Config.in"
>  	source "package/libcuefile/Config.in"
> +	source "package/libdatachannel/Config.in"

I would have added that in the network category, rather than the
audio/sound one.

[--SNIP--]
> diff --git a/package/libdatachannel/libdatachannel.mk b/package/libdatachannel/libdatachannel.mk
> new file mode 100644
> index 0000000000..d86eed9bef
> --- /dev/null
> +++ b/package/libdatachannel/libdatachannel.mk
> @@ -0,0 +1,32 @@
> +################################################################################
> +#
> +# libdatachannel
> +#
> +################################################################################
> +
> +LIBDATACHANNEL_VERSION = v0.18.3
> +LIBDATACHANNEL_SITE_METHOD = git
> +LIBDATACHANNEL_SITE = https://github.com/paullouisageneau/libdatachannel
> +LIBDATACHANNEL_GIT_SUBMODULES = YES
> +LIBDATACHANNEL_INSTALL_STAGING = YES
> +LIBDATACHANNEL_LICENSE = MPL-2.0
> +LIBDATACHANNEL_LICENSE_FILES = LICENSE
> +
> +LIBDATACHANNEL_CONF_OPTS = -DPREFER_SYSTEM_LIB=1

I think I understand what this means, but please explain it the commit
log why we need to do so. Also, as the name if "prefer", what happens if
a system dependency is not present? Does it fallback to the bundled one?

So, it would be better to explicitly disable all options that use
bundled dependencies (e.g. juice, et al.).

Bulding tests is not necessary either, so they should be disable
(-DNO_TESTS=1)

> +ifeq ($(BR2_PACKAGE_JSON_FOR_MODERN_CPP),y)
> +LIBDATACHANNEL_CONF_OPTS += -DUSE_SYSTEM_JSON=1
> +LIBDATACHANNEL_DEPENDENCIES += json-for-modern-cpp
> +endif

Unlesss this is not supported by the package buildsystem, we want to
pass explicit disabling of options:

    ifeq ($(BR2_PACKAGE_JSON_FOR_MODERN_CPP),y)
    LIBDATACHANNEL_CONF_OPTS += -DUSE_SYSTEM_JSON=1
    LIBDATACHANNEL_DEPENDENCIES += json-for-modern-cpp
    else
    LIBDATACHANNEL_CONF_OPTS += -DUSE_SYSTEM_JSON=0
    endif

(and so on for the other two).

Care to fix and respin, please?

Regards,
Yann E. MORIN.

> +ifeq ($(BR2_PACKAGE_LIBNICE),y)
> +LIBDATACHANNEL_CONF_OPTS += -DUSE_NICE=1
> +LIBDATACHANNEL_DEPENDENCIES += libnice
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LIBSRTP),y)
> +LIBDATACHANNEL_CONF_OPTS += -DUSE_SYSTEM_SRTP=1
> +LIBDATACHANNEL_DEPENDENCIES += libsrtp
> +endif
> +
> +$(eval $(cmake-package))
> -- 
> 2.39.2
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
