Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8D16C25B76
	for <buildroot@archiver.kernel.org>; Sat,  1 Jun 2024 17:15:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C57C561162;
	Sat,  1 Jun 2024 17:15:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gnFzfAQnaZ59; Sat,  1 Jun 2024 17:15:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 54B19608DF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54B19608DF;
	Sat,  1 Jun 2024 17:15:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E2CA41BF23B
 for <buildroot@lists.busybox.net>; Sat,  1 Jun 2024 17:15:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CD57584638
 for <buildroot@lists.busybox.net>; Sat,  1 Jun 2024 17:15:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3dsLstm9dN3n for <buildroot@lists.busybox.net>;
 Sat,  1 Jun 2024 17:15:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 997D884615
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 997D884615
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 997D884615
 for <buildroot@buildroot.org>; Sat,  1 Jun 2024 17:15:17 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id B303813F8A9;
 Sat,  1 Jun 2024 19:15:08 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 01 Jun 2024 19:15:08 +0200
Date: Sat, 1 Jun 2024 19:15:08 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Message-ID: <ZltXHCyhxx8XkbTm@landeda>
References: <20240531151325.2443323-1-roy.kollen.svendsen@akersolutions.com>
 <20240531151325.2443323-9-roy.kollen.svendsen@akersolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240531151325.2443323-9-roy.kollen.svendsen@akersolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717262116;
 bh=XuqjLB5r/F7PgYKce1eIR7GBDc1o+rLNP9/+EjRP5gY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VqplEm4Lf808jceCw5vD1ehfg3ks6znDf3OSGhFLSHflEmU8mmluWW3ruvpKeBZe8
 1Be5obF/hD3gBx3HjU1XpsEfukKpNB95oKOg5qnBjukoWDjksZqLwn3bELLWXrZVXM
 8Q77Lh1vk6oIv09kaMe9tA0cOK3mrafmDa+QF2OaHwTb6gBJDeYNQpBbI+lhE0T49N
 II0rQiZDB4kFLuZ8hhZjkVtWkmk6bOnhRxlMlDjQM7sJUo4Dnm2NtwOK2tzHyDPHkC
 +qHHMnZrnlL1uSrGh3Xjhuu/iJDaY2eeU/LzeHme7HwUOrp94sIAXg5FZHX3MPzUby
 uAbD4DE0hgOJA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=VqplEm4L
Subject: Re: [Buildroot] [PATCH v5 09/14] package/qt6/qt6declarative: new
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

On 2024-05-31 17:13 +0200, Roy Kollen Svendsen spake thusly:
> We add the patch to avoid checking for FEATURE_ssl when FEATURE_network
> is not available. FEATURE_ssl is defined by the Qt Network module. So
> we will get the following build failure if the patch is not applied and
> FEATURE_network=ON:
> 
> CMake Error at qt6base-6.7.0/cmake/QtFeature.cmake:376 (message):
>   Attempting to evaluate feature ssl but its definition is missing.  Either
>   the feature does not exist or a dependency to the module that defines it is
>   missing
> Call Stack (most recent call first):
>   qt6base-6.7.0/cmake/QtFeature.cmake:141 (qt_evaluate_feature)
>   qt6base-6.7.0/cmake/QtFeature.cmake:180 (qt_internal_evaluate_config_expression)
>   qt6base-6.7.0/cmake/QtFeature.cmake:396 (qt_evaluate_config_expression)
>   qt6base-6.7.0/cmake/QtFeature.cmake:711 (qt_evaluate_feature)
>   qt6base-6.7.0/cmake/QtFeature.cmake:680 (qt_feature_module_end)
>   src/qml/CMakeLists.txt:13 (qt_feature_evaluate_features)
> 
> To avoid the following build error, we also make sure the host qt6base is
> built with Testlib enabled:
> 
> CMake Error at buildroot/output/build/qt6base-6.7.0/cmake/QtToolHelpers.cmake:684 (message):
>   Failed to find the host tool "Qt6::qmltestrunner".  It is part of the

This is the kind of explanation (even if a bit verbose) that we indeed
need for the requirement on the host qt6base having some modules
enabled. If you can provide that for the other packages, that would be
awesome!

Regards,
Yann E. MORIN.

>   Qt6QmlTools package, but the package did not contain the tool.  Make sure
>   that the host module Qml was built with all features enabled (no explicitly
>   disabled tools).
> Call Stack (most recent call first):
>   buildroot/output/build/qt6base-6.7.0/cmake/QtToolHelpers.cmake:72 (qt_internal_find_tool)
>   tools/qmltestrunner/CMakeLists.txt:11 (qt_internal_add_tool)
> 
> Signed-off-by: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>
> ---
> Changes v4 -> v5:
>   - Bump to v6.7.1
> 
>  package/qt6/Config.in                         |  1 +
>  ...1-Fix-build-with--no-feature-network.patch | 28 ++++++++++
>  package/qt6/qt6declarative/Config.in          | 24 ++++++++
>  .../qt6/qt6declarative/qt6declarative.hash    | 11 ++++
>  package/qt6/qt6declarative/qt6declarative.mk  | 56 +++++++++++++++++++
>  5 files changed, 120 insertions(+)
>  create mode 100644 package/qt6/qt6declarative/0001-Fix-build-with--no-feature-network.patch
>  create mode 100644 package/qt6/qt6declarative/Config.in
>  create mode 100644 package/qt6/qt6declarative/qt6declarative.hash
>  create mode 100644 package/qt6/qt6declarative/qt6declarative.mk
> 
> diff --git a/package/qt6/Config.in b/package/qt6/Config.in
> index 81682af476..625134d281 100644
> --- a/package/qt6/Config.in
> +++ b/package/qt6/Config.in
> @@ -45,6 +45,7 @@ if BR2_PACKAGE_QT6
>  
>  source "package/qt6/qt6base/Config.in"
>  source "package/qt6/qt6core5compat/Config.in"
> +source "package/qt6/qt6declarative/Config.in"
>  source "package/qt6/qt6languageserver/Config.in"
>  source "package/qt6/qt6serialbus/Config.in"
>  source "package/qt6/qt6serialport/Config.in"
> diff --git a/package/qt6/qt6declarative/0001-Fix-build-with--no-feature-network.patch b/package/qt6/qt6declarative/0001-Fix-build-with--no-feature-network.patch
> new file mode 100644
> index 0000000000..bef5794229
> --- /dev/null
> +++ b/package/qt6/qt6declarative/0001-Fix-build-with--no-feature-network.patch
> @@ -0,0 +1,28 @@
> +From 8377691a0998fd84e6fc8349a5db450bf2d79164 Mon Sep 17 00:00:00 2001
> +From: Tasuku Suzuki <tasuku.suzuki@signal-slot.co.jp>
> +Date: Tue, 21 Nov 2023 23:58:43 +0900
> +Subject: Fix build with -no-feature-network
> +
> +Change-Id: Ib21012301da6afb5458f707b39a9a8079d93eb93
> +Reviewed-by: Ulf Hermann <ulf.hermann@qt.io>
> +Upstream: https://code.qt.io/cgit/qt/qtdeclarative.git/commit/?id=8377691a0998fd84e6fc8349a5db450bf2d79164
> +Signed-off-by: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>
> +---
> + src/qml/configure.cmake | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/qml/configure.cmake b/src/qml/configure.cmake
> +index 2d0434643a..d1ff90bd54 100644
> +--- a/src/qml/configure.cmake
> ++++ b/src/qml/configure.cmake
> +@@ -82,7 +82,7 @@ qt_feature("qml-ssl" PUBLIC
> +     SECTION "QML"
> +     LABEL "QML SSL support"
> +     PURPOSE "Provides ssl support in QML."
> +-    CONDITION QT_FEATURE_ssl
> ++    CONDITION QT_FEATURE_qml_network AND QT_FEATURE_ssl
> + )
> + 
> + # On arm and arm64 we need a specialization of cacheFlush() for each OS to be
> +-- 
> +cgit v1.2.3
> diff --git a/package/qt6/qt6declarative/Config.in b/package/qt6/qt6declarative/Config.in
> new file mode 100644
> index 0000000000..1daa645413
> --- /dev/null
> +++ b/package/qt6/qt6declarative/Config.in
> @@ -0,0 +1,24 @@
> +config BR2_PACKAGE_QT6DECLARATIVE
> +	bool "qt6declarative"
> +	# Enable host test module to ensure that qmltestrunner is built
> +	select BR2_PACKAGE_HOST_QT6BASE_TEST if BR2_PACKAGE_QT6BASE_TEST
> +	help
> +	  Qt is a cross-platform application and UI framework for
> +	  developers using C++.
> +
> +	  This package corresponds to the qt6declarative module.
> +
> +	  https://doc.qt.io/qt-6/qtdeclarative-index.html
> +
> +if BR2_PACKAGE_QT6DECLARATIVE
> +
> +config BR2_PACKAGE_QT6DECLARATIVE_QUICK
> +	bool "quick module"
> +	select BR2_PACKAGE_QT6BASE_GUI
> +	select BR2_PACKAGE_QT6LANGUAGESERVER
> +	select BR2_PACKAGE_QT6SHADERTOOLS
> +	select BR2_PACKAGE_QT6BASE_OPENGL if BR2_PACKAGE_QT6_GL_SUPPORTS
> +	select BR2_PACKAGE_HOST_QT6SVG
> +	select BR2_PACKAGE_HOST_QT6DECLARATIVE
> +
> +endif
> diff --git a/package/qt6/qt6declarative/qt6declarative.hash b/package/qt6/qt6declarative/qt6declarative.hash
> new file mode 100644
> index 0000000000..480e3805ca
> --- /dev/null
> +++ b/package/qt6/qt6declarative/qt6declarative.hash
> @@ -0,0 +1,11 @@
> +# Hash from: https://download.qt.io/official_releases/qt/6.7/6.7.1/submodules/qtdeclarative-everywhere-src-6.7.1.tar.xz.sha256
> +sha256  81135c96ed2f599385b8a68c57f4f438dad193c62f946f5b200a321558fd9f1c  qtdeclarative-everywhere-src-6.7.1.tar.xz
> +
> +# Hashes for license files:
> +sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
> +sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  LICENSES/GFDL-1.3-no-invariants-only.txt
> +sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-only.txt
> +sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
> +sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
> +sha256  9b1f50aae6267f9d5e0ceb6775ee86450262c25ec7c0573e151fe5d3f18a4700  LICENSES/LicenseRef-Qt-Commercial.txt
> +sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
> diff --git a/package/qt6/qt6declarative/qt6declarative.mk b/package/qt6/qt6declarative/qt6declarative.mk
> new file mode 100644
> index 0000000000..2348ff2dae
> --- /dev/null
> +++ b/package/qt6/qt6declarative/qt6declarative.mk
> @@ -0,0 +1,56 @@
> +################################################################################
> +#
> +# qt6declaratve
> +#
> +################################################################################
> +
> +QT6DECLARATIVE_VERSION = $(QT6_VERSION)
> +QT6DECLARATIVE_SITE = $(QT6_SITE)
> +QT6DECLARATIVE_SOURCE = qtdeclarative-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6DECLARATIVE_VERSION).tar.xz
> +QT6DECLARATIVE_INSTALL_STAGING = YES
> +
> +QT6DECLARATIVE_SUPPORTS_IN_SOURCE_BUILD = NO
> +
> +QT6DECLARATIVE_CMAKE_BACKEND = ninja
> +
> +QT6DECLARATIVE_LICENSE = \
> +	GPL-2.0+ or LGPL-3.0, \
> +	GPL-3.0, GFDL-1.3 no invariants (docs)
> +
> +QT6DECLARATIVE_LICENSE_FILES = \
> +	LICENSES/GPL-2.0-only.txt \
> +	LICENSES/GPL-3.0-only.txt \
> +	LICENSES/LGPL-3.0-only.txt \
> +	LICENSES/GFDL-1.3-no-invariants-only.txt
> +
> +QT6DECLARATIVE_CONF_OPTS = \
> +	-DQT_FEATURE_qml_profiler=OFF \
> +	-DQT_HOST_PATH=$(HOST_DIR) \
> +	-DBUILD_WITH_PCH=OFF \
> +	-DQT_BUILD_EXAMPLES=OFF \
> +	-DQT_BUILD_TESTS=OFF
> +
> +HOST_QT6DECLARATIVE_CONF_OPTS = \
> +	-DQT_HOST_PATH=$(HOST_DIR) \
> +	-DBUILD_WITH_PCH=OFF \
> +	-DQT_BUILD_EXAMPLES=OFF \
> +	-DQT_BUILD_TESTS=OFF \
> +	-DQT_FEATURE_ssl=OFF
> +
> +QT6DECLARATIVE_DEPENDENCIES = \
> +	host-qt6base \
> +	host-qt6svg \
> +	host-qt6shadertools \
> +	host-qt6declarative \
> +	qt6base \
> +	qt6shadertools \
> +	qt6languageserver \
> +	qt6svg
> +
> +HOST_QT6DECLARATIVE_DEPENDENCIES = \
> +	host-qt6base \
> +	host-qt6svg \
> +	host-qt6shadertools
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
