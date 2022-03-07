Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87A74C433EF
	for <buildroot@archiver.kernel.org>; Mon,  7 Mar 2022 21:23:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2561D60EF3;
	Mon,  7 Mar 2022 21:23:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hZrlQcww-TbN; Mon,  7 Mar 2022 21:23:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D413560BE7;
	Mon,  7 Mar 2022 21:23:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A8F791BF2C3
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 21:23:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A38F8403F8
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 21:23:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rBWToO90W4Sl for <buildroot@lists.busybox.net>;
 Mon,  7 Mar 2022 21:23:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C03D74012E
 for <buildroot@buildroot.org>; Mon,  7 Mar 2022 21:23:15 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id h13so9647219ede.5
 for <buildroot@buildroot.org>; Mon, 07 Mar 2022 13:23:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ClMBjyp6/GYkGCpJbN7k65188++GEZjoVwOhvxqxzKU=;
 b=dx9fIwjWKyeRJRwZoBc4EglcvapQXgo8YlDEC7I492sXICcdWK5B5qqTRbKTWMtvqF
 4R4Ja+VaTPGZ/GzZsCuhDnU6xlxRGYA/WcWdmKqa4lxas3GbXxU9rwAdWdoJWAnuvDY6
 c2eP6dNEiSK73fUKbmQ6KUG8ubhNqnL2xGUl78js+DO3nYdP+7ia7+v7/zUyPiRdzJX3
 6F7wSdNVeWjPMSbVcHLikruLbViYcH+ATT2D7bZEVVdi6wL7uS2lJ/3aWyB5lYY+6MXD
 PXw/YhBQY6cb/TmAiaI2CmJ4dWdfDyDHqQZmssC+HdhPuG0V68M1uFGt7+wchP/Y4nxZ
 Ilzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ClMBjyp6/GYkGCpJbN7k65188++GEZjoVwOhvxqxzKU=;
 b=DJdH4QWm7qCuFEmT6PpEufEWNYUFU5fqv4Gv8efQs8CQnGNYaMNcliPqN4LZia0XmP
 u14MNO7of0+3becYJddIexcoNKnBJxcXqO0sRJxm75ZJOH9zHYHgp5NBPQtBRBe88MHC
 +m+sk+ehcSVELgsYdNDZhmOhzDbMU2VQaa/WPIezFzHGbv9kvmNZnWpXi9GLchRh8p5O
 9fW5FZPm0sxa4McsY5TXWpLT0sa4Rlr3yuT3pFHnlTEHkxwmU613ogB/sCzsMxzLC9uj
 0RNgH46VH15rd4fzG5dxzdwPSgfjzJcGKTDZ0AQgQg4xH7Lk3Dh5aTEOorRCtcDNbFuF
 MFDw==
X-Gm-Message-State: AOAM530rOu71dmyLBsqtZ4FRJ/TjPJIqFLlyuXnTg4IiyuQvy8lqfDx3
 xfCU9YShoqtrB5RWHYP90QXAtw==
X-Google-Smtp-Source: ABdhPJzjPnYQMzdSzs949H//5bvDFGNdujDsg4+mzN3TM0smkrBBH7tZjZ2QCF+PxZKwDxaAd8t87Q==
X-Received: by 2002:a05:6402:2065:b0:407:eb07:740 with SMTP id
 bd5-20020a056402206500b00407eb070740mr12832533edb.406.1646688193593; 
 Mon, 07 Mar 2022 13:23:13 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 k3-20020a05640212c300b0041605b2d9c1sm5094877edx.58.2022.03.07.13.23.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 13:23:13 -0800 (PST)
Message-ID: <f75c76ca-5099-59f6-439c-a03c79cbb3fa@mind.be>
Date: Mon, 7 Mar 2022 22:23:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220217163655.221545-1-fontaine.fabrice@gmail.com>
 <20220217163655.221545-2-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220217163655.221545-2-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 2/2] package/kf5: bump to version 5.91
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
Cc: Pierre Ducroquet <pinaraf@pinaraf.info>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 17/02/2022 17:36, Fabrice Fontaine wrote:
> This bump will fix the following build failure of kf5-kcoreaddons with
> python 3.10 raised since commit
> 25b1fc2898d68ddf2674b14c738045875fc5a2dc:
> 
> CMake Error at /home/giuliobenetti/autobuild/run/instance-1/output-1/host/riscv32-buildroot-linux-gnu/sysroot/usr/share/ECM/find-modules/FindPythonModuleGeneration.cmake:149 (message):
>    The max python version in PythonModuleGeneration must be updated.
> Call Stack (most recent call first):
>    src/lib/CMakeLists.txt:208 (find_package)
> 
> It will also fix the following build failure of kf5-kcoreaddons raised
> since commit 5770a645a3a49a3f0f02972131a4ff5283b4c11e:
> 
> In file included from /home/peko/autobuild/instance-0/output-1/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/qt5/QtCore/qchar.h:43,
>                   from /home/peko/autobuild/instance-0/output-1/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/qt5/QtCore/qstring.h:49,
>                   from /home/peko/autobuild/instance-0/output-1/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/qt5/QtCore/QString:1,
>                   from /home/peko/autobuild/instance-0/output-1/build/kf5-kcoreaddons-5.47.0/src/lib/randomness/krandom.h:27,
>                   from /home/peko/autobuild/instance-0/output-1/build/kf5-kcoreaddons-5.47.0/src/lib/randomness/krandom.cpp:22:
> /home/peko/autobuild/instance-0/output-1/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/qt5/QtCore/qglobal.h:1274:80: note: declared here
>   1274 | Q_CORE_EXPORT QT_DEPRECATED_VERSION_X_5_15("use QRandomGenerator instead") int qrand();
>        |                                                                                ^~~~~
> /home/peko/autobuild/instance-0/output-1/build/kf5-kcoreaddons-5.47.0/src/lib/randomness/krandom.cpp: In function 'QString KRandom::randomString(int)':
> /home/peko/autobuild/instance-0/output-1/build/kf5-kcoreaddons-5.47.0/src/lib/randomness/krandom.cpp:76:27: error: use of deleted function 'QCharRef& QCharRef::operator=(char)'
>     76 |         str[i++] =  char(r);
>        |                           ^
> 
> - Update indentation in hash file (two spaces)
> - Update licenses due to
>    https://invent.kde.org/frameworks/kcoreaddons/-/commit/93480398b551aee572f9f1a0ee48ed45a8476580
>    https://invent.kde.org/frameworks/modemmanager-qt/-/commit/8ad494d957cab343a60a61a2163f1ca23e9e3511
>    https://invent.kde.org/frameworks/networkmanager-qt/-/commit/fa9ef0d84898ad5e1f28857307bd5fcb8eb38e20
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/0267ff54ee82d853476ff7d6b14edb4aba308aa2
>   - http://autobuild.buildroot.org/results/694a2322d9161b55f5db66d1ace57d836360ed84
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Although we shouldn't be doing version bumps just before the release, this 
fixes a build issue and kf5 is anyway a leaf package, so applied both to master, 
thanks.

  Regards,
  Arnout

> ---
>   .../kf5-extra-cmake-modules.hash              |  4 ++--
>   .../kf5/kf5-kcoreaddons/kf5-kcoreaddons.hash  | 17 ++++++++++++++--
>   .../kf5/kf5-kcoreaddons/kf5-kcoreaddons.mk    | 20 +++++++++++++++++--
>   .../kf5-modemmanager-qt.hash                  | 11 ++++++++--
>   .../kf5-modemmanager-qt.mk                    | 13 ++++++++++--
>   .../kf5-networkmanager-qt.hash                | 11 ++++++++--
>   .../kf5-networkmanager-qt.mk                  | 12 +++++++++--
>   package/kf5/kf5.mk                            |  2 +-
>   8 files changed, 75 insertions(+), 15 deletions(-)
> 
> diff --git a/package/kf5/kf5-extra-cmake-modules/kf5-extra-cmake-modules.hash b/package/kf5/kf5-extra-cmake-modules/kf5-extra-cmake-modules.hash
> index 733e267fdb..70b776b5d7 100644
> --- a/package/kf5/kf5-extra-cmake-modules/kf5-extra-cmake-modules.hash
> +++ b/package/kf5/kf5-extra-cmake-modules/kf5-extra-cmake-modules.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256 976d8bd15a0b929376bfaef34602a0fb9614229851c46fac3c4b28938f682195 extra-cmake-modules-5.47.0.tar.xz
> -sha256 46cde7dc11e64c78d650b4851b88f6704b4665ff60f22a1caf68ceb15e217e5b COPYING-CMAKE-SCRIPTS
> +sha256  9717885e30aadf184fa71511930409cabbf08eb6627ea8b051de8804fbcec54c  extra-cmake-modules-5.91.0.tar.xz
> +sha256  46cde7dc11e64c78d650b4851b88f6704b4665ff60f22a1caf68ceb15e217e5b  COPYING-CMAKE-SCRIPTS
> diff --git a/package/kf5/kf5-kcoreaddons/kf5-kcoreaddons.hash b/package/kf5/kf5-kcoreaddons/kf5-kcoreaddons.hash
> index 0cd8dcfc15..e4ebf2bb39 100644
> --- a/package/kf5/kf5-kcoreaddons/kf5-kcoreaddons.hash
> +++ b/package/kf5/kf5-kcoreaddons/kf5-kcoreaddons.hash
> @@ -1,3 +1,16 @@
>   # Locally calculated
> -sha256 40ff04757e4ac19bc8448940fe18886c894a2069865966cc865fc55ff67b0b46 kcoreaddons-5.47.0.tar.xz
> -sha256 a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861 COPYING.LIB
> +sha256  dfe3da03260e0153f9f6ced1fc7464eaaf0ed1fb692fc6c2b2d968b629ad719b  kcoreaddons-5.91.0.tar.xz
> +
> +# Hash for license files
> +sha256  d1cf0896da7045d841fe45b0991cf35540bac1a17b5d11f4afcf8fcb950246b5  LICENSES/GPL-2.0-only.txt
> +sha256  606aa26338f69ce178f1cbc648b7574aec4b5bbaeb20f4df36ff49010cb8fbbd  LICENSES/GPL-2.0-or-later.txt
> +sha256  2ca9503d76d1ffab14f599b4741382eec11face60ad1f0d7a41897809003a286  LICENSES/GPL-3.0-only.txt
> +sha256  de588a8b1c41fe73ffe1201f9d12c718a988ed8e1302929625a6e7c2bced7461  LICENSES/LGPL-2.0-only.txt
> +sha256  de588a8b1c41fe73ffe1201f9d12c718a988ed8e1302929625a6e7c2bced7461  LICENSES/LGPL-2.0-or-later.txt
> +sha256  211f1b738d1b864bab2648bee9b55becd39fd2d6aa49c1196e7d87b41db4bc07  LICENSES/LGPL-2.1-only.txt
> +sha256  476b03829862ab7e3ed920f87fad3de3c995f7dd93c26476eb40f0117de43fdc  LICENSES/LGPL-3.0-only.txt
> +sha256  ef839531eb65b0168f9aed14047c84be13e9ea38801a73bc18abe24dc93e6ac9  LICENSES/LicenseRef-KDE-Accepted-GPL.txt
> +sha256  d9f25707d20e804f15005be46527366b0604bd739754d144a83d3983d94a9a6a  LICENSES/LicenseRef-KDE-Accepted-LGPL.txt
> +sha256  272bc0fa06a23d3c807375f95f8d6ccd98541321d2882732668ab139c16f9bf4  LICENSES/LicenseRef-Qt-Commercial.txt
> +sha256  a3b538a7d81c4935d185056479d12fd43042bb9f3a21c9cbb4a8500fab8e5880  LICENSES/MPL-1.1.txt
> +sha256  7dea3adab58690d8ee14775da755cd30a52649a47704ff78ae85197ae0d37c60  LICENSES/Qt-LGPL-exception-1.1.txt
> diff --git a/package/kf5/kf5-kcoreaddons/kf5-kcoreaddons.mk b/package/kf5/kf5-kcoreaddons/kf5-kcoreaddons.mk
> index 9a034ba763..e2f67f15b2 100644
> --- a/package/kf5/kf5-kcoreaddons/kf5-kcoreaddons.mk
> +++ b/package/kf5/kf5-kcoreaddons/kf5-kcoreaddons.mk
> @@ -7,8 +7,24 @@
>   KF5_KCOREADDONS_VERSION = $(KF5_VERSION)
>   KF5_KCOREADDONS_SITE = $(KF5_SITE)
>   KF5_KCOREADDONS_SOURCE = kcoreaddons-$(KF5_KCOREADDONS_VERSION).tar.xz
> -KF5_KCOREADDONS_LICENSE = LGPL-2.1
> -KF5_KCOREADDONS_LICENSE_FILES = COPYING.LIB
> +KF5_KCOREADDONS_LICENSE = \
> +	LGPL-2.0+, LGPL-2.1 or LGPL-3.0 or LicenseRef-KDE-Accepted-LGPL (library), \
> +	MPL.1.1 or GPL-2.0+ or LGPL-2.1+ (posix_fallocate_mac.h), \
> +	LGPL-2.1 with Qt-LGPL-exception-1.1 or LicenseRef-Qt-Commercial (kprocesslist), \
> +	GPL-2.0 or GPL-3.0 or LicenseRef-KDE-Accepted-GPL (autotests)
> +KF5_KCOREADDONS_LICENSE_FILES = \
> +	LICENSES/GPL-2.0-only.txt \
> +	LICENSES/GPL-2.0-or-later.txt \
> +	LICENSES/GPL-3.0-only.txt \
> +	LICENSES/LGPL-2.0-only.txt \
> +	LICENSES/LGPL-2.0-or-later.txt \
> +	LICENSES/LGPL-2.1-only.txt \
> +	LICENSES/LGPL-3.0-only.txt \
> +	LICENSES/LicenseRef-KDE-Accepted-GPL.txt \
> +	LICENSES/LicenseRef-KDE-Accepted-LGPL.txt \
> +	LICENSES/LicenseRef-Qt-Commercial.txt \
> +	LICENSES/MPL-1.1.txt \
> +	LICENSES/Qt-LGPL-exception-1.1.txt
>   
>   KF5_KCOREADDONS_DEPENDENCIES = \
>   	kf5-extra-cmake-modules \
> diff --git a/package/kf5/kf5-modemmanager-qt/kf5-modemmanager-qt.hash b/package/kf5/kf5-modemmanager-qt/kf5-modemmanager-qt.hash
> index 408eb0c0b0..4b6c03a3bb 100644
> --- a/package/kf5/kf5-modemmanager-qt/kf5-modemmanager-qt.hash
> +++ b/package/kf5/kf5-modemmanager-qt/kf5-modemmanager-qt.hash
> @@ -1,3 +1,10 @@
>   # Locally calculated
> -sha256 8b6ab15ce82b7a30b26814178ac33380056ec4398707481aa5ce95cf09d39d03 modemmanager-qt-5.47.0.tar.xz
> -sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551 COPYING.LIB
> +sha256  a2673f18c7866d39c9cedca2f86540c56baf966a2491a86ca06a5a0427358496  modemmanager-qt-5.91.0.tar.xz
> +
> +# Hash for license files
> +sha256  d1cf0896da7045d841fe45b0991cf35540bac1a17b5d11f4afcf8fcb950246b5  LICENSES/GPL-2.0-only.txt
> +sha256  2ca9503d76d1ffab14f599b4741382eec11face60ad1f0d7a41897809003a286  LICENSES/GPL-3.0-only.txt
> +sha256  211f1b738d1b864bab2648bee9b55becd39fd2d6aa49c1196e7d87b41db4bc07  LICENSES/LGPL-2.1-only.txt
> +sha256  476b03829862ab7e3ed920f87fad3de3c995f7dd93c26476eb40f0117de43fdc  LICENSES/LGPL-3.0-only.txt
> +sha256  ef839531eb65b0168f9aed14047c84be13e9ea38801a73bc18abe24dc93e6ac9  LICENSES/LicenseRef-KDE-Accepted-GPL.txt
> +sha256  d9f25707d20e804f15005be46527366b0604bd739754d144a83d3983d94a9a6a  LICENSES/LicenseRef-KDE-Accepted-LGPL.txt
> diff --git a/package/kf5/kf5-modemmanager-qt/kf5-modemmanager-qt.mk b/package/kf5/kf5-modemmanager-qt/kf5-modemmanager-qt.mk
> index 81617492c0..38c80d3da8 100644
> --- a/package/kf5/kf5-modemmanager-qt/kf5-modemmanager-qt.mk
> +++ b/package/kf5/kf5-modemmanager-qt/kf5-modemmanager-qt.mk
> @@ -7,8 +7,17 @@
>   KF5_MODEMMANAGER_QT_VERSION = $(KF5_VERSION)
>   KF5_MODEMMANAGER_QT_SITE = $(KF5_SITE)
>   KF5_MODEMMANAGER_QT_SOURCE = modemmanager-qt-$(KF5_MODEMMANAGER_QT_VERSION).tar.xz
> -KF5_MODEMMANAGER_QT_LICENSE = LGPL-2.1+
> -KF5_MODEMMANAGER_QT_LICENSE_FILES = COPYING.LIB
> +KF5_MODEMMANAGER_QT_LICENSE = \
> +	LGPL-2.1 or LGPL-3.0 or LicenseRef-KDE-Accepted-LGPL (library), \
> +	GPL-2.0 or GPL-3.0 or LicenseRef-KDE-Accepted-GPL (autotests, examples)
> +
> +KF5_MODEMMANAGER_QT_LICENSE_FILES = \
> +	LICENSES/GPL-2.0-only.txt \
> +	LICENSES/GPL-3.0-only.txt \
> +	LICENSES/LGPL-2.1-only.txt \
> +	LICENSES/LGPL-3.0-only.txt \
> +	LICENSES/LicenseRef-KDE-Accepted-GPL.txt \
> +	LICENSES/LicenseRef-KDE-Accepted-LGPL.txt
>   
>   KF5_MODEMMANAGER_QT_DEPENDENCIES = kf5-extra-cmake-modules modem-manager qt5base
>   KF5_MODEMMANAGER_QT_INSTALL_STAGING = YES
> diff --git a/package/kf5/kf5-networkmanager-qt/kf5-networkmanager-qt.hash b/package/kf5/kf5-networkmanager-qt/kf5-networkmanager-qt.hash
> index 8ccada455e..de4504064f 100644
> --- a/package/kf5/kf5-networkmanager-qt/kf5-networkmanager-qt.hash
> +++ b/package/kf5/kf5-networkmanager-qt/kf5-networkmanager-qt.hash
> @@ -1,3 +1,10 @@
>   # Locally calculated
> -sha256 d0b377500ee4cf4f029f4d04d6844bcf3d2d6734982b511a5fffab5165688209 networkmanager-qt-5.47.0.tar.xz
> -sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551	COPYING.LIB
> +sha256  2e20ffd995ce64a90b1133b594bab2b2292be54e538f62633e78e8296cc44738  networkmanager-qt-5.91.0.tar.xz
> +
> +# Hash for license files
> +sha256  d1cf0896da7045d841fe45b0991cf35540bac1a17b5d11f4afcf8fcb950246b5  LICENSES/GPL-2.0-only.txt
> +sha256  2ca9503d76d1ffab14f599b4741382eec11face60ad1f0d7a41897809003a286  LICENSES/GPL-3.0-only.txt
> +sha256  211f1b738d1b864bab2648bee9b55becd39fd2d6aa49c1196e7d87b41db4bc07  LICENSES/LGPL-2.1-only.txt
> +sha256  476b03829862ab7e3ed920f87fad3de3c995f7dd93c26476eb40f0117de43fdc  LICENSES/LGPL-3.0-only.txt
> +sha256  ef839531eb65b0168f9aed14047c84be13e9ea38801a73bc18abe24dc93e6ac9  LICENSES/LicenseRef-KDE-Accepted-GPL.txt
> +sha256  d9f25707d20e804f15005be46527366b0604bd739754d144a83d3983d94a9a6a  LICENSES/LicenseRef-KDE-Accepted-LGPL.txt
> diff --git a/package/kf5/kf5-networkmanager-qt/kf5-networkmanager-qt.mk b/package/kf5/kf5-networkmanager-qt/kf5-networkmanager-qt.mk
> index c383f98e9b..7adff2deb7 100644
> --- a/package/kf5/kf5-networkmanager-qt/kf5-networkmanager-qt.mk
> +++ b/package/kf5/kf5-networkmanager-qt/kf5-networkmanager-qt.mk
> @@ -7,8 +7,16 @@
>   KF5_NETWORKMANAGER_QT_VERSION = $(KF5_VERSION)
>   KF5_NETWORKMANAGER_QT_SITE = $(KF5_SITE)
>   KF5_NETWORKMANAGER_QT_SOURCE = networkmanager-qt-$(KF5_NETWORKMANAGER_QT_VERSION).tar.xz
> -KF5_NETWORKMANAGER_QT_LICENSE = LGPL-2.1+
> -KF5_NETWORKMANAGER_QT_LICENSE_FILES = COPYING.LIB
> +KF5_NETWORKMANAGER_QT_LICENSE = \
> +	LGPL-2.1 or LGPL-3.0 or LicenseRef-KDE-Accepted-LGPL (library), \
> +	GPL-2.0 or GPL-3.0 or LicenseRef-KDE-Accepted-GPL (autotests, examples)
> +KF5_NETWORKMANAGER_QT_LICENSE_FILES = \
> +	LICENSES/GPL-2.0-only.txt \
> +	LICENSES/GPL-3.0-only.txt \
> +	LICENSES/LGPL-2.1-only.txt \
> +	LICENSES/LGPL-3.0-only.txt \
> +	LICENSES/LicenseRef-KDE-Accepted-GPL.txt \
> +	LICENSES/LicenseRef-KDE-Accepted-LGPL.txt
>   
>   KF5_NETWORKMANAGER_QT_DEPENDENCIES = kf5-extra-cmake-modules network-manager qt5base
>   KF5_NETWORKMANAGER_QT_INSTALL_STAGING = YES
> diff --git a/package/kf5/kf5.mk b/package/kf5/kf5.mk
> index 8360fc9b63..64b08bae4f 100644
> --- a/package/kf5/kf5.mk
> +++ b/package/kf5/kf5.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -KF5_VERSION_MAJOR = 5.47
> +KF5_VERSION_MAJOR = 5.91
>   KF5_VERSION = $(KF5_VERSION_MAJOR).0
>   KF5_SITE = https://download.kde.org/stable/frameworks/$(KF5_VERSION_MAJOR)
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
