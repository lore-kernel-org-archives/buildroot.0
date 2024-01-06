Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F4D1C46CD2
	for <buildroot@archiver.kernel.org>; Sat,  6 Jan 2024 14:03:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7BE24185D;
	Sat,  6 Jan 2024 14:03:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7BE24185D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TWTF3td6M47z; Sat,  6 Jan 2024 14:03:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D319241917;
	Sat,  6 Jan 2024 14:03:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D319241917
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 535B71BF59A
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 14:03:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2C7CD41917
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 14:03:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C7CD41917
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pRXpOCpAklSS for <buildroot@lists.busybox.net>;
 Sat,  6 Jan 2024 14:03:03 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B0AA14185D
 for <buildroot@buildroot.org>; Sat,  6 Jan 2024 14:03:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0AA14185D
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 8CACAB0055A;
 Sat,  6 Jan 2024 15:02:55 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 06 Jan 2024 15:02:55 +0100
Date: Sat, 6 Jan 2024 15:02:55 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <ZZldj79dwyG7IXtS@landeda>
References: <20231024144256.2708299-1-giulio.benetti@benettiengineering.com>
 <20231024144256.2708299-2-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231024144256.2708299-2-giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1704549781;
 bh=wf7CrsoyFNiBwvRhywS6bRZEJhWBS71khxRL37uAjCw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CvE2ht24VeL87p3XemfYhjDzFUeqoK146LFmfnalkk4T4PsACKiHCXmvF8MDTfYrw
 xNqFFITEBkF88p2JFOxsoVrf7pABUYIAXw9o494gKMSMyBO0aoDOtJarTdZYF3Bmyd
 rFL+0IOBE5lLmi0NCcH2rwkL49G7PZkjlMwjtQDEmBakDvU5aO/SFy/IDC44mCcJtl
 IhxLAeHSKwe/vjqPT+S1oaPHvSGjlMYBU1HE+/Nu8Nutgs+oQaIJPYo+uFjy5iEpPr
 lTesQS/XQdQlL+pnaqCOSMwZp30viNlaVjtHbuYvI/Hbywxup2LsJ3PjZkBgIt15IV
 YbC5GHboZZOtg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=CvE2ht24
Subject: Re: [Buildroot] [PATCH v5 2/4] package/libtracefs: new package
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Pierre Floury <pierre.floury@gmail.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Andreas Ziegler <br015@umbiko.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Giulio, All,

On 2023-10-24 16:42 +0200, Giulio Benetti spake thusly:
> From: Maxime Chevallier <maxime.chevallier@bootlin.com>
> 
> Introduce the libtracefs library, that is used to be bundled with the
> trace-cmd tool. This library is now used by several tools and libraries
> such as trace-cmd and rtla, and is used as an interface to the ftrace
> kernel subsystem through tracefs.
> 
> To build with meson, this package requires to disable documentation
> generation, and since this is not possible add a local patch pending
> upstream that adds -Ddoc=false support to libtracefs.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> [Giulio:
> 	- bump version to 1.7.0 and add hash file
> 	- move to meson build system
> ]
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> V1->V2:
> * bump to version 1.7.0
> * add hash file
> V2->V3:
> * switch to meson build system
> V4->V5:
> * add host-flex/bison dependencies as suggested by Andreas Ziegler
> ---
>  DEVELOPERS                                    |  2 +
>  package/Config.in                             |  1 +
>  ...-add-option-to-disable-documentation.patch | 51 +++++++++++++++++++
>  package/libtracefs/Config.in                  |  6 +++
>  package/libtracefs/libtracefs.hash            |  4 ++
>  package/libtracefs/libtracefs.mk              | 18 +++++++
>  6 files changed, 82 insertions(+)
>  create mode 100644 package/libtracefs/0001-libtracefs-add-option-to-disable-documentation.patch
>  create mode 100644 package/libtracefs/Config.in
>  create mode 100644 package/libtracefs/libtracefs.hash
>  create mode 100644 package/libtracefs/libtracefs.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 47c054bb56..09af18c54c 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1226,6 +1226,7 @@ F:	package/libnspr/
>  F:	package/libnss/
>  F:	package/libnvme/
>  F:	package/libtraceevent/
> +F:	package/libtracefs
>  F:	package/mali-driver/
>  F:	package/minicom/
>  F:	package/mmc-utils/
> @@ -2118,6 +2119,7 @@ F:	package/timescaledb/
>  
>  N:	Maxime Chevallier <maxime.chevallier@bootlin.com>
>  F:	package/libtraceevent/
> +F:	package/libtracefs
>  
>  N:	Michael Durrant <mdurrant@arcturusnetworks.com>
>  F:	board/arcturus/
> diff --git a/package/Config.in b/package/Config.in
> index 15f6bdee16..18cbb745dd 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -118,6 +118,7 @@ menu "Debugging, profiling and benchmark"
>  	source "package/latencytop/Config.in"
>  	source "package/libbpf/Config.in"
>  	source "package/libtraceevent/Config.in"
> +	source "package/libtracefs/Config.in"
>  	source "package/lmbench/Config.in"
>  	source "package/lsof/Config.in"
>  	source "package/ltp-testsuite/Config.in"
> diff --git a/package/libtracefs/0001-libtracefs-add-option-to-disable-documentation.patch b/package/libtracefs/0001-libtracefs-add-option-to-disable-documentation.patch
> new file mode 100644
> index 0000000000..0813451008
> --- /dev/null
> +++ b/package/libtracefs/0001-libtracefs-add-option-to-disable-documentation.patch
> @@ -0,0 +1,51 @@
> +From 881e23ed774360f93ca81f820d7897bd9bbd6d63 Mon Sep 17 00:00:00 2001
> +From: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +Date: Sat, 30 Sep 2023 22:40:08 +0200
> +Subject: [PATCH] libtracefs: add option to disable documentation
> +
> +On some Linux environment builder(i.e. Buildroot) host asciidoc is not
> +provided since by default all man/docs are not installed to target but
> +meson.build at the moment build ascii and html documentation and
> +requires asciidoc making the building to fail. So let's add doc option
> +set to true by default to let the user to override it and not produce
> +the documentation.
> +
> +Upstream: https://patchwork.kernel.org/project/linux-trace-devel/patch/20230930204008.2528607-1-giulio.benetti@benettiengineering.com/
> +
> +Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +---
> + meson.build       | 3 +++
> + meson_options.txt | 2 ++
> + 2 files changed, 5 insertions(+)
> +
> +diff --git a/meson.build b/meson.build
> +index 9d42d78..f1e492e 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -39,6 +39,8 @@ if cunit_dep.found()
> +     subdir('utest')
> + endif
> + subdir('samples')
> ++
> ++if get_option('doc')
> + subdir('Documentation')
> + 
> + custom_target(
> +@@ -46,3 +48,4 @@ custom_target(
> +     output: 'docs',
> +     depends: [html, man],
> +     command: ['echo'])
> ++endif
> +diff --git a/meson_options.txt b/meson_options.txt
> +index 1d92c28..5533a88 100644
> +--- a/meson_options.txt
> ++++ b/meson_options.txt
> +@@ -14,3 +14,5 @@ option('man-bold-literal', type : 'boolean', value : false,
> +        description : 'enable bold literals')
> + option('docbook-suppress-sp', type : 'boolean', value : false,
> +        description : 'docbook suppress sp')
> ++option('doc', type : 'boolean', value: true,
> ++       description : 'produce documentation')
> +-- 
> +2.34.1
> +
> diff --git a/package/libtracefs/Config.in b/package/libtracefs/Config.in
> new file mode 100644
> index 0000000000..92ce0986df
> --- /dev/null
> +++ b/package/libtracefs/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_LIBTRACEFS
> +	bool "libtracefs"
> +	select BR2_PACKAGE_LIBTRACEEVENT
> +	help
> +	  libtracefs is used to easily interface with the ftrace
> +	  interface through the tracefs virtual filesystem.
> diff --git a/package/libtracefs/libtracefs.hash b/package/libtracefs/libtracefs.hash
> new file mode 100644
> index 0000000000..676fcf1111
> --- /dev/null
> +++ b/package/libtracefs/libtracefs.hash
> @@ -0,0 +1,4 @@
> +# Locally computed
> +sha256  411fcbf3434ecbaefa6c2b1bf092266293a672e2d7ee46fdd6b402753cb8bd16  libtracefs-1.7.0.tar.gz
> +sha256  f6b78c087c3ebdf0f3c13415070dd480a3f35d8fc76f3d02180a407c1c812f79  GPL-2.0
> +sha256  0b9a4febcdee6de55872501d5c1a8f5d8b0d1650cd4d5351995ceb22e889f8ca  LGPL-2.1
> diff --git a/package/libtracefs/libtracefs.mk b/package/libtracefs/libtracefs.mk
> new file mode 100644
> index 0000000000..1e6e19a234
> --- /dev/null
> +++ b/package/libtracefs/libtracefs.mk
> @@ -0,0 +1,18 @@
> +################################################################################
> +#
> +# libtracefs
> +#
> +################################################################################
> +
> +LIBTRACEFS_VERSION = 1.7.0
> +LIBTRACEFS_SITE = https://git.kernel.org/pub/scm/libs/libtrace/libtracefs.git/snapshot
> +LIBTRACEFS_INSTALL_STAGING = YES
> +LIBTRACEFS_LICENSE = GPL-2.0, LGPL-2.1
> +LIBTRACEFS_LICENSE_FILES = LICENSES/GPL-2.0 LICENSES/LGPL-2.1
> +
> +LIBTRACEFS_DEPENDENCIES = host-bison host-flex host-pkgconf libtraceevent
> +
> +LIBTRACEFS_CONF_OPTS = \
> +	-Ddoc=false
> +
> +$(eval $(meson-package))
> -- 
> 2.34.1
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
