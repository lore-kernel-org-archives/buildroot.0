Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65A06C433EF
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 18:34:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EECC7410B0;
	Tue,  4 Jan 2022 18:34:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rS5JvuRBi2vN; Tue,  4 Jan 2022 18:34:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42CF74095F;
	Tue,  4 Jan 2022 18:34:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3215C1BF5DB
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 18:34:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 28B0B4092C
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 18:34:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1rG-O6xZbK0m for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 18:34:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BE3C44092B
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 18:33:59 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id w16so152050860edc.11
 for <buildroot@buildroot.org>; Tue, 04 Jan 2022 10:33:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=La6yhDAnLlCUbLoEXfnLDG6yrPmfVXs0Oa1W4eFHm8A=;
 b=X/3OtSJomrjASKwjuB/1Coc8woAn2V2JKqiG+tZErrQV4vm/TNXJupcN3N6Ws56SM2
 TjYIy3NevfW88c16F05QUfp/gn5uSMxDx9861j+TdnOtqWexGRchkfaGcw9vhXwtIUxk
 twHYmTyZUQcUvRskVpos9wW1HP1WOQIvdk8Lezlz7/pzNXMZYU7gTBufy7ZfZwBATsi8
 y46XalWKlI0gsPym7cU7Y9xN44wn5oaoShAzJkg7uLKaGusAxvmWX9KT3IgTDIPb2vrQ
 ozqwQPj5rt4pM/pAJCUGnw1pAdGRJcHd7cgu/eYnbX0d/O02me7eW2chwKF1TUAKFr2W
 glzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=La6yhDAnLlCUbLoEXfnLDG6yrPmfVXs0Oa1W4eFHm8A=;
 b=ixOTSbF1kT1OXj8+nOCpwmJr0pnO7NiCSADPNEIDCe2TD0qeGqz+ukifm4dgNri4fs
 x/X01uGULssgoYDJ2/vZcghwJ5jOhMdzTumcAjkynPc4MwWNLlLqSNX2xwmHt38dkccv
 J43ez6WBiMYuxAUEqw1dM1AdInpIltN+TyD0Kw4ajIq5wlAmWlBtr3u+MTzFeIttyqZ6
 5l/VF6jUQEqaeVPSHRj8sEXWD3SdJF/Q4PxZbOHidgbEb/XjD7ydMZmD8xOrqDKfPzuB
 MYysyHRyv5RG2wL1vNo2fDnM4dl6SvT9SGw9WOmzchsA8vZ/g1D2c7QTmFpxHhP1CsaB
 VpeQ==
X-Gm-Message-State: AOAM532O4muaJYhxj4GFr5oX3LhlJMGQ6Lnv1Jbhu2GSu7R0iF+88m7l
 4ppFRhwlUXTYdcdpz98vBvsX8Bsa0aJbrA==
X-Google-Smtp-Source: ABdhPJw9cUy1JZF5M31qCDItG1/Q7ZRlGkMdGRTV1R3FMbs1exHfwPkWw2lqZ0g9WQSIOv+rm6+PJA==
X-Received: by 2002:a17:907:1b21:: with SMTP id
 mp33mr38806261ejc.580.1641321237972; 
 Tue, 04 Jan 2022 10:33:57 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id hr28sm11761799ejc.186.2022.01.04.10.33.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jan 2022 10:33:57 -0800 (PST)
Message-ID: <c4cc70e9-9875-e929-8c10-c764ec0a4a94@mind.be>
Date: Tue, 4 Jan 2022 19:33:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220104074821.1330228-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220104074821.1330228-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/qt5/qt5webkit: bump to version
 5.212.0-alpha4
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
Cc: Peter Seiderer <ps.report@gmx.net>, Samuel Martin <s.martin49@gmail.com>,
 Julien Corjon <corjon.j@ecagroup.com>,
 =?UTF-8?Q?Ga=c3=abl_Portay?= <gael.portay@collabora.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 04/01/2022 08:48, James Hilliard wrote:
> Switch to latest release in new active upstream:
> https://github.com/qtwebkit/qtwebkit

  Perhaps you can push the remaining patch to upstream then?

> 
> Migrate python2 build to python3.
> 
> Drop patches that are upstream/no longer needed.
> 
> Adapt/add patches to fix build issues.
> 
> Rework build system to use cmake instead of qmake(which does not
> currently support cross compilation).
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

[snip]
> diff --git a/package/qt5/qt5webkit/qt5webkit.mk b/package/qt5/qt5webkit/qt5webkit.mk
> index dd99661be0..3af1918a46 100644
> --- a/package/qt5/qt5webkit/qt5webkit.mk
> +++ b/package/qt5/qt5webkit/qt5webkit.mk
> @@ -4,12 +4,13 @@
>   #
>   ################################################################################
>   
> -QT5WEBKIT_VERSION = 5.9.1
> -QT5WEBKIT_SITE = https://download.qt.io/official_releases/qt/5.9/5.9.1/submodules
> -QT5WEBKIT_SOURCE = qtwebkit-opensource-src-$(QT5WEBKIT_VERSION).tar.xz
> +QT5WEBKIT_VERSION = 5.212.0-alpha4
> +QT5WEBKIT_SITE = https://github.com/qtwebkit/qtwebkit/releases/download/qtwebkit-$(QT5WEBKIT_VERSION)

  Upstream README says:

Use the following repository if you need to get latest snapshots of QtWebKit code:

http://code.qt.io/cgit/qt/qtwebkit.git/

  This repo aslo has a 5.212.0-alpha4 tag. Perhaps we should switch to that?

  Anyway, I applied to master as is.

  Regards,
  Arnout

> +QT5WEBKIT_SOURCE = qtwebkit-$(QT5WEBKIT_VERSION).tar.xz
>   QT5WEBKIT_DEPENDENCIES = \
> -	host-bison host-flex host-gperf host-python host-ruby \
> -	leveldb sqlite
> +	host-bison host-flex host-gperf host-python3 host-ruby gstreamer1 \
> +	gst1-plugins-base icu leveldb jpeg libpng libxml2 libxslt qt5location \
> +	qt5sensors qt5webchannel sqlite webp woff2
>   QT5WEBKIT_INSTALL_STAGING = YES
>   
>   QT5WEBKIT_LICENSE_FILES = Source/WebCore/LICENSE-LGPL-2 Source/WebCore/LICENSE-LGPL-2.1
> @@ -20,30 +21,16 @@ QT5WEBKIT_LICENSE = LGPL-2.1+, BSD-3-Clause, BSD-2-Clause
>   QT5WEBKIT_LICENSE_FILES += LICENSE.LGPLv21
>   
>   ifeq ($(BR2_PACKAGE_QT5BASE_XCB),y)
> -QT5WEBKIT_DEPENDENCIES += xlib_libXext xlib_libXrender
> +QT5WEBKIT_DEPENDENCIES += xlib_libXcomposite xlib_libXext xlib_libXrender
>   endif
>   
>   ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
>   QT5WEBKIT_DEPENDENCIES += qt5declarative
>   endif
>   
> -# QtWebkit's build system uses python, but only supports python2. We work
> -# around this by forcing python2 early in the PATH, via a python->python2
> -# symlink.
> -QT5WEBKIT_CONF_ENV = PATH=$(@D)/host-bin:$(BR_PATH)
> -QT5WEBKIT_MAKE_ENV = PATH=$(@D)/host-bin:$(BR_PATH)
> -define QT5WEBKIT_PYTHON2_SYMLINK
> -	mkdir -p $(@D)/host-bin
> -	ln -sf $(HOST_DIR)/bin/python2 $(@D)/host-bin/python
> -endef
> -QT5WEBKIT_PRE_CONFIGURE_HOOKS += QT5WEBKIT_PYTHON2_SYMLINK
> +QT5WEBKIT_CONF_OPTS += \
> +	-DPORT=Qt \
> +	-DPYTHON_EXECUTABLE=$(HOST_DIR)/bin/python3 \
> +	-DUSE_LIBHYPHEN=OFF
>   
> -QT5WEBKIT_CONF_OPTS = WEBKIT_CONFIG+=use_system_leveldb
> -
> -define QT5WEBKIT_INSTALL_TARGET_EXTRAS
> -	cp -dpf $(@D)/bin/* $(TARGET_DIR)/usr/bin/
> -endef
> -
> -QT5WEBKIT_POST_INSTALL_TARGET_HOOKS += QT5WEBKIT_INSTALL_TARGET_EXTRAS
> -
> -$(eval $(qmake-package))
> +$(eval $(cmake-package))
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
