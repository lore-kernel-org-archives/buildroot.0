Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73599C3DA4A
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 10:24:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BDA38410C5;
	Fri, 12 Jul 2024 10:24:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fe6b4EkIjeXk; Fri, 12 Jul 2024 10:24:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48BFE410D1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48BFE410D1;
	Fri, 12 Jul 2024 10:24:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 001381BF47F
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 10:24:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ED5F2410D1
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 10:24:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WwK2Lwzc1jv1 for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 10:24:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 28877410C5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 28877410C5
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 28877410C5
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 10:24:08 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D127120004;
 Fri, 12 Jul 2024 10:24:06 +0000 (UTC)
Date: Fri, 12 Jul 2024 12:24:05 +0200
To: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Message-ID: <20240712122405.00aa70a7@windsurf>
In-Reply-To: <20240625211847.1419944-12-roykollensvendsen@gmail.com>
References: <20240618212646.4154474-1-roykollensvendsen@gmail.com>
 <20240625211847.1419944-1-roykollensvendsen@gmail.com>
 <20240625211847.1419944-12-roykollensvendsen@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720779847;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7rwWjv6EM7J6mHPB8ixhakNBAruzejoSIQDc6HGyPCs=;
 b=JdeYT2LH+AKFVVkuNMqdpGvBUF6ZSBMYJDVtXIpHW5La++7mOV4WDawsiDjfvTPYkPU7BM
 7R8QdFjoULAYDdAHCnJoFc5ZJsFFnOFybIiRTBDt4RAyAtEf2tWkYzqekBf3y6YCx9dOSx
 PYFxMlS6DvGlRGar3ooyuv2f6VMc5HVKxfnfqZrjnyxwvGsyPrLw7OO58ckTlIEp+vJVLR
 rhOQAPskS79YrStB9A7BAUKydxQF+KzJzkA25kia0kxBbjLZ8vuNUDwVKFus7RZWL5hhqO
 haqwX9BAVSjm2+z+nchu+fBcwQazx7or9McWogL1SjHQTRlHfdjtadligUZ1gQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JdeYT2LH
Subject: Re: [Buildroot] [PATCH v9 12/14] package/qt6/qt6tools: new package
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
Cc: Zoltan Gyarmati <zgyarmati@zgyarmati.de>,
 Jesse Van Gavere <jesseevg@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Roy,

On Tue, 25 Jun 2024 23:18:36 +0200
Roy Kollen Svendsen <roykollensvendsen@gmail.com> wrote:

> The Network module is explicitly required by qt6tools:
> 
>   Failed to find required Qt component "Network".
> 
> We need host-qt6base with Sql support for host-qt6tools to build the
> qhelpgenerator host tool. qt6tools will fail to build if qhelpgenerator
> is not available:
> 
>   Failed to find the host tool "Qt6::qhelpgenerator".  It is part of the
>   Qt6ToolsTools package, but the package did not contain the tool.  Make sure
>   that the host module Tools was built with all features enabled (no
>   explicitly disabled tools).
> 
> Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>

Thanks, I've applied, with a number of changes. See below.


> diff --git a/package/qt6/qt6tools/Config.in b/package/qt6/qt6tools/Config.in
> new file mode 100644
> index 0000000000..2e0484af2e
> --- /dev/null
> +++ b/package/qt6/qt6tools/Config.in
> @@ -0,0 +1,13 @@
> +config BR2_PACKAGE_QT6TOOLS
> +	bool "qt6tools"
> +	select BR2_PACKAGE_QT6BASE_NETWORK
> +	select BR2_PACKAGE_HOST_QT6BASE_NETWORK
> +	select BR2_PACKAGE_HOST_QT6BASE_SQL if BR2_PACKAGE_QT6BASE_SQL

I've added comments above those two selects:

+       # qt6tools needs host-qt6tools, and host-qt6tools needs
+       # network support in qt6base. In addition, we also need
+       # host-qt6base with Sql support to build the qhelpgenerator
+       # tool, if target support for Sql is present

> +	help
> +	  Qt is a cross-platform application and UI framework for
> +	  developers using C++.
> +
> +	  Qt Tools provides tools facilitate the development
> +	  and design of applications.
> +
> +	  https://doc.qt.io/qt-6/qtmodules.html#qt-tools

This link anchor doesn't exist, so I've instead used:

	https://github.com/qt/qttools



> diff --git a/package/qt6/qt6tools/qt6tools.hash b/package/qt6/qt6tools/qt6tools.hash
> new file mode 100644
> index 0000000000..9437e57d25
> --- /dev/null
> +++ b/package/qt6/qt6tools/qt6tools.hash
> @@ -0,0 +1,11 @@
> +# Hash from: https://download.qt.io/official_releases/qt/6.7/6.7.2/submodules/qttools-everywhere-src-6.7.2.tar.xz.sha256
> +sha256  58e855ad1b2533094726c8a425766b63a04a0eede2ed85086860e54593aa4b2a  qttools-everywhere-src-6.7.2.tar.xz
> +
> +# Hashes for license files:
> +sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt

LICENSES/BSL-1.0.txt was missing here.

> +sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  LICENSES/GFDL-1.3-no-invariants-only.txt
> +sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-only.txt
> +sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
> +sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
> +sha256  9b1f50aae6267f9d5e0ceb6775ee86450262c25ec7c0573e151fe5d3f18a4700  LICENSES/LicenseRef-Qt-Commercial.txt
> +sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
> diff --git a/package/qt6/qt6tools/qt6tools.mk b/package/qt6/qt6tools/qt6tools.mk
> new file mode 100644
> index 0000000000..2dd6670dff
> --- /dev/null
> +++ b/package/qt6/qt6tools/qt6tools.mk
> @@ -0,0 +1,40 @@
> +################################################################################
> +#
> +# qt6tools
> +#
> +################################################################################
> +
> +QT6TOOLS_VERSION = $(QT6_VERSION)
> +QT6TOOLS_SITE = $(QT6_SITE)
> +QT6TOOLS_SOURCE = qttools-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6TOOLS_VERSION).tar.xz
> +QT6TOOLS_INSTALL_STAGING = YES
> +QT6TOOLS_SUPPORTS_IN_SOURCE_BUILD = NO
> +
> +QT6TOOLS_CMAKE_BACKEND = ninja
> +
> +QT6TOOLS_LICENSE = \
> +	GPL-2.0+ or LGPL-3.0, \
> +	GPL-3.0, GFDL-1.3 no invariants (docs)
> +
> +QT6TOOLS_LICENSE_FILES = \
> +	LICENSES/GPL-2.0-only.txt \
> +	LICENSES/GPL-3.0-only.txt \
> +	LICENSES/LGPL-3.0-only.txt \
> +	LICENSES/GFDL-1.3-no-invariants-only.txt

Changed to:

QT6TOOLS_LICENSE = \
	BSD-3-Clause (examples), \
	BSD-3-Clause (corecon), \
	BSL-1.0 (catch), \
	LGPL-3.0 or GPL-3.0 or GPL-2.0, \
	GPL-3.0 WITH Qt-GPL-exception-1.0

QT6TOOLS_LICENSE_FILES = \
	LICENSES/BSD-3-Clause.txt \
	LICENSES/BSL-1.0.txt \
	LICENSES/GPL-2.0-only.txt \
	LICENSES/GPL-3.0-only.txt \
	LICENSES/LGPL-3.0-only.txt \
	LICENSES/Qt-GPL-exception-1.0.txt

which I believe is more accurate.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
