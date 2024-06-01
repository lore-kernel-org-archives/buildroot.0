Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F4F3C25B76
	for <buildroot@archiver.kernel.org>; Sat,  1 Jun 2024 17:10:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC9D7608EC;
	Sat,  1 Jun 2024 17:10:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5esFj_DDNkFV; Sat,  1 Jun 2024 17:10:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 40D5B608A1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40D5B608A1;
	Sat,  1 Jun 2024 17:10:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3FC5E1BF23B
 for <buildroot@lists.busybox.net>; Sat,  1 Jun 2024 17:10:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2A40540206
 for <buildroot@lists.busybox.net>; Sat,  1 Jun 2024 17:10:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8M3fy7dOb24W for <buildroot@lists.busybox.net>;
 Sat,  1 Jun 2024 17:10:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 24652401FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 24652401FF
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 24652401FF
 for <buildroot@buildroot.org>; Sat,  1 Jun 2024 17:10:18 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 97CB213F89C;
 Sat,  1 Jun 2024 19:10:08 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 01 Jun 2024 19:10:08 +0200
Date: Sat, 1 Jun 2024 19:10:08 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Message-ID: <ZltV8DAQmGI-vTpe@landeda>
References: <20240531151325.2443323-1-roy.kollen.svendsen@akersolutions.com>
 <20240531151325.2443323-6-roy.kollen.svendsen@akersolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240531151325.2443323-6-roy.kollen.svendsen@akersolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717261816;
 bh=f8VdM0rajlSSZctwSSz7uYmBfQvTZaa6DDFvDCiqD2c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gQPPIEpY1Rxv9W+qWAnGmUFfDJyGmVG8o5Hans+LsnXYoGFQCzwjNO9VEa6GtmAA2
 Z+ez53SdFcy+Av9A+neWXb6coZLKsVzfz/iMP7HsLuQ7mNargoPf3Uw/gx1yi8Bf4h
 P2SOakEJLHAVIZvYoA/oHe5hKQS5XbMoztp0JWn6uSPrNlFNxsIXNHgFebd53d56Ik
 HSogdGM6RnyiWTDOy/sIRib2obVnmiHJRySH+0Bkmum/rD/50s1/Htv3BdHKVAwD8B
 4NG6urIVjP8U3ltmMMEb3yIwXrJxcy/W0A/4XO0oTuXuugwar2ofzMnHE/BV3QqkqJ
 IX3onviNYJ1Jw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=gQPPIEpY
Subject: Re: [Buildroot] [PATCH v5 06/14] package/qt6/qt6shadertools: new
 package
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
Cc: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Zoltan Gyarmati <zgyarmati@zgyarmati.de>,
 Jesse Van Gavere <jesseevg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Roy, All,

Thanks for your new iteration of this series.

I was looking at applying it, but I have a comment about this patch: why
is the host qt6base required to have GUI support to build the target
qt6shadertools?

That's a question Thomas already asked in a previous iteration:
    https://lore.kernel.org/buildroot/20240509164507.4682bee8@windsurf/

but I could not see an explanation as a reply to Thomas, or in the
following versions of this series.

Could you provide a little bit of an explanation? For example, does it
need a tool that is provided by qt6base only when the gui module is
enabled? Or something else?

It does not need to be a long explanation, just a sentence or maybe two;
we just need to understand the dependency.

Same goes for the qt6tols and its dependencies on HOST_QT6BASE_NETWORK
and HOST_QT6BASE_SQL, and other such dependencies.

Thank you!

Regards,
Yann E. MORIN.

On 2024-05-31 17:13 +0200, Roy Kollen Svendsen spake thusly:
> Signed-off-by: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>
> ---
> Changes v4 -> v5:
>   - Bump to v6.7.1
> 
>  package/qt6/Config.in                         |  1 +
>  package/qt6/qt6shadertools/Config.in          | 13 +++++++
>  .../qt6/qt6shadertools/qt6shadertools.hash    | 10 +++++
>  package/qt6/qt6shadertools/qt6shadertools.mk  | 39 +++++++++++++++++++
>  4 files changed, 63 insertions(+)
>  create mode 100644 package/qt6/qt6shadertools/Config.in
>  create mode 100644 package/qt6/qt6shadertools/qt6shadertools.hash
>  create mode 100644 package/qt6/qt6shadertools/qt6shadertools.mk
> 
> diff --git a/package/qt6/Config.in b/package/qt6/Config.in
> index 276a0217ab..b7e95a6885 100644
> --- a/package/qt6/Config.in
> +++ b/package/qt6/Config.in
> @@ -47,6 +47,7 @@ source "package/qt6/qt6base/Config.in"
>  source "package/qt6/qt6core5compat/Config.in"
>  source "package/qt6/qt6serialbus/Config.in"
>  source "package/qt6/qt6serialport/Config.in"
> +source "package/qt6/qt6shadertools/Config.in"
>  source "package/qt6/qt6svg/Config.in"
>  
>  endif
> diff --git a/package/qt6/qt6shadertools/Config.in b/package/qt6/qt6shadertools/Config.in
> new file mode 100644
> index 0000000000..1b47dc6132
> --- /dev/null
> +++ b/package/qt6/qt6shadertools/Config.in
> @@ -0,0 +1,13 @@
> +config BR2_PACKAGE_QT6SHADERTOOLS
> +	bool "qt6shadertools"
> +	select BR2_PACKAGE_HOST_QT6BASE_GUI
> +	select BR2_PACKAGE_QT6BASE_GUI
> +	help
> +	  Qt is a cross-platform application and UI framework for
> +	  developers using C++.
> +
> +	  The Qt Shader Tools module builds on the SPIR-V Open
> +	  Source Ecosystem as described at the Khronos SPIR-V web
> +	  site.
> +
> +	  https://doc.qt.io/qt-6/qtshadertools-index.html
> diff --git a/package/qt6/qt6shadertools/qt6shadertools.hash b/package/qt6/qt6shadertools/qt6shadertools.hash
> new file mode 100644
> index 0000000000..8e80d64851
> --- /dev/null
> +++ b/package/qt6/qt6shadertools/qt6shadertools.hash
> @@ -0,0 +1,10 @@
> +# Hash from: https://download.qt.io/official_releases/qt/6.7/6.7.1/submodules/qtshadertools-everywhere-src-6.7.1.tar.xz.sha256
> +sha256  e585e3a985b2e2bad8191a84489a04e69c3defc6022a8e746aad22a1f17910c2  qtshadertools-everywhere-src-6.7.1.tar.xz
> +
> +# Hashes for license files:
> +sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
> +sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  LICENSES/GFDL-1.3-no-invariants-only.txt
> +sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-only.txt
> +sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
> +sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
> +sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
> diff --git a/package/qt6/qt6shadertools/qt6shadertools.mk b/package/qt6/qt6shadertools/qt6shadertools.mk
> new file mode 100644
> index 0000000000..108f409380
> --- /dev/null
> +++ b/package/qt6/qt6shadertools/qt6shadertools.mk
> @@ -0,0 +1,39 @@
> +################################################################################
> +#
> +# qt6shadertools
> +#
> +################################################################################
> +
> +QT6SHADERTOOLS_VERSION = $(QT6_VERSION)
> +QT6SHADERTOOLS_SITE = $(QT6_SITE)
> +QT6SHADERTOOLS_SOURCE = qtshadertools-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6SHADERTOOLS_VERSION).tar.xz
> +QT6SHADERTOOLS_INSTALL_STAGING = YES
> +QT6SHADERTOOLS_SUPPORTS_IN_SOURCE_BUILD = NO
> +
> +QT6SHADERTOOLS_CMAKE_BACKEND = ninja
> +
> +QT6SHADERTOOLS_LICENSE = \
> +	GPL-2.0+ or LGPL-3.0, \
> +	GPL-3.0, GFDL-1.3 no invariants (docs)
> +
> +QT6SHADERTOOLS_LICENSE_FILES = \
> +	LICENSES/GPL-2.0-only.txt \
> +	LICENSES/GPL-3.0-only.txt \
> +	LICENSES/LGPL-3.0-only.txt \
> +	LICENSES/GFDL-1.3-no-invariants-only.txt
> +
> +QT6SHADERTOOLS_CONF_OPTS = \
> +	-DBUILD_WITH_PCH=OFF \
> +	-DQT_BUILD_EXAMPLES=OFF \
> +	-DQT_BUILD_TESTS=OFF
> +
> +QT6SHADERTOOLS_DEPENDENCIES = \
> +	host-pkgconf \
> +	qt6base \
> +	host-qt6shadertools
> +
> +HOST_QT6SHADERTOOLS_DEPENDENCIES = \
> +	host-qt6base
> +
> +$(eval $(cmake-package))
> +$(eval $(host-cmake-package))
> -- 
> 2.45.1
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
