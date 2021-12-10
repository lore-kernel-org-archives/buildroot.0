Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4B2EC433EF
	for <buildroot@archiver.kernel.org>; Fri, 10 Dec 2021 19:11:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8CD30614E7;
	Fri, 10 Dec 2021 19:11:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 81ZbfxvExGl4; Fri, 10 Dec 2021 19:11:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7345E614FE;
	Fri, 10 Dec 2021 19:11:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 579FE1BF3D4
 for <buildroot@lists.busybox.net>; Fri, 10 Dec 2021 19:11:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 53D30614FE
 for <buildroot@lists.busybox.net>; Fri, 10 Dec 2021 19:11:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kCnLOfy9hDu8 for <buildroot@lists.busybox.net>;
 Fri, 10 Dec 2021 19:11:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A4A07614E7
 for <buildroot@buildroot.org>; Fri, 10 Dec 2021 19:11:27 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id y13so32491393edd.13
 for <buildroot@buildroot.org>; Fri, 10 Dec 2021 11:11:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=XFcGQOjcxpgXttZFybYCzOSIMDsrhHcZxzkw6AugX84=;
 b=WYJ8rtcdNfRRyir8t2X1tTK2ZOR3RhLOsB9kZauUg4evH+KFagevJEU+B48sXdcv61
 tfXd3RyBhLerxXLN3k/9lt2JBxeyegw8Gd3ehx6QSZuJ+AI8UIXMlw9cBcPDmtIdv2+y
 tgq1rBob/yRoHkW4A5k+Klg4TH9l6Mi3mvkq1hfXaR/7ZSLlnhwyV6lkEN3BlITEcwFi
 6b7AfEmExWhhFdAoEH348ZvCvgzsQTDjRsD0OXrIuI4npv2YiSbUxYGgmTuzqPDDXn3w
 cd0Ar5Gtalmw75Mi16eMYKWa+JrTOGsBH64wMNwubd8GKBJcrKlCqH6f4V62ErFe/chf
 7Zxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=XFcGQOjcxpgXttZFybYCzOSIMDsrhHcZxzkw6AugX84=;
 b=W6Z7ZuFVYK2YPa+oT8ENpxG5Q+tXgG+LggnwnJhRRFFTbkveoCdYPtct2JJvGhHSGT
 HX3x/SQgrX8UrFTHVyy+zHS8Oaj5qRtQVVory2a0vcZUqv5+EoCRwwaOCoyOYmARhJ0D
 Vd5umzno7f+sklgwm/8EK24DoFrK7cL5xKB3Kr+uSogH0Z9AkNM19Q9gc4FgWJRQnml5
 EKdItmD9uEiBFIJt2NBE+kRDs7dZzd5H+rfi2wye6zfVVnz/geRzozl128A6KrVBkGnD
 EBlfMq3U7m3Ala7leJAflyJn8+oqPF+5FM6oO10JmIw0PSkGBL0bjrs/R9sSaAyTPwvR
 4wlQ==
X-Gm-Message-State: AOAM5324CWEs1GtOfH/HMfj4IPsK8LozktXtMxnJvJxBjq4kUx+/T3bL
 wfe5B8YYCsYvYe02yPe7m89ZCw==
X-Google-Smtp-Source: ABdhPJy0D6Cg7B7X8iNUR+EzoeOMW1yT6NKTUBSpE3nfC5ixndxbQlnkeBT9A/9fJJXBmsAptgbSzA==
X-Received: by 2002:a50:d883:: with SMTP id p3mr41042617edj.94.1639163485611; 
 Fri, 10 Dec 2021 11:11:25 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id sg17sm1855398ejc.72.2021.12.10.11.11.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Dec 2021 11:11:25 -0800 (PST)
Message-ID: <dd5c8069-9e02-d0ed-0d1b-99318e8d4d19@mind.be>
Date: Fri, 10 Dec 2021 20:11:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Peter Seiderer <ps.report@gmx.net>, buildroot@buildroot.org
References: <20211114162923.21474-1-ps.report@gmx.net>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211114162923.21474-1-ps.report@gmx.net>
Subject: Re: [Buildroot] [PATCH/next v1 1/2] package/qt5*: change project
 URLs to https
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
Cc: Joshua Henderson <joshua.henderson@microchip.com>,
 Julien Corjon <corjon.j@ecagroup.com>,
 =?UTF-8?Q?Ga=c3=abl_Portay?= <gael.portay@collabora.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 14/11/2021 17:29, Peter Seiderer wrote:
> - change http project URLs to https

  This is essentially the same as the subject line, so quite redundant. I just 
removed it.

  Both applied to master, thanks.

  Regards,
  Arnout

> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>   package/qt5/qt53d/Config.in               | 2 +-
>   package/qt5/qt5base/Config.in             | 2 +-
>   package/qt5/qt5connectivity/Config.in     | 4 ++--
>   package/qt5/qt5declarative/Config.in      | 4 ++--
>   package/qt5/qt5enginio/Config.in          | 2 +-
>   package/qt5/qt5graphicaleffects/Config.in | 2 +-
>   package/qt5/qt5imageformats/Config.in     | 2 +-
>   package/qt5/qt5location/Config.in         | 2 +-
>   package/qt5/qt5multimedia/Config.in       | 2 +-
>   package/qt5/qt5quickcontrols/Config.in    | 2 +-
>   package/qt5/qt5script/Config.in           | 2 +-
>   package/qt5/qt5sensors/Config.in          | 2 +-
>   package/qt5/qt5serialbus/Config.in        | 2 +-
>   package/qt5/qt5serialport/Config.in       | 2 +-
>   package/qt5/qt5svg/Config.in              | 2 +-
>   package/qt5/qt5tools/Config.in            | 2 +-
>   package/qt5/qt5wayland/Config.in          | 2 +-
>   package/qt5/qt5webchannel/Config.in       | 2 +-
>   package/qt5/qt5webengine/Config.in        | 2 +-
>   package/qt5/qt5webkit/Config.in           | 2 +-
>   package/qt5/qt5websockets/Config.in       | 2 +-
>   package/qt5/qt5x11extras/Config.in        | 2 +-
>   package/qt5/qt5xmlpatterns/Config.in      | 2 +-
>   23 files changed, 25 insertions(+), 25 deletions(-)
> 
> diff --git a/package/qt5/qt53d/Config.in b/package/qt5/qt53d/Config.in
> index 5126078d09..9187bee82b 100644
> --- a/package/qt5/qt53d/Config.in
> +++ b/package/qt5/qt53d/Config.in
> @@ -17,7 +17,7 @@ config BR2_PACKAGE_QT53D
>   	  Enable the assimp package to gain the assimp sceneparser
>   	  plugin.
>   
> -	  http://doc.qt.io/qt-5/qt3d-index.html
> +	  https://doc.qt.io/qt-5/qt3d-index.html
>   
>   comment "qt53d module needs an OpenGL-capable backend"
>   	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
> diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
> index e93b2dec38..5b1749a4e9 100644
> --- a/package/qt5/qt5base/Config.in
> +++ b/package/qt5/qt5base/Config.in
> @@ -12,7 +12,7 @@ config BR2_PACKAGE_QT5BASE
>   	  contains the base Qt libraries: QtCore, QtNetwork, QtGui,
>   	  QtWidgets, etc.
>   
> -	  http://qt.io
> +	  https://qt.io
>   
>   if BR2_PACKAGE_QT5BASE
>   
> diff --git a/package/qt5/qt5connectivity/Config.in b/package/qt5/qt5connectivity/Config.in
> index 51e8978f1f..244d01676d 100644
> --- a/package/qt5/qt5connectivity/Config.in
> +++ b/package/qt5/qt5connectivity/Config.in
> @@ -10,8 +10,8 @@ config BR2_PACKAGE_QT5CONNECTIVITY
>   	  Qt Connectivity module provides support for Bluetooth/NFC
>   	  peripherials.
>   
> -	  http://doc.qt.io/qt-5/qtbluetooth-index.html
> -	  http://doc.qt.io/qt-5/qtnfc-index.html
> +	  https://doc.qt.io/qt-5/qtbluetooth-index.html
> +	  https://doc.qt.io/qt-5/qtnfc-index.html
>   
>   comment "qt5connectivity needs neard and/or bluez5_utils"
>   	depends on !BR2_PACKAGE_NEARD && !BR2_PACKAGE_BLUEZ5_UTILS
> diff --git a/package/qt5/qt5declarative/Config.in b/package/qt5/qt5declarative/Config.in
> index 5ec83daa27..477e1970a1 100644
> --- a/package/qt5/qt5declarative/Config.in
> +++ b/package/qt5/qt5declarative/Config.in
> @@ -8,8 +8,8 @@ config BR2_PACKAGE_QT5DECLARATIVE
>   	  Qt Declarative module provides the Qt QML and Qt Quick
>   	  modules for developing UIs with the QML language
>   
> -	  http://doc.qt.io/qt-5/qtqml-index.html
> -	  http://doc.qt.io/qt-5/qtquick-index.html
> +	  https://doc.qt.io/qt-5/qtqml-index.html
> +	  https://doc.qt.io/qt-5/qtquick-index.html
>   
>   if BR2_PACKAGE_QT5DECLARATIVE
>   
> diff --git a/package/qt5/qt5enginio/Config.in b/package/qt5/qt5enginio/Config.in
> index d445d91dea..b738f0db7c 100644
> --- a/package/qt5/qt5enginio/Config.in
> +++ b/package/qt5/qt5enginio/Config.in
> @@ -13,4 +13,4 @@ config BR2_PACKAGE_QT5ENGINIO
>   	  This package has been tagged as deprecated since version
>   	  5.6 and not recommended for new design.
>   
> -	  http://doc.qt.io/archives/qt-5.5/enginio-index.html
> +	  https://doc.qt.io/archives/qt-5.5/enginio-index.html
> diff --git a/package/qt5/qt5graphicaleffects/Config.in b/package/qt5/qt5graphicaleffects/Config.in
> index 69b7fca413..01946d8b7a 100644
> --- a/package/qt5/qt5graphicaleffects/Config.in
> +++ b/package/qt5/qt5graphicaleffects/Config.in
> @@ -12,7 +12,7 @@ config BR2_PACKAGE_QT5GRAPHICALEFFECTS
>   	  for adding visually impressive and configurable effects to
>   	  user interfaces.
>   
> -	  http://doc.qt.io/qt-5/qtgraphicaleffects-index.html
> +	  https://doc.qt.io/qt-5/qtgraphicaleffects-index.html
>   
>   comment "qt5graphicaleffects needs an OpenGL-capable backend"
>   	depends on !BR2_PACKAGE_QT5_GL_AVAILABLE
> diff --git a/package/qt5/qt5imageformats/Config.in b/package/qt5/qt5imageformats/Config.in
> index 991f22f514..2504d23a59 100644
> --- a/package/qt5/qt5imageformats/Config.in
> +++ b/package/qt5/qt5imageformats/Config.in
> @@ -8,4 +8,4 @@ config BR2_PACKAGE_QT5IMAGEFORMATS
>   	  The Qt Image Formats module provides plugins for
>   	  additional image formats: TIFF, MNG, TGA, WBMP
>   
> -	  http://doc.qt.io/qt-5/qtimageformats-index.html
> +	  https://doc.qt.io/qt-5/qtimageformats-index.html
> diff --git a/package/qt5/qt5location/Config.in b/package/qt5/qt5location/Config.in
> index c68deb1006..3d91adaf1f 100644
> --- a/package/qt5/qt5location/Config.in
> +++ b/package/qt5/qt5location/Config.in
> @@ -9,4 +9,4 @@ config BR2_PACKAGE_QT5LOCATION
>   	  solutions using the data available from some of the
>   	  popular location services.
>   
> -	  http://doc.qt.io/qt-5/qtlocation-index.html
> +	  https://doc.qt.io/qt-5/qtlocation-index.html
> diff --git a/package/qt5/qt5multimedia/Config.in b/package/qt5/qt5multimedia/Config.in
> index dd46575d93..46608555b8 100644
> --- a/package/qt5/qt5multimedia/Config.in
> +++ b/package/qt5/qt5multimedia/Config.in
> @@ -12,4 +12,4 @@ config BR2_PACKAGE_QT5MULTIMEDIA
>   	  multimedia capabilities such as media playback and the use
>   	  of camera and radio devices.
>   
> -	  http://doc.qt.io/qt-5/multimediaoverview.html
> +	  https://doc.qt.io/qt-5/multimediaoverview.html
> diff --git a/package/qt5/qt5quickcontrols/Config.in b/package/qt5/qt5quickcontrols/Config.in
> index 56fcaf7053..ae090eb6e1 100644
> --- a/package/qt5/qt5quickcontrols/Config.in
> +++ b/package/qt5/qt5quickcontrols/Config.in
> @@ -10,4 +10,4 @@ config BR2_PACKAGE_QT5QUICKCONTROLS
>   	  The Qt Quick Controls module provides a set of controls
>   	  that can be used to build complete interfaces in Qt Quick.
>   
> -	  http://doc.qt.io/qt-5/qtquickcontrols-index.html
> +	  https://doc.qt.io/qt-5/qtquickcontrols-index.html
> diff --git a/package/qt5/qt5script/Config.in b/package/qt5/qt5script/Config.in
> index 1926813e9f..6e08a3dfe8 100644
> --- a/package/qt5/qt5script/Config.in
> +++ b/package/qt5/qt5script/Config.in
> @@ -12,4 +12,4 @@ config BR2_PACKAGE_QT5SCRIPT
>   	  5.5.0 and should be replaced by Qt QML module in new
>   	  design.
>   
> -	  http://doc.qt.io/qt-5/qtscript-index.html
> +	  https://doc.qt.io/qt-5/qtscript-index.html
> diff --git a/package/qt5/qt5sensors/Config.in b/package/qt5/qt5sensors/Config.in
> index 5e8ee65324..31a42e64aa 100644
> --- a/package/qt5/qt5sensors/Config.in
> +++ b/package/qt5/qt5sensors/Config.in
> @@ -7,4 +7,4 @@ config BR2_PACKAGE_QT5SENSORS
>   	  The Qt Sensors API provides access to sensor hardware
>   	  via QML and C++ interfaces.
>   
> -	  http://doc.qt.io/qt-5/qtsensors-index.html
> +	  https://doc.qt.io/qt-5/qtsensors-index.html
> diff --git a/package/qt5/qt5serialbus/Config.in b/package/qt5/qt5serialbus/Config.in
> index bcfec29b49..466ab7dc9c 100644
> --- a/package/qt5/qt5serialbus/Config.in
> +++ b/package/qt5/qt5serialbus/Config.in
> @@ -11,7 +11,7 @@ config BR2_PACKAGE_QT5SERIALBUS
>   	  This module was in tech preview in Qt 5.6, and promoted
>   	  to a core module in Qt 5.8.0.
>   
> -	  http://doc.qt.io/qt-5/qtserialbus-index.html
> +	  https://doc.qt.io/qt-5/qtserialbus-index.html
>   
>   comment "qt5serialbus needs headers >= 3.6"
>   	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_6
> diff --git a/package/qt5/qt5serialport/Config.in b/package/qt5/qt5serialport/Config.in
> index 16c2eaa619..90cff86456 100644
> --- a/package/qt5/qt5serialport/Config.in
> +++ b/package/qt5/qt5serialport/Config.in
> @@ -8,4 +8,4 @@ config BR2_PACKAGE_QT5SERIALPORT
>   	  includes configuring, I/O operations, getting and setting
>   	  the control signals of the RS-232 pinouts.
>   
> -	  http://doc.qt.io/qt-5/qtserialport-index.html
> +	  https://doc.qt.io/qt-5/qtserialport-index.html
> diff --git a/package/qt5/qt5svg/Config.in b/package/qt5/qt5svg/Config.in
> index e9284913a0..02a5089b19 100644
> --- a/package/qt5/qt5svg/Config.in
> +++ b/package/qt5/qt5svg/Config.in
> @@ -8,4 +8,4 @@ config BR2_PACKAGE_QT5SVG
>   	  Qt SVG provides classes for rendering and displaying SVG
>   	  drawings in widgets and on other paint devices.
>   
> -	  http://doc.qt.io/qt-5/qtsvg-index.html
> +	  https://doc.qt.io/qt-5/qtsvg-index.html
> diff --git a/package/qt5/qt5tools/Config.in b/package/qt5/qt5tools/Config.in
> index 60106c1ee3..428413d5e2 100644
> --- a/package/qt5/qt5tools/Config.in
> +++ b/package/qt5/qt5tools/Config.in
> @@ -7,7 +7,7 @@ config BR2_PACKAGE_QT5TOOLS
>   	  Qt Tools provides tools facilitate the development
>   	  and design of applications.
>   
> -	  http://doc.qt.io/qt-5/qtmodules.html#qt-tools
> +	  https://doc.qt.io/qt-5/qtmodules.html#qt-tools
>   
>   if BR2_PACKAGE_QT5TOOLS
>   
> diff --git a/package/qt5/qt5wayland/Config.in b/package/qt5/qt5wayland/Config.in
> index 0d5a108912..fe698fe876 100644
> --- a/package/qt5/qt5wayland/Config.in
> +++ b/package/qt5/qt5wayland/Config.in
> @@ -11,7 +11,7 @@ config BR2_PACKAGE_QT5WAYLAND
>   
>   	  This package corresponds to the qt5wayland module.
>   
> -	  http://qt.io
> +	  https://qt.io
>   
>   if BR2_PACKAGE_QT5WAYLAND
>   
> diff --git a/package/qt5/qt5webchannel/Config.in b/package/qt5/qt5webchannel/Config.in
> index 436e3abb2b..1cd295b146 100644
> --- a/package/qt5/qt5webchannel/Config.in
> +++ b/package/qt5/qt5webchannel/Config.in
> @@ -9,4 +9,4 @@ config BR2_PACKAGE_QT5WEBCHANNEL
>   	  a server (QML/C++ application) and a client
>   	  (HTML/JavaScript or QML application).
>   
> -	  http://doc.qt.io/qt-5/qtwebchannel-index.html
> +	  https://doc.qt.io/qt-5/qtwebchannel-index.html
> diff --git a/package/qt5/qt5webengine/Config.in b/package/qt5/qt5webengine/Config.in
> index 4e923c7f31..5d537cdf84 100644
> --- a/package/qt5/qt5webengine/Config.in
> +++ b/package/qt5/qt5webengine/Config.in
> @@ -74,7 +74,7 @@ config BR2_PACKAGE_QT5WEBENGINE
>   	  be made fully editable by the user through the use of the
>   	  contenteditable attribute on HTML elements.
>   
> -	  http://doc.qt.io/qt-5/qtwebengine-index.html
> +	  https://doc.qt.io/qt-5/qtwebengine-index.html
>   
>   if BR2_PACKAGE_QT5WEBENGINE
>   
> diff --git a/package/qt5/qt5webkit/Config.in b/package/qt5/qt5webkit/Config.in
> index 4abb04844c..82e38dff52 100644
> --- a/package/qt5/qt5webkit/Config.in
> +++ b/package/qt5/qt5webkit/Config.in
> @@ -29,7 +29,7 @@ config BR2_PACKAGE_QT5WEBKIT
>   	  without GPU since the successor (QtWebEngine) requires
>   	  OpenGL support.
>   
> -	  http://doc.qt.io/archives/qt-5.5/qtwebkit-index.html
> +	  https://doc.qt.io/archives/qt-5.5/qtwebkit-index.html
>   
>   comment "qt5webkit needs a toolchain w/ dynamic library, gcc >= 4.9, host gcc >= 4.9"
>   	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
> diff --git a/package/qt5/qt5websockets/Config.in b/package/qt5/qt5websockets/Config.in
> index 678fb6fa04..e7bd71b21d 100644
> --- a/package/qt5/qt5websockets/Config.in
> +++ b/package/qt5/qt5websockets/Config.in
> @@ -10,4 +10,4 @@ config BR2_PACKAGE_QT5WEBSOCKETS
>   	  process WebSocket requests, or a client that can
>   	  consume data received from the server, or both.
>   
> -	  http://doc.qt.io/qt-5/qtwebsockets-index.html
> +	  https://doc.qt.io/qt-5/qtwebsockets-index.html
> diff --git a/package/qt5/qt5x11extras/Config.in b/package/qt5/qt5x11extras/Config.in
> index ff4cc11531..240443a30a 100644
> --- a/package/qt5/qt5x11extras/Config.in
> +++ b/package/qt5/qt5x11extras/Config.in
> @@ -9,4 +9,4 @@ config BR2_PACKAGE_QT5X11EXTRAS
>   	  Qt X11 Extras enables the Qt programmer to write
>   	  applications for the Linux/X11 platform.
>   
> -	  http://doc.qt.io/qt-5/qtx11extras-index.html
> +	  https://doc.qt.io/qt-5/qtx11extras-index.html
> diff --git a/package/qt5/qt5xmlpatterns/Config.in b/package/qt5/qt5xmlpatterns/Config.in
> index 2f3eb24f23..4fcf7e92e3 100644
> --- a/package/qt5/qt5xmlpatterns/Config.in
> +++ b/package/qt5/qt5xmlpatterns/Config.in
> @@ -7,4 +7,4 @@ config BR2_PACKAGE_QT5XMLPATTERNS
>   	  The Qt XML Patterns module provides support for XPath,
>   	  XQuery, XSLT, and XML Schema validation.
>   
> -	  http://doc.qt.io/qt-5/qtxmlpatterns-index.html
> +	  https://doc.qt.io/qt-5/qtxmlpatterns-index.html
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
