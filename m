Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06C9BC433EF
	for <buildroot@archiver.kernel.org>; Mon, 31 Jan 2022 19:57:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 98CEB60F17;
	Mon, 31 Jan 2022 19:57:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AzMVmsf46hFh; Mon, 31 Jan 2022 19:57:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DDDC360F11;
	Mon, 31 Jan 2022 19:57:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 765631BF379
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 19:57:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 634C0408FF
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 19:57:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xxt14R7QPWqO for <buildroot@lists.busybox.net>;
 Mon, 31 Jan 2022 19:57:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7CD90405BB
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 19:57:19 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id c24so29334517edy.4
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 11:57:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=w01TbjFvjYoRiZj8PZg+HxSaghQZuxE9YtefXKHwfaM=;
 b=gAJ1IScPkiAiKtd8eiK7vg6pfwfVbAOhI3+eBu9Uz/CO5k9DQMZpwyUxVp3qIZKvcD
 VJ49+QJ1p1W7hWs+p6PozDRw8nDX7WkgtZHsmIM+Zr2uwqHqrmDDIG0I5uKK7SR4gGrK
 n4NHRZ6KP0YV2Oxuc/i80E7e2GJPISBOo+Kx3EKRL3Oy/ESba9I0JYsVH5iwLlLWd1wG
 PZc5+CMvs5zf+ZZhU8QFNg0eOI4GlfFfu4HQsqkIjuQqzdbpobr4FuPBCQqFIuXTqOUF
 UzffhGrkMWBiu7+taOBvk0Hr9eu9eoKUCWM/R/vTquJIAUy7mPEcoQEd1xHmR7cmViwB
 QWrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=w01TbjFvjYoRiZj8PZg+HxSaghQZuxE9YtefXKHwfaM=;
 b=PivV2wgiV94PrfboCHANaTnovP6RMc3LFO85mDozgdgYzBwrPJ+KqHZYIcxHY9Wnwl
 DRUZpM4hIR61bqdEGRSMLo6cEMP5v//JTdnCCXea+DfczuuHqFEpIVipsNimmKAzysVF
 VR0Tk9zNZSaxdOeMwgM8ElWjC5fFh6xtYDUMXqDS/r3NYT4xotwsLOjEFlKPhiqSZveG
 qIsST0jIbXHJZIZO78AbsH5fJc9W8VGFtPXoh75ldE15NoY3PzWDoERmpkMcBdvLupA/
 QF+crZDPjFm2O+Ez4sVL0bp/JnBM7oTn2jCouN5iP1woMd9NbLeCJfB6q76SFdZ51iYx
 4u9w==
X-Gm-Message-State: AOAM533qxR9YJKEB1oDqj/Bma6H8w7PKxdphbfsSGYSPjZSUBIUIRTUy
 on6Mt/PyZUO+jP9FORoqLnOl5A==
X-Google-Smtp-Source: ABdhPJy7ymAINVLw9/IqhBZlNfIUzPGl1nwYH/eqzHk6QCx0Ur1ZqyGsZsmr1YJMctBFpcXWvEZ3sg==
X-Received: by 2002:aa7:d313:: with SMTP id p19mr22904296edq.380.1643659037785; 
 Mon, 31 Jan 2022 11:57:17 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id gz19sm13801549ejc.10.2022.01.31.11.57.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Jan 2022 11:57:17 -0800 (PST)
Message-ID: <e4daf50f-a2bb-308f-98bb-1c9289bf077c@mind.be>
Date: Mon, 31 Jan 2022 20:57:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220116214955.3231899-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220116214955.3231899-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/3] package/qt5/qt5webkit: widgets are
 mandatory
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
Cc: Peter Seiderer <ps.report@gmx.net>,
 =?UTF-8?Q?Ga=c3=abl_Portay?= <gael.portay@collabora.com>,
 Julien Corjon <corjon.j@ecagroup.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 16/01/2022 22:49, Fabrice Fontaine wrote:
> Fix the following build failure raised since bump to version
> 5.212.0-alpha4 in commit df0b0fe6919c0d0f3750f439a3cfa765232bd569:
> 
> CMake Error at /home/fabrice/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/cmake/Qt5/Qt5Config.cmake:28 (find_package):
>    Could not find a package configuration file provided by "Qt5Widgets" with
>    any of the following names:
> 
>      Qt5WidgetsConfig.cmake
>      qt5widgets-config.cmake
> 
>    Add the installation prefix of "Qt5Widgets" to CMAKE_PREFIX_PATH or set
>    "Qt5Widgets_DIR" to a directory containing one of the above files.  If
>    "Qt5Widgets" provides a separate development package or SDK, be sure it has
>    been installed.
> Call Stack (most recent call first):
>    Source/cmake/OptionsQt.cmake:646 (find_package)
>    Source/cmake/WebKitCommon.cmake:51 (include)
>    CMakeLists.txt:137 (include)
> 
> Fixes:
>   - No autobuilder failures (yet)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Series applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/qt5/qt5webkit/Config.in | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/qt5/qt5webkit/Config.in b/package/qt5/qt5webkit/Config.in
> index b7beb2b252..68b679dfcd 100644
> --- a/package/qt5/qt5webkit/Config.in
> +++ b/package/qt5/qt5webkit/Config.in
> @@ -17,6 +17,7 @@ config BR2_PACKAGE_QT5WEBKIT
>   	select BR2_PACKAGE_LIBPNG
>   	select BR2_PACKAGE_QT5BASE_ICU
>   	select BR2_PACKAGE_QT5BASE_GUI
> +	select BR2_PACKAGE_QT5BASE_WIDGETS
>   	select BR2_PACKAGE_QT5LOCATION
>   	select BR2_PACKAGE_QT5SENSORS
>   	select BR2_PACKAGE_QT5WEBCHANNEL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
