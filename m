Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41A7CC433FE
	for <buildroot@archiver.kernel.org>; Wed, 12 Oct 2022 19:18:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 96143401AF;
	Wed, 12 Oct 2022 19:18:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 96143401AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3eE50HZGHFsh; Wed, 12 Oct 2022 19:18:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 36E4A40176;
	Wed, 12 Oct 2022 19:18:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 36E4A40176
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3447F1BF5A1
 for <buildroot@lists.busybox.net>; Wed, 12 Oct 2022 19:18:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 043524193C
 for <buildroot@lists.busybox.net>; Wed, 12 Oct 2022 19:18:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 043524193C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UmUbB1i4LGL0 for <buildroot@lists.busybox.net>;
 Wed, 12 Oct 2022 19:18:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 13E3A41915
Received: from smtpcmd15176.aruba.it (smtpcmd15176.aruba.it [62.149.156.176])
 by smtp4.osuosl.org (Postfix) with ESMTP id 13E3A41915
 for <buildroot@buildroot.org>; Wed, 12 Oct 2022 19:18:22 +0000 (UTC)
Received: from [192.168.50.173] ([146.241.87.206])
 by Aruba Outgoing Smtp  with ESMTPSA
 id ihFFoeEyL3YgoihFFotTR7; Wed, 12 Oct 2022 21:18:21 +0200
Message-ID: <0700d1b5-83e3-961d-f3d8-17a1a56f1d92@benettiengineering.com>
Date: Wed, 12 Oct 2022 21:18:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
To: buildroot@buildroot.org
References: <20221012190534.51237-1-giulio.benetti@benettiengineering.com>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20221012190534.51237-1-giulio.benetti@benettiengineering.com>
X-CMAE-Envelope: MS4xfPW0+hgVqPnPHu1xZmLE1ZIVUS5AWS8qur5Hy38omUwOPkHSXnFb+WWkDGMey6OE4DqUGEEQShnaPuuXN19z1aBIp31cr0jFhTUuw/6mhq1xhuXoLKu0
 gKxPMsbN39o6OWDISG+FFT15p2g5DjG1oTn9wE0bhoe3/9t5LzhUFQFEFV/mUnvT0Iv1mHmMBl222JzBlZVHVkQ43CNdjiKR9B5sUuU4TR6a6OZQUUkxfPQE
 hgWqmxQdYhs1roHf8P4uznogxoNXiDyVPEoA2usS7A+aPE8wuqr6AWkzmECjHXfn1ZQuqiwXunWO1RxrK4q1n5SSLuCoAea20bg5cBX0jqU=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1665602301; bh=NrFi8MiEXkxLXSfGHHIUkENKXMQHDzhld//PhKcnSp8=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=NEEHuf6WkrAoxPcMcpKJ+Etjeiov+hBzZuSIWy83Oyb1Ptb4ko5gFM8iAggoj6JEA
 kSQYfJ9/UCuiSdLVzlHGIuoMgPQfM2/rJe8zjg4Bj4TZzLu4F7cYQgktc3Vcm/Pgf6
 v1uB+Xlb7hPZ81xVxpQT+ZaVRBxyRWSoFazya8xhsE8CvWOmfbrUtXknti0DWUv3kz
 POZH8G2aWIue7gfaANBfNzyBO/9+qA6ADQe8dogKnJp/8qltRnviCiferL4ljixxQt
 zdy86oNx4/9FWd3j0Y5UghqB0lkrU71qXQEXJNlpKjtLFwPjgCLavrios0DoYrvgFS
 6RcqAel0EL7rQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=NEEHuf6W
Subject: Re: [Buildroot] [PATCH] package/qt5: bump packages to latest kde
 submodule versions
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
Cc: Bartosz Bilas <b.bilas@grinn-global.com>,
 Joshua Henderson <joshua.henderson@microchip.com>,
 Julien Corjon <corjon.j@ecagroup.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Sorry I've forgotten:

On 12/10/22 21:05, Giulio Benetti wrote:
> Bump qt5 packages to latest submodule versions from:
> https://invent.kde.org/qt/qt/qt5/-/tree/kde/5.15
> 
> Drop a qt5wayland patch which is now upstream.

Drop a qt5wayland and a qt5virtualkeyboard local patches that are now
upstream.

Best regards
-- 
Giulio Benetti
Benetti Engineering sas

> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>   package/qt5/qt5.mk                            |  2 +-
>   package/qt5/qt5base/qt5base.hash              |  2 +-
>   package/qt5/qt5base/qt5base.mk                |  2 +-
>   package/qt5/qt5charts/qt5charts.hash          |  2 +-
>   package/qt5/qt5charts/qt5charts.mk            |  2 +-
>   .../qt5/qt5declarative/qt5declarative.hash    |  2 +-
>   package/qt5/qt5declarative/qt5declarative.mk  |  2 +-
>   .../qt5graphicaleffects.hash                  |  2 +-
>   .../qt5graphicaleffects.mk                    |  2 +-
>   .../qt5/qt5imageformats/qt5imageformats.hash  |  2 +-
>   .../qt5/qt5imageformats/qt5imageformats.mk    |  2 +-
>   package/qt5/qt5location/qt5location.hash      |  2 +-
>   package/qt5/qt5location/qt5location.mk        |  2 +-
>   package/qt5/qt5lottie/qt5lottie.hash          |  2 +-
>   package/qt5/qt5lottie/qt5lottie.mk            |  2 +-
>   package/qt5/qt5multimedia/qt5multimedia.hash  |  2 +-
>   package/qt5/qt5multimedia/qt5multimedia.mk    |  2 +-
>   .../qt5quickcontrols/qt5quickcontrols.hash    |  2 +-
>   .../qt5/qt5quickcontrols/qt5quickcontrols.mk  |  2 +-
>   .../qt5quickcontrols2/qt5quickcontrols2.hash  |  2 +-
>   .../qt5quickcontrols2/qt5quickcontrols2.mk    |  2 +-
>   .../qt5quicktimeline/qt5quicktimeline.hash    |  2 +-
>   .../qt5/qt5quicktimeline/qt5quicktimeline.mk  |  2 +-
>   .../qt5remoteobjects/qt5remoteobjects.hash    |  2 +-
>   .../qt5/qt5remoteobjects/qt5remoteobjects.mk  |  2 +-
>   package/qt5/qt5script/qt5script.hash          |  2 +-
>   package/qt5/qt5script/qt5script.mk            |  2 +-
>   package/qt5/qt5scxml/qt5scxml.hash            |  2 +-
>   package/qt5/qt5scxml/qt5scxml.mk              |  2 +-
>   package/qt5/qt5sensors/qt5sensors.hash        |  2 +-
>   package/qt5/qt5sensors/qt5sensors.mk          |  2 +-
>   package/qt5/qt5serialbus/qt5serialbus.hash    |  2 +-
>   package/qt5/qt5serialbus/qt5serialbus.mk      |  2 +-
>   package/qt5/qt5serialport/qt5serialport.hash  |  2 +-
>   package/qt5/qt5serialport/qt5serialport.mk    |  2 +-
>   package/qt5/qt5svg/qt5svg.hash                |  2 +-
>   package/qt5/qt5svg/qt5svg.mk                  |  2 +-
>   package/qt5/qt5tools/qt5tools.hash            |  2 +-
>   package/qt5/qt5tools/qt5tools.mk              |  2 +-
>   .../qt5virtualkeyboard.hash                   |  2 +-
>   .../qt5virtualkeyboard/qt5virtualkeyboard.mk  |  2 +-
>   .../0001-Add-missing-define-guards.patch      | 35 -------------------
>   package/qt5/qt5wayland/qt5wayland.hash        |  2 +-
>   package/qt5/qt5wayland/qt5wayland.mk          |  2 +-
>   ...ro-don-t-link-statically-with-libstc.patch | 15 ++++----
>   package/qt5/qt5webengine/qt5webengine.hash    |  2 +-
>   package/qt5/qt5webview/qt5webview.mk          |  2 +-
>   package/qt5/qt5x11extras/qt5x11extras.mk      |  2 +-
>   .../qt5/qt5xmlpatterns/qt5xmlpatterns.hash    |  2 +-
>   package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk  |  2 +-
>   50 files changed, 56 insertions(+), 90 deletions(-)
>   delete mode 100644 package/qt5/qt5wayland/0001-Add-missing-define-guards.patch
> 
> diff --git a/package/qt5/qt5.mk b/package/qt5/qt5.mk
> index 0706c3548d..b55accacf1 100644
> --- a/package/qt5/qt5.mk
> +++ b/package/qt5/qt5.mk
> @@ -5,7 +5,7 @@
>   ################################################################################
>   
>   QT5_VERSION_MAJOR = 5.15
> -QT5_VERSION = $(QT5_VERSION_MAJOR).8
> +QT5_VERSION = $(QT5_VERSION_MAJOR).10
>   QT5_SITE = https://invent.kde.org/qt/qt
>   
>   include $(sort $(wildcard package/qt5/*/*.mk))
> diff --git a/package/qt5/qt5base/qt5base.hash b/package/qt5/qt5base/qt5base.hash
> index 27d2b99c34..4efc8fa172 100644
> --- a/package/qt5/qt5base/qt5base.hash
> +++ b/package/qt5/qt5base/qt5base.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated
> -sha256  ecff8cf42af98c2294f7c99eb8c41564892f470382adaf8f4048c85252849808  qtbase-2ffb7ad8a1079a0444b9c72affe3d19b089b60de.tar.bz2
> +sha256  5622a9053154af9a353b8e8be217104c6af068b5b5aba8b07ef4fea2dc79fded  qtbase-e44097b63d17ba3178a637df7fac51ddc51cb48b.tar.bz2
>   
>   # Hashes for license files:
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
> diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
> index efa0e16e9a..028236d2ed 100644
> --- a/package/qt5/qt5base/qt5base.mk
> +++ b/package/qt5/qt5base/qt5base.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -QT5BASE_VERSION = 2ffb7ad8a1079a0444b9c72affe3d19b089b60de
> +QT5BASE_VERSION = e44097b63d17ba3178a637df7fac51ddc51cb48b
>   QT5BASE_SITE = $(QT5_SITE)/qtbase/-/archive/$(QT5BASE_VERSION)
>   QT5BASE_SOURCE = qtbase-$(QT5BASE_VERSION).tar.bz2
>   
> diff --git a/package/qt5/qt5charts/qt5charts.hash b/package/qt5/qt5charts/qt5charts.hash
> index ba22e29996..0688f64615 100644
> --- a/package/qt5/qt5charts/qt5charts.hash
> +++ b/package/qt5/qt5charts/qt5charts.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated
> -sha256  32119f7ac88c250b24835b91a71510bf673f1cede6e572fd1059debf8325d7ff  qtcharts-16c2a8821135bf89369c4e3c5a1bdff8b05ffdb5.tar.bz2
> +sha256  9d2ad94a054bd7df08e5d11bc77b6422ccecbf99ea8dd6f06908bafc72ea869d  qtcharts-841083c263f16f8acb81e4915bf24bbed0461c9a.tar.bz2
>   
>   # Hashes for license files:
>   sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
> diff --git a/package/qt5/qt5charts/qt5charts.mk b/package/qt5/qt5charts/qt5charts.mk
> index 0028c9f8cb..fa69263be4 100644
> --- a/package/qt5/qt5charts/qt5charts.mk
> +++ b/package/qt5/qt5charts/qt5charts.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -QT5CHARTS_VERSION = 16c2a8821135bf89369c4e3c5a1bdff8b05ffdb5
> +QT5CHARTS_VERSION = 841083c263f16f8acb81e4915bf24bbed0461c9a
>   QT5CHARTS_SITE = $(QT5_SITE)/qtcharts/-/archive/$(QT5CHARTS_VERSION)
>   QT5CHARTS_SOURCE = qtcharts-$(QT5CHARTS_VERSION).tar.bz2
>   QT5CHARTS_INSTALL_STAGING = YES
> diff --git a/package/qt5/qt5declarative/qt5declarative.hash b/package/qt5/qt5declarative/qt5declarative.hash
> index 00c9a04432..0e7978dc58 100644
> --- a/package/qt5/qt5declarative/qt5declarative.hash
> +++ b/package/qt5/qt5declarative/qt5declarative.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated
> -sha256  0dd6b29bb19ad419d47d1fb612b39b1834d675fd1c58b80cd85c7d3da98b40bf  qtdeclarative-51efb2ed2f071beda188270a23ac450fe4b318f7.tar.bz2
> +sha256  dbe0cdf84767564a56abf9d0d867c9cfcc754827169357a0f8162309c11882b5  qtdeclarative-b3aaf1482c48bbc0ca4f7c7934597c055afe4b6a.tar.bz2
>   
>   # Hashes for license files:
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
> diff --git a/package/qt5/qt5declarative/qt5declarative.mk b/package/qt5/qt5declarative/qt5declarative.mk
> index cece8e476b..18c1608fca 100644
> --- a/package/qt5/qt5declarative/qt5declarative.mk
> +++ b/package/qt5/qt5declarative/qt5declarative.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -QT5DECLARATIVE_VERSION = 51efb2ed2f071beda188270a23ac450fe4b318f7
> +QT5DECLARATIVE_VERSION = b3aaf1482c48bbc0ca4f7c7934597c055afe4b6a
>   QT5DECLARATIVE_SITE = $(QT5_SITE)/qtdeclarative/-/archive/$(QT5DECLARATIVE_VERSION)
>   QT5DECLARATIVE_SOURCE = qtdeclarative-$(QT5DECLARATIVE_VERSION).tar.bz2
>   QT5DECLARATIVE_INSTALL_STAGING = YES
> diff --git a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
> index 5de13a176d..95567b2476 100644
> --- a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
> +++ b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated
> -sha256  83ee3888473fb786c1615c4b98320a9b1eeeb66dbc1ef9743b8339718594e48e  qtgraphicaleffects-4c6ec38635aa22cf0854df8e710733c529f4ec02.tar.bz2
> +sha256  de41af344889d35252fec9a6b6c78e1f67b7a7be15a5d3986b2ec20e2fcafadc  qtgraphicaleffects-e6e1e58ec28fd0f2e6426e6962cc4ccddb493349.tar.bz2
>   
>   # Hashes for license files:
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
> diff --git a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
> index e4c464b8c7..f829c67122 100644
> --- a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
> +++ b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -QT5GRAPHICALEFFECTS_VERSION = 4c6ec38635aa22cf0854df8e710733c529f4ec02
> +QT5GRAPHICALEFFECTS_VERSION = e6e1e58ec28fd0f2e6426e6962cc4ccddb493349
>   QT5GRAPHICALEFFECTS_SITE = $(QT5_SITE)/qtgraphicaleffects/-/archive/$(QT5GRAPHICALEFFECTS_VERSION)
>   QT5GRAPHICALEFFECTS_SOURCE = qtgraphicaleffects-$(QT5GRAPHICALEFFECTS_VERSION).tar.bz2
>   QT5GRAPHICALEFFECTS_DEPENDENCIES = qt5declarative
> diff --git a/package/qt5/qt5imageformats/qt5imageformats.hash b/package/qt5/qt5imageformats/qt5imageformats.hash
> index 9b8a788cae..9d821672b3 100644
> --- a/package/qt5/qt5imageformats/qt5imageformats.hash
> +++ b/package/qt5/qt5imageformats/qt5imageformats.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated
> -sha256  4ce1982ccf3232d25187286ca4893bcf00b149cf9f6706f06f60d908fab480a0  qtimageformats-b43e31b9f31ec482ddea2066fda7ca9315512815.tar.bz2
> +sha256  8bf646d4db7d0099dd49b7c049a64fb585a3e180d73fc2b6edf22a1384529d1d  qtimageformats-9044695f4b1acdd7ec24e7b01f6a6ca61f982a75.tar.bz2
>   
>   # Hashes for license files:
>   sha256  edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253  LICENSE.GPLv2
> diff --git a/package/qt5/qt5imageformats/qt5imageformats.mk b/package/qt5/qt5imageformats/qt5imageformats.mk
> index 2cc8e0f17b..0ce6e4ffb4 100644
> --- a/package/qt5/qt5imageformats/qt5imageformats.mk
> +++ b/package/qt5/qt5imageformats/qt5imageformats.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -QT5IMAGEFORMATS_VERSION = b43e31b9f31ec482ddea2066fda7ca9315512815
> +QT5IMAGEFORMATS_VERSION = 9044695f4b1acdd7ec24e7b01f6a6ca61f982a75
>   QT5IMAGEFORMATS_SITE = $(QT5_SITE)/qtimageformats/-/archive/$(QT5IMAGEFORMATS_VERSION)
>   QT5IMAGEFORMATS_SOURCE = qtimageformats-$(QT5IMAGEFORMATS_VERSION).tar.bz2
>   QT5IMAGEFORMATS_INSTALL_STAGING = YES
> diff --git a/package/qt5/qt5location/qt5location.hash b/package/qt5/qt5location/qt5location.hash
> index e41b20fd9b..f73053f388 100644
> --- a/package/qt5/qt5location/qt5location.hash
> +++ b/package/qt5/qt5location/qt5location.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated
> -sha256  f9673cb1e5b88b4c43d663d7b9b666ff82d6843bf2b445805367cf537839a782  qt5location-db3b6bc6afed6477e6ab2d8465e41efee30fb6d5-br1.tar.gz
> +sha256  90b57a335d8c7311a86865a56b2b9cd944a8a1cafa6a7499de5b35a105c5b247  qt5location-ebdf5b38da6e3fe0a183702bcca395c589c459ed-br1.tar.gz
>   
>   # Hashes for license files:
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
> diff --git a/package/qt5/qt5location/qt5location.mk b/package/qt5/qt5location/qt5location.mk
> index a61994fa53..904d31a983 100644
> --- a/package/qt5/qt5location/qt5location.mk
> +++ b/package/qt5/qt5location/qt5location.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -QT5LOCATION_VERSION = db3b6bc6afed6477e6ab2d8465e41efee30fb6d5
> +QT5LOCATION_VERSION = ebdf5b38da6e3fe0a183702bcca395c589c459ed
>   QT5LOCATION_SITE = $(QT5_SITE)/qtlocation
>   QT5LOCATION_SITE_METHOD = git
>   QT5LOCATION_GIT_SUBMODULES = YES
> diff --git a/package/qt5/qt5lottie/qt5lottie.hash b/package/qt5/qt5lottie/qt5lottie.hash
> index c5c71ddf6c..cbd94fd111 100644
> --- a/package/qt5/qt5lottie/qt5lottie.hash
> +++ b/package/qt5/qt5lottie/qt5lottie.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated
> -sha256  7e006b7a3608f0737f41682352819c404db4c1506d9ebe82eb4af7b1ae652d14  qtlottie-ccba2b00bd7f10558edb8664d6b9a95e9fafe6ac.tar.bz2
> +sha256  82336dd063f8bedc28e9545cc8c0123053434d6c681e470434c80ad3908ca4b0  qtlottie-d40b67401afe7156b03c62c9a4d517b07555fe64.tar.bz2
>   
>   # Hashes for license files:
>   sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
> diff --git a/package/qt5/qt5lottie/qt5lottie.mk b/package/qt5/qt5lottie/qt5lottie.mk
> index d02d693401..42a920582a 100644
> --- a/package/qt5/qt5lottie/qt5lottie.mk
> +++ b/package/qt5/qt5lottie/qt5lottie.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -QT5LOTTIE_VERSION = ccba2b00bd7f10558edb8664d6b9a95e9fafe6ac
> +QT5LOTTIE_VERSION = d40b67401afe7156b03c62c9a4d517b07555fe64
>   QT5LOTTIE_SITE = $(QT5_SITE)/qtlottie/-/archive/$(QT5LOTTIE_VERSION)
>   QT5LOTTIE_SOURCE = qtlottie-$(QT5LOTTIE_VERSION).tar.bz2
>   QT5LOTTIE_DEPENDENCIES = qt5declarative
> diff --git a/package/qt5/qt5multimedia/qt5multimedia.hash b/package/qt5/qt5multimedia/qt5multimedia.hash
> index 527e3948b8..4803ef9230 100644
> --- a/package/qt5/qt5multimedia/qt5multimedia.hash
> +++ b/package/qt5/qt5multimedia/qt5multimedia.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated
> -sha256  b6a17deafe7ea7ad44e2852a92ea73b0089beaf9f24cb3434d018db9b8170ee6  qtmultimedia-dc0ee181d4c56ff66c989bd3292dad7cc35e234b.tar.bz2
> +sha256  842c5be64dafe7a68d2b120e24faffd14af6e4d9d8e9c0aa8bbf4330b3491aa3  qtmultimedia-76f84c545429a1b988b79f971734ef4bc3e6643f.tar.bz2
>   
>   # Hashes for license files:
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
> diff --git a/package/qt5/qt5multimedia/qt5multimedia.mk b/package/qt5/qt5multimedia/qt5multimedia.mk
> index bf2126b285..0d0f5dd53d 100644
> --- a/package/qt5/qt5multimedia/qt5multimedia.mk
> +++ b/package/qt5/qt5multimedia/qt5multimedia.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -QT5MULTIMEDIA_VERSION = dc0ee181d4c56ff66c989bd3292dad7cc35e234b
> +QT5MULTIMEDIA_VERSION = 76f84c545429a1b988b79f971734ef4bc3e6643f
>   QT5MULTIMEDIA_SITE = $(QT5_SITE)/qtmultimedia/-/archive/$(QT5MULTIMEDIA_VERSION)
>   QT5MULTIMEDIA_SOURCE = qtmultimedia-$(QT5MULTIMEDIA_VERSION).tar.bz2
>   QT5MULTIMEDIA_INSTALL_STAGING = YES
> diff --git a/package/qt5/qt5quickcontrols/qt5quickcontrols.hash b/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
> index 45af81c99f..05a021e8b2 100644
> --- a/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
> +++ b/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated
> -sha256  c2ddcf9c524ef12a0786c410ac4b3c6d4be9aa17db71f2ea8c57ff615fda62dd  qtquickcontrols-d405bf6a29bc9d6da6e3dcefbd1b88f5ed70fb1b.tar.bz2
> +sha256  e2c7bc6346a8eb4c21510f8fbf7e752648f68a0c5af8525a784e64503570f72c  qtquickcontrols-e62b8b6d2f45a79652238b33f4bbe23023004ae7.tar.bz2
>   
>   # Hashes for license files:
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
> diff --git a/package/qt5/qt5quickcontrols/qt5quickcontrols.mk b/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
> index 5903e6d69c..25c1a74f5c 100644
> --- a/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
> +++ b/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -QT5QUICKCONTROLS_VERSION = d405bf6a29bc9d6da6e3dcefbd1b88f5ed70fb1b
> +QT5QUICKCONTROLS_VERSION = e62b8b6d2f45a79652238b33f4bbe23023004ae7
>   QT5QUICKCONTROLS_SITE = $(QT5_SITE)/qtquickcontrols/-/archive/$(QT5QUICKCONTROLS_VERSION)
>   QT5QUICKCONTROLS_SOURCE = qtquickcontrols-$(QT5QUICKCONTROLS_VERSION).tar.bz2
>   QT5QUICKCONTROLS_DEPENDENCIES = qt5declarative
> diff --git a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
> index 7d81b61407..88777a5cc3 100644
> --- a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
> +++ b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated
> -sha256  0c4204257be906c13f863b9481bb20ad616c9a80a074b6f160f863ac046dad27  qtquickcontrols2-0d3d39e821ea7634c174a29910c18d7101bce6f7.tar.bz2
> +sha256  53caea73e6bdf234cb445067be3bc4e07ed59af7da967638ac598188b719958e  qtquickcontrols2-74e8db97fdb9b55c4b4614b83f4bf17e00df55e9.tar.bz2
>   
>   # Hashes for license files:
>   sha256  d2cfc059acb4abd8e513cd0a73cd8489f34cbafa7bc34d5d31fb3210821cf8ca  LICENSE.GPLv3
> diff --git a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk
> index f847ec95ab..1732921203 100644
> --- a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk
> +++ b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -QT5QUICKCONTROLS2_VERSION = 0d3d39e821ea7634c174a29910c18d7101bce6f7
> +QT5QUICKCONTROLS2_VERSION = 74e8db97fdb9b55c4b4614b83f4bf17e00df55e9
>   QT5QUICKCONTROLS2_SITE = $(QT5_SITE)/qtquickcontrols2/-/archive/$(QT5QUICKCONTROLS2_VERSION)
>   QT5QUICKCONTROLS2_SOURCE = qtquickcontrols2-$(QT5QUICKCONTROLS2_VERSION).tar.bz2
>   QT5QUICKCONTROLS2_DEPENDENCIES = qt5declarative
> diff --git a/package/qt5/qt5quicktimeline/qt5quicktimeline.hash b/package/qt5/qt5quicktimeline/qt5quicktimeline.hash
> index e68f66edd8..a8acf3c5a2 100644
> --- a/package/qt5/qt5quicktimeline/qt5quicktimeline.hash
> +++ b/package/qt5/qt5quicktimeline/qt5quicktimeline.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated
> -sha256  ab113ead993206de4025c78fd2babea69824f52ff88fa78451b6bbcb932a6ab6  qtquicktimeline-2ce816fa5822bcc1c47678447405b2e5dc1312c1.tar.bz2
> +sha256  d22637609c4afcc7560d92c894eb55d4afa01706bb5c86499bf56f7c8723a605  qtquicktimeline-87ad61716a7cba5a070d8a7b1756c8b2b48d5d53.tar.bz2
>   
>   # Hashes for license files:
>   sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
> diff --git a/package/qt5/qt5quicktimeline/qt5quicktimeline.mk b/package/qt5/qt5quicktimeline/qt5quicktimeline.mk
> index 70cca38ff4..de94bd0375 100644
> --- a/package/qt5/qt5quicktimeline/qt5quicktimeline.mk
> +++ b/package/qt5/qt5quicktimeline/qt5quicktimeline.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -QT5QUICKTIMELINE_VERSION = 2ce816fa5822bcc1c47678447405b2e5dc1312c1
> +QT5QUICKTIMELINE_VERSION = 87ad61716a7cba5a070d8a7b1756c8b2b48d5d53
>   QT5QUICKTIMELINE_SITE = $(QT5_SITE)/qtquicktimeline/-/archive/$(QT5QUICKTIMELINE_VERSION)
>   QT5QUICKTIMELINE_SOURCE = qtquicktimeline-$(QT5QUICKTIMELINE_VERSION).tar.bz2
>   QT5QUICKTIMELINE_DEPENDENCIES = qt5declarative
> diff --git a/package/qt5/qt5remoteobjects/qt5remoteobjects.hash b/package/qt5/qt5remoteobjects/qt5remoteobjects.hash
> index 980101c7fb..1b41ab675f 100644
> --- a/package/qt5/qt5remoteobjects/qt5remoteobjects.hash
> +++ b/package/qt5/qt5remoteobjects/qt5remoteobjects.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated
> -sha256  f51631a142ac47a03266496dae9d07c734f092a0afe8c4e18cd78b7cf9c17b38  qtremoteobjects-809412e1cc2151c21f843796ef67705600f6aafb.tar.bz2
> +sha256  ef8e1f64911f7e03da6306693031fdf953af00d453ec154497178bb7ceab1aa2  qtremoteobjects-aa705010da0f658b78c1155babce7091ae44529a.tar.bz2
>   
>   # Hashes for license files:
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
> diff --git a/package/qt5/qt5remoteobjects/qt5remoteobjects.mk b/package/qt5/qt5remoteobjects/qt5remoteobjects.mk
> index 984f392dda..3160d37ad7 100644
> --- a/package/qt5/qt5remoteobjects/qt5remoteobjects.mk
> +++ b/package/qt5/qt5remoteobjects/qt5remoteobjects.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -QT5REMOTEOBJECTS_VERSION = 809412e1cc2151c21f843796ef67705600f6aafb
> +QT5REMOTEOBJECTS_VERSION = aa705010da0f658b78c1155babce7091ae44529a
>   QT5REMOTEOBJECTS_SITE = $(QT5_SITE)/qtremoteobjects/-/archive/$(QT5REMOTEOBJECTS_VERSION)
>   QT5REMOTEOBJECTS_SOURCE = qtremoteobjects-$(QT5REMOTEOBJECTS_VERSION).tar.bz2
>   QT5REMOTEOBJECTS_DEPENDENCIES = qt5base
> diff --git a/package/qt5/qt5script/qt5script.hash b/package/qt5/qt5script/qt5script.hash
> index b3e10491fd..d6572be818 100644
> --- a/package/qt5/qt5script/qt5script.hash
> +++ b/package/qt5/qt5script/qt5script.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated
> -sha256  fc625c1682d7ee5d1092255408cbaf08d5cac52eb45bacd3ab52937dc84d91f2  qtscript-5cec94b2c1503f106f4ef4778d016410ebb86211.tar.bz2
> +sha256  7731d8c85636d039a2b35a9ee0de7b5ebb0c3900a9b4845676041ce91f56f01f  qtscript-f237e324508dcf0dbabde9dd498eda9fa61c4ff0.tar.bz2
>   
>   # Hashes for license files:
>   sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
> diff --git a/package/qt5/qt5script/qt5script.mk b/package/qt5/qt5script/qt5script.mk
> index 313895f11b..96cbbfbbad 100644
> --- a/package/qt5/qt5script/qt5script.mk
> +++ b/package/qt5/qt5script/qt5script.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -QT5SCRIPT_VERSION = 5cec94b2c1503f106f4ef4778d016410ebb86211
> +QT5SCRIPT_VERSION = f237e324508dcf0dbabde9dd498eda9fa61c4ff0
>   QT5SCRIPT_SITE = $(QT5_SITE)/qtscript/-/archive/$(QT5SCRIPT_VERSION)
>   QT5SCRIPT_SOURCE = qtscript-$(QT5SCRIPT_VERSION).tar.bz2
>   QT5SCRIPT_INSTALL_STAGING = YES
> diff --git a/package/qt5/qt5scxml/qt5scxml.hash b/package/qt5/qt5scxml/qt5scxml.hash
> index 1c11ae5853..f4d52b8a52 100644
> --- a/package/qt5/qt5scxml/qt5scxml.hash
> +++ b/package/qt5/qt5scxml/qt5scxml.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated
> -sha256  5fc3e6166ab3588242864c5d8f18235a45f5c3396482ccfeb8590fe67d0cd549  qtscxml-dcbd73cf3e8a07dbfa249d7db2257caafa83781b.tar.bz2
> +sha256  a0113f54d9df14ebae15dd85530f87f093a284372ee8237d1ccceb02e6a4607b  qtscxml-631fd7bcc34802b7650c2b1dc73691463954d982.tar.bz2
>   
>   # Hashes for license files:
>   sha256  0dbe024961f6ab5c52689cbd036c977975d0d0f6a67ff97762d96cb819dd5652  LICENSE.GPL3-EXCEPT
> diff --git a/package/qt5/qt5scxml/qt5scxml.mk b/package/qt5/qt5scxml/qt5scxml.mk
> index af18b84e9d..f6ccb9298e 100644
> --- a/package/qt5/qt5scxml/qt5scxml.mk
> +++ b/package/qt5/qt5scxml/qt5scxml.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -QT5SCXML_VERSION = dcbd73cf3e8a07dbfa249d7db2257caafa83781b
> +QT5SCXML_VERSION = 631fd7bcc34802b7650c2b1dc73691463954d982
>   QT5SCXML_SITE = $(QT5_SITE)/qtscxml/-/archive/$(QT5SCXML_VERSION)
>   QT5SCXML_SOURCE = qtscxml-$(QT5SCXML_VERSION).tar.bz2
>   QT5SCXML_DEPENDENCIES = qt5declarative
> diff --git a/package/qt5/qt5sensors/qt5sensors.hash b/package/qt5/qt5sensors/qt5sensors.hash
> index 559f02e7f6..d43fa8ba65 100644
> --- a/package/qt5/qt5sensors/qt5sensors.hash
> +++ b/package/qt5/qt5sensors/qt5sensors.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated
> -sha256  fa0ffba89fed2086d06dab84074cdd789acbfb89da6f64c40a64fc3bc067832e  qtsensors-1ab8d6c7257f9ec060739b648704be1cf1c16b05.tar.bz2
> +sha256  8325826a259189fc7dea66651df4022a92a73664e953f86bce5bf5946ebacdf5  qtsensors-35eb5ac7eaef4745a38958c3ca780d7baa2e4f30.tar.bz2
>   
>   # Hashes for license files:
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
> diff --git a/package/qt5/qt5sensors/qt5sensors.mk b/package/qt5/qt5sensors/qt5sensors.mk
> index 299fab3db0..40bb72e038 100644
> --- a/package/qt5/qt5sensors/qt5sensors.mk
> +++ b/package/qt5/qt5sensors/qt5sensors.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -QT5SENSORS_VERSION = 1ab8d6c7257f9ec060739b648704be1cf1c16b05
> +QT5SENSORS_VERSION = 35eb5ac7eaef4745a38958c3ca780d7baa2e4f30
>   QT5SENSORS_SITE = $(QT5_SITE)/qtsensors/-/archive/$(QT5SENSORS_VERSION)
>   QT5SENSORS_SOURCE = qtsensors-$(QT5SENSORS_VERSION).tar.bz2
>   QT5SENSORS_INSTALL_STAGING = YES
> diff --git a/package/qt5/qt5serialbus/qt5serialbus.hash b/package/qt5/qt5serialbus/qt5serialbus.hash
> index b8f96cf0c0..01ffd7c215 100644
> --- a/package/qt5/qt5serialbus/qt5serialbus.hash
> +++ b/package/qt5/qt5serialbus/qt5serialbus.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated
> -sha256  caaccfdabdf502c3aacf9fa842ed31ed7682cab6ada69b06be1ba49273fb1f1c  qtserialbus-e34053fbda8d687e3dc294fbd5e3a88bf94a7a66.tar.bz2
> +sha256  fe08415d2348797429dc09722478630ceee3d7477652a2712460e79127b7291b  qtserialbus-f9f7eee60adac72fcf6617d164e3bf61222bb5c5.tar.bz2
>   
>   # Hashes for license files:
>   sha256  edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253  LICENSE.GPLv2
> diff --git a/package/qt5/qt5serialbus/qt5serialbus.mk b/package/qt5/qt5serialbus/qt5serialbus.mk
> index 70f23ce407..c718414932 100644
> --- a/package/qt5/qt5serialbus/qt5serialbus.mk
> +++ b/package/qt5/qt5serialbus/qt5serialbus.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -QT5SERIALBUS_VERSION = e34053fbda8d687e3dc294fbd5e3a88bf94a7a66
> +QT5SERIALBUS_VERSION = f9f7eee60adac72fcf6617d164e3bf61222bb5c5
>   QT5SERIALBUS_SITE = $(QT5_SITE)/qtserialbus/-/archive/$(QT5SERIALBUS_VERSION)
>   QT5SERIALBUS_SOURCE = qtserialbus-$(QT5SERIALBUS_VERSION).tar.bz2
>   QT5SERIALBUS_DEPENDENCIES = qt5serialport
> diff --git a/package/qt5/qt5serialport/qt5serialport.hash b/package/qt5/qt5serialport/qt5serialport.hash
> index d25b2193e7..58461430c7 100644
> --- a/package/qt5/qt5serialport/qt5serialport.hash
> +++ b/package/qt5/qt5serialport/qt5serialport.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated
> -sha256  83abb0c5b9c435a031abf1a36d6d44f8e3f5e2fc16150bdc78c6d33b25386bb6  qtserialport-191e67e428522a0e2e1e8d2f3440607a9760d441.tar.bz2
> +sha256  6d49d0da174632f51291b0190f6f1db2397a3b339cf293514252766f8a20c63b  qtserialport-c9abfcd5d88cb43c2a7c1d5ddecbff4cdd320694.tar.bz2
>   
>   # Hashes for license files:
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
> diff --git a/package/qt5/qt5serialport/qt5serialport.mk b/package/qt5/qt5serialport/qt5serialport.mk
> index cd96df2007..7d00bd2ab7 100644
> --- a/package/qt5/qt5serialport/qt5serialport.mk
> +++ b/package/qt5/qt5serialport/qt5serialport.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -QT5SERIALPORT_VERSION = 191e67e428522a0e2e1e8d2f3440607a9760d441
> +QT5SERIALPORT_VERSION = c9abfcd5d88cb43c2a7c1d5ddecbff4cdd320694
>   QT5SERIALPORT_SITE = $(QT5_SITE)/qtserialport/-/archive/$(QT5SERIALPORT_VERSION)
>   QT5SERIALPORT_SOURCE = qtserialport-$(QT5SERIALPORT_VERSION).tar.bz2
>   QT5SERIALPORT_INSTALL_STAGING = YES
> diff --git a/package/qt5/qt5svg/qt5svg.hash b/package/qt5/qt5svg/qt5svg.hash
> index 424891ac2c..4816206d64 100644
> --- a/package/qt5/qt5svg/qt5svg.hash
> +++ b/package/qt5/qt5svg/qt5svg.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated
> -sha256  eeb4175f0b2c3299abf0ca9d751886612dad5ecd212c954f9801b28b4696f4f7  qtsvg-23b8cf7d833c335d7735855570c05e9e0893a9b7.tar.bz2
> +sha256  063ee53515b934c00a65838fe8521142e4a9161b07c8e19b5bb0ea26a0ce9ab3  qtsvg-a9752b00a03438de8e5b080073816e12409404b7.tar.bz2
>   
>   # Hashes for license files:
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
> diff --git a/package/qt5/qt5svg/qt5svg.mk b/package/qt5/qt5svg/qt5svg.mk
> index 3072fd7a18..2a39ed18fe 100644
> --- a/package/qt5/qt5svg/qt5svg.mk
> +++ b/package/qt5/qt5svg/qt5svg.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -QT5SVG_VERSION = 23b8cf7d833c335d7735855570c05e9e0893a9b7
> +QT5SVG_VERSION = a9752b00a03438de8e5b080073816e12409404b7
>   QT5SVG_SITE = $(QT5_SITE)/qtsvg/-/archive/$(QT5SVG_VERSION)
>   QT5SVG_SOURCE = qtsvg-$(QT5SVG_VERSION).tar.bz2
>   QT5SVG_INSTALL_STAGING = YES
> diff --git a/package/qt5/qt5tools/qt5tools.hash b/package/qt5/qt5tools/qt5tools.hash
> index 58ed752b9b..d603598257 100644
> --- a/package/qt5/qt5tools/qt5tools.hash
> +++ b/package/qt5/qt5tools/qt5tools.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated
> -sha256  76052a183a41fcddfd4446ffba6a99c3e77a21453fe629cf67379ffa617a0d53  qttools-53ee43a51b5a3de2877dafffc78e71ff55926708.tar.bz2
> +sha256  b6eebbd61dcde981d63ce6de39b3c957bad8f11b0140585ba4d57d166c4dd79d  qttools-32912a06aadfc3dcbc34e0a668ce2c78351eee6e.tar.bz2
>   
>   # Hashes for license files:
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
> diff --git a/package/qt5/qt5tools/qt5tools.mk b/package/qt5/qt5tools/qt5tools.mk
> index e87c9b50a5..a01a336584 100644
> --- a/package/qt5/qt5tools/qt5tools.mk
> +++ b/package/qt5/qt5tools/qt5tools.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -QT5TOOLS_VERSION = 53ee43a51b5a3de2877dafffc78e71ff55926708
> +QT5TOOLS_VERSION = 32912a06aadfc3dcbc34e0a668ce2c78351eee6e
>   QT5TOOLS_SITE = $(QT5_SITE)/qttools/-/archive/$(QT5TOOLS_VERSION)
>   QT5TOOLS_SOURCE = qttools-$(QT5TOOLS_VERSION).tar.bz2
>   
> diff --git a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash
> index 1cdd8f0386..60d51fa5fe 100644
> --- a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash
> +++ b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated
> -sha256  6ef14ba8bb5eb287320b6c0d6e61c5c2916a94ef754bb8a2d89c123043485d67  qtvirtualkeyboard-e8ae4757dd32e8dbf69a7c57f2bc5c1e238416db.tar.bz2
> +sha256  e1e356e81f3a3fb5da6f6739aa475c15aab15090e202de6704441a3bf41c335b  qtvirtualkeyboard-9fbb837b55887bec5d73fad142c853ef68db35b3.tar.bz2
>   
>   # Hashes for license files:
>   sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
> diff --git a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
> index c31d455c4e..067db80330 100644
> --- a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
> +++ b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -QT5VIRTUALKEYBOARD_VERSION = e8ae4757dd32e8dbf69a7c57f2bc5c1e238416db
> +QT5VIRTUALKEYBOARD_VERSION = 9fbb837b55887bec5d73fad142c853ef68db35b3
>   QT5VIRTUALKEYBOARD_SITE = $(QT5_SITE)/qtvirtualkeyboard/-/archive/$(QT5VIRTUALKEYBOARD_VERSION)
>   QT5VIRTUALKEYBOARD_SOURCE = qtvirtualkeyboard-$(QT5VIRTUALKEYBOARD_VERSION).tar.bz2
>   QT5VIRTUALKEYBOARD_DEPENDENCIES = qt5declarative qt5svg
> diff --git a/package/qt5/qt5wayland/0001-Add-missing-define-guards.patch b/package/qt5/qt5wayland/0001-Add-missing-define-guards.patch
> deleted file mode 100644
> index adad3768b2..0000000000
> --- a/package/qt5/qt5wayland/0001-Add-missing-define-guards.patch
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -From 05658e127dedfff65789860415537c6920ec574d Mon Sep 17 00:00:00 2001
> -From: Samuli Piippo <samuli.piippo@qt.io>
> -Date: Thu, 22 Apr 2021 15:29:56 +0300
> -Subject: [PATCH] Add missing define guards
> -
> -Ammend cca1b94190a094b5d1d7ce492b6533e2d330c5e8 to use m_composeState
> -only if xcbcommon is available.
> -
> -Pick-to: 5.15
> -Change-Id: I48332b15def3282c5bda3e1c7c393ea7e9849cbe
> -Reviewed-by: Aleix Pol Gonzalez <aleixpol@kde.org>
> -[Backported from: 05658e127dedfff65789860415537c6920ec574d]
> -Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> ----
> - src/client/qwaylandinputcontext.cpp | 2 ++
> - 1 file changed, 2 insertions(+)
> -
> -diff --git a/src/client/qwaylandinputcontext.cpp b/src/client/qwaylandinputcontext.cpp
> -index 16e03ea1..cbf63cde 100644
> ---- a/src/client/qwaylandinputcontext.cpp
> -+++ b/src/client/qwaylandinputcontext.cpp
> -@@ -408,8 +408,10 @@ bool QWaylandInputContext::isValid() const
> - void QWaylandInputContext::reset()
> - {
> -     qCDebug(qLcQpaInputMethods) << Q_FUNC_INFO;
> -+#if QT_CONFIG(xkbcommon)
> -     if (m_composeState)
> -         xkb_compose_state_reset(m_composeState);
> -+#endif
> -
> -     QPlatformInputContext::reset();
> -
> ---
> -2.35.1
> -
> diff --git a/package/qt5/qt5wayland/qt5wayland.hash b/package/qt5/qt5wayland/qt5wayland.hash
> index 58935ceadc..c9d7f3434c 100644
> --- a/package/qt5/qt5wayland/qt5wayland.hash
> +++ b/package/qt5/qt5wayland/qt5wayland.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated
> -sha256  bfe9bce353c036356dc7bca04e634f03c7c924381062ce89627a88df0ae7484e  qtwayland-36659e6130ed3fc2b3f0c91423408ef5ecb7b991.tar.bz2
> +sha256  c881745403a7c3639ee928f64ac9e7252d7a941cb62ef682a7ee83ccf3ae0a60  qtwayland-8faf74a7966b520f0ac3eb4d88235f8ec63b31b8.tar.bz2
>   
>   # Hashes for license files:
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
> diff --git a/package/qt5/qt5wayland/qt5wayland.mk b/package/qt5/qt5wayland/qt5wayland.mk
> index 63fa1f21c0..aeca1b0381 100644
> --- a/package/qt5/qt5wayland/qt5wayland.mk
> +++ b/package/qt5/qt5wayland/qt5wayland.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -QT5WAYLAND_VERSION = 36659e6130ed3fc2b3f0c91423408ef5ecb7b991
> +QT5WAYLAND_VERSION = 8faf74a7966b520f0ac3eb4d88235f8ec63b31b8
>   QT5WAYLAND_SITE = $(QT5_SITE)/qtwayland/-/archive/$(QT5WAYLAND_VERSION)
>   QT5WAYLAND_SOURCE = qtwayland-$(QT5WAYLAND_VERSION).tar.bz2
>   QT5WAYLAND_DEPENDENCIES = wayland
> diff --git a/package/qt5/qt5webengine/0001-gn.pro-don-t-link-statically-with-libstc.patch b/package/qt5/qt5webengine/0001-gn.pro-don-t-link-statically-with-libstc.patch
> index dff3e6c849..aeec4c58b1 100644
> --- a/package/qt5/qt5webengine/0001-gn.pro-don-t-link-statically-with-libstc.patch
> +++ b/package/qt5/qt5webengine/0001-gn.pro-don-t-link-statically-with-libstc.patch
> @@ -28,24 +28,25 @@ linking statically by default.
>   [1] https://github.com/qt/qtwebengine-chromium/commit/cfab9198a9917f42cf08b1caf84ab9b71aac1911#diff-905c8f054808213577c0a92d1b704615
>   
>   Signed-off-by: Romain Naour <romain.naour@gmail.com>
> +Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +[Giulio: rebased to qt5.15.10]
>   ---
>    src/buildtools/gn.pro | 3 ++-
>    1 file changed, 2 insertions(+), 1 deletion(-)
>   
>   diff --git a/src/buildtools/gn.pro b/src/buildtools/gn.pro
> -index 033202e6..5dd8e241 100644
> +index f94694da0..19079a5b3 100644
>   --- a/src/buildtools/gn.pro
>   +++ b/src/buildtools/gn.pro
>   @@ -20,7 +20,8 @@ build_pass|!debug_and_release {
> -
> +
>                gn_gen_args = --no-last-commit-position --out-path $$out_path \
>                              --cc \"$$which($$QMAKE_CC)\" --cxx \"$$which($$QMAKE_CXX)\" \
>   -                          --ld \"$$which($$QMAKE_LINK)\"
>   +                          --ld \"$$which($$QMAKE_LINK)\" \
>   +                          --no-static-libstdc++
> -
> -             msvc:!clang_cl: gn_gen_args += --use-lto
> -
> ---
> -2.25.4
> +             !isEmpty(QMAKE_AR): gn_gen_args += --ar \"$$which($$first(QMAKE_AR))\"
>   
> +             msvc:!clang_cl: gn_gen_args += --use-lto
> +--
> +2.34.1
> diff --git a/package/qt5/qt5webengine/qt5webengine.hash b/package/qt5/qt5webengine/qt5webengine.hash
> index 1d2b70c4f6..038446a9f4 100644
> --- a/package/qt5/qt5webengine/qt5webengine.hash
> +++ b/package/qt5/qt5webengine/qt5webengine.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated
> -sha256  fb7abcf88d4336d55565627e18b33df1855fefb0f12e24931b6a7decbe60913b  qtwebengine-v5.15.8-lts.tar.bz2
> +sha256  4a3456df42e1c1b859232b3ee1d58360e629d55daf6e5ad308871142c1b0c2fa  qtwebengine-v5.15.10-lts.tar.bz2
>   
>   # Locally calculated
>   sha256  f34787ef0342c614b667186a6ec2f5d6b9d650e30142a2788a589a89743e88e9  LICENSE.Chromium
> diff --git a/package/qt5/qt5webview/qt5webview.mk b/package/qt5/qt5webview/qt5webview.mk
> index 54da733e7b..a55fd8ae74 100644
> --- a/package/qt5/qt5webview/qt5webview.mk
> +++ b/package/qt5/qt5webview/qt5webview.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -QT5WEBVIEW_VERSION = 826d2a33929c69807917536d48b7861e7682001e
> +QT5WEBVIEW_VERSION = 87577dde04ed219bda776dabca86176149736331
>   QT5WEBVIEW_SITE = $(QT5_SITE)/qtwebview/-/archive/$(QT5WEBVIEW_VERSION)
>   QT5WEBVIEW_SOURCE = qtwebview-$(QT5WEBVIEW_VERSION).tar.bz2
>   QT5WEBVIEW_DEPENDENCIES = qt5webengine
> diff --git a/package/qt5/qt5x11extras/qt5x11extras.mk b/package/qt5/qt5x11extras/qt5x11extras.mk
> index fb6650e84a..80c5498518 100644
> --- a/package/qt5/qt5x11extras/qt5x11extras.mk
> +++ b/package/qt5/qt5x11extras/qt5x11extras.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -QT5X11EXTRAS_VERSION = 51b0a5a2e3e35f4cb17da1e7cb4babef6294bfb4
> +QT5X11EXTRAS_VERSION = 982f20eb585d77e5b5c721e05a466d7161f7f2d1
>   QT5X11EXTRAS_SITE = $(QT5_SITE)/qtx11extras/-/archive/$(QT5X11EXTRAS_VERSION)
>   QT5X11EXTRAS_SOURCE = qtx11extras-$(QT5X11EXTRAS_VERSION).tar.bz2
>   QT5X11EXTRAS_INSTALL_STAGING = YES
> diff --git a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
> index a1dbb40154..353dfc8485 100644
> --- a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
> +++ b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated
> -sha256  6243e6334c0d1467e3e5bdecd981d7e673f4cc99cf2cee3b99597be4218a4bd2  qtxmlpatterns-dfcae10dec8c1c2c544ad0cd303cea113b0af51d.tar.bz2
> +sha256  067b801049f6fada8e7ebcfbce0530db6217a1a94b8ed34c99c530be4129889d  qtxmlpatterns-30e6c84fe2752cde8b53aff9d38c2095cd7c8761.tar.bz2
>   
>   # Hashes for license files:
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
> diff --git a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
> index 6711e9bf70..803c36cf04 100644
> --- a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
> +++ b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -QT5XMLPATTERNS_VERSION = dfcae10dec8c1c2c544ad0cd303cea113b0af51d
> +QT5XMLPATTERNS_VERSION = 30e6c84fe2752cde8b53aff9d38c2095cd7c8761
>   QT5XMLPATTERNS_SITE = $(QT5_SITE)/qtxmlpatterns/-/archive/$(QT5XMLPATTERNS_VERSION)
>   QT5XMLPATTERNS_SOURCE = qtxmlpatterns-$(QT5XMLPATTERNS_VERSION).tar.bz2
>   QT5XMLPATTERNS_INSTALL_STAGING = YES


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

