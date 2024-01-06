Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DD6CC46CD2
	for <buildroot@archiver.kernel.org>; Sat,  6 Jan 2024 14:01:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E0F6D42069;
	Sat,  6 Jan 2024 14:01:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E0F6D42069
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rFQdCQITfO5k; Sat,  6 Jan 2024 14:01:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E91B04206C;
	Sat,  6 Jan 2024 14:01:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E91B04206C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0D4AF1BF59A
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 14:01:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E793C83D4B
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 14:01:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E793C83D4B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sGPHQTYii7uv for <buildroot@lists.busybox.net>;
 Sat,  6 Jan 2024 14:01:12 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 55FB583D47
 for <buildroot@buildroot.org>; Sat,  6 Jan 2024 14:01:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 55FB583D47
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id D6DEFB0053D;
 Sat,  6 Jan 2024 15:01:00 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 06 Jan 2024 15:01:00 +0100
Date: Sat, 6 Jan 2024 15:01:00 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <ZZldHKQHyhZEs7PN@landeda>
References: <20231024144256.2708299-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231024144256.2708299-1-giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1704549667;
 bh=tBPmQZ/PVHRE39L0Qyt/SbNscbn0oFkxC9SgJs20WHs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Hxpg8cQxkxa5n5vG9HwMCm5lhX6cdwgEcQHcbfOtpCZUhnFCJ9WPdohGbgJgd6gaF
 xQKIq+sAnhMoNNcMvkcQp/6t+vQ/dz5L6tC8TBbb41ZoLEE0NckbQqiaBFqV1Tjcz0
 9Oj8tiz0b1E/0LitQx26RP6/ZWNJQBpI1vzu3TEkGV+ihALVVYE88d03n1XOtCVXeZ
 DDB8xqC2NxiADzsnKrtZQ2YHRrB57sTZFqI37hRCWH4VRvclW9+XhAnPmu22z42kYN
 VUB4elUkFC68oOxyCiNgFRumaMaFBOYg/Tc5AH6kretNMEoTyacznUKwPYvQg+ayaw
 Hl37QDgWoFnZQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Hxpg8cQx
Subject: Re: [Buildroot] [PATCH v5 1/4] package/libtraceevent: new package
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
> Introduce the libtraceevent library, that is used to be bundled with the
> trace-cmd tool. This library is now used by several tools and libraries
> such as trace-cmd, libtracefs and rtla.
> 
> To build with meson, this package requires to disable documentation
> generation, and since this is not possible add a local patch pending
> upstream that adds -Ddoc=false support to libtraceevent.

That patch was acepted upstream, and then made a new release (well, two
new releases), so I've bumped the version and dropped the patch.

> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> [Giulio:
> 	- bump version to 1.7.3 and add hash file
> 	- move to meson build system
> ]
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master with the version bumped, thanks.

Regards,
Yann E. MORIN.

> ---
> V1->V2:
> * bump to version 1.7.3
> * add hash file
> V3->V4:
> * switch to meson build system
> ---
>  DEVELOPERS                                    |  4 ++
>  package/Config.in                             |  1 +
>  ...-add-option-to-disable-documentation.patch | 51 +++++++++++++++++++
>  package/libtraceevent/Config.in               |  9 ++++
>  package/libtraceevent/libtraceevent.hash      |  4 ++
>  package/libtraceevent/libtraceevent.mk        | 16 ++++++
>  6 files changed, 85 insertions(+)
>  create mode 100644 package/libtraceevent/0001-libtraceevent-add-option-to-disable-documentation.patch
>  create mode 100644 package/libtraceevent/Config.in
>  create mode 100644 package/libtraceevent/libtraceevent.hash
>  create mode 100644 package/libtraceevent/libtraceevent.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 382d28fb79..47c054bb56 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1225,6 +1225,7 @@ F:	package/libfuse3/
>  F:	package/libnspr/
>  F:	package/libnss/
>  F:	package/libnvme/
> +F:	package/libtraceevent/
>  F:	package/mali-driver/
>  F:	package/minicom/
>  F:	package/mmc-utils/
> @@ -2115,6 +2116,9 @@ F:	package/postgresql/
>  F:	package/protozero/
>  F:	package/timescaledb/
>  
> +N:	Maxime Chevallier <maxime.chevallier@bootlin.com>
> +F:	package/libtraceevent/
> +
>  N:	Michael Durrant <mdurrant@arcturusnetworks.com>
>  F:	board/arcturus/
>  F:	configs/arcturus_ucp1020_defconfig
> diff --git a/package/Config.in b/package/Config.in
> index 319a18c770..15f6bdee16 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -117,6 +117,7 @@ menu "Debugging, profiling and benchmark"
>  	source "package/kyua/Config.in"
>  	source "package/latencytop/Config.in"
>  	source "package/libbpf/Config.in"
> +	source "package/libtraceevent/Config.in"
>  	source "package/lmbench/Config.in"
>  	source "package/lsof/Config.in"
>  	source "package/ltp-testsuite/Config.in"
> diff --git a/package/libtraceevent/0001-libtraceevent-add-option-to-disable-documentation.patch b/package/libtraceevent/0001-libtraceevent-add-option-to-disable-documentation.patch
> new file mode 100644
> index 0000000000..ba55315175
> --- /dev/null
> +++ b/package/libtraceevent/0001-libtraceevent-add-option-to-disable-documentation.patch
> @@ -0,0 +1,51 @@
> +From 62740520e25c9afbdfbd8cd8ef2e1c6b02d91915 Mon Sep 17 00:00:00 2001
> +From: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +Date: Sat, 30 Sep 2023 22:40:17 +0200
> +Subject: [PATCH] libtraceevent: add option to disable documentation
> +
> +On some Linux environment builder(i.e. Buildroot) host asciidoc is not
> +provided since by default all man/docs are not installed to target but
> +meson.build at the moment build ascii and html documentation and
> +requires asciidoc making the building to fail. So let's add doc option
> +set to true by default to let the user to override it and not produce
> +the documentation.
> +
> +Upstream: https://patchwork.kernel.org/project/linux-trace-devel/patch/20230930204017.2528627-1-giulio.benetti@benettiengineering.com/
> +
> +Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +---
> + meson.build       | 3 +++
> + meson_options.txt | 2 ++
> + 2 files changed, 5 insertions(+)
> +
> +diff --git a/meson.build b/meson.build
> +index b61c873..9a18e02 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -45,6 +45,8 @@ if cunit_dep.found()
> +     subdir('utest')
> + endif
> + subdir('samples')
> ++
> ++if get_option('doc')
> + subdir('Documentation')
> + 
> + custom_target(
> +@@ -52,3 +54,4 @@ custom_target(
> +     output: 'docs',
> +     depends: [html, man],
> +     command: ['echo'])
> ++endif
> +diff --git a/meson_options.txt b/meson_options.txt
> +index b2294f6..9a40dad 100644
> +--- a/meson_options.txt
> ++++ b/meson_options.txt
> +@@ -16,3 +16,5 @@ option('man-bold-literal', type : 'boolean', value : false,
> +        description : 'enable bold literals')
> + option('docbook-suppress-sp', type : 'boolean', value : false,
> +        description : 'docbook suppress sp')
> ++option('doc', type : 'boolean', value: true,
> ++       description : 'produce documentation')
> +-- 
> +2.34.1
> +
> diff --git a/package/libtraceevent/Config.in b/package/libtraceevent/Config.in
> new file mode 100644
> index 0000000000..d351e3b4de
> --- /dev/null
> +++ b/package/libtraceevent/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_LIBTRACEEVENT
> +	bool "libtraceevent"
> +	help
> +	  libtraceevent is a library that interfaces with the ftrace
> +	  subsystem in the linux kernel.
> +	  It used to be bundled directly in the trace-cmd
> +	  tool, but it was eventually extracted so that it can be used
> +	  by multiple other tools and libraries, such as libtracefs and
> +	  rtla.
> diff --git a/package/libtraceevent/libtraceevent.hash b/package/libtraceevent/libtraceevent.hash
> new file mode 100644
> index 0000000000..15c4883afd
> --- /dev/null
> +++ b/package/libtraceevent/libtraceevent.hash
> @@ -0,0 +1,4 @@
> +# Locally computed
> +sha256  097b72e0d907f3107825fb2edf0188324bf70dc9da360f6efa68dc484ffde541  libtraceevent-1.7.3.tar.gz
> +sha256  f6b78c087c3ebdf0f3c13415070dd480a3f35d8fc76f3d02180a407c1c812f79  GPL-2.0
> +sha256  0b9a4febcdee6de55872501d5c1a8f5d8b0d1650cd4d5351995ceb22e889f8ca  LGPL-2.1
> diff --git a/package/libtraceevent/libtraceevent.mk b/package/libtraceevent/libtraceevent.mk
> new file mode 100644
> index 0000000000..1a3dae463e
> --- /dev/null
> +++ b/package/libtraceevent/libtraceevent.mk
> @@ -0,0 +1,16 @@
> +################################################################################
> +#
> +# libtraceevent
> +#
> +################################################################################
> +
> +LIBTRACEEVENT_VERSION = 1.7.3
> +LIBTRACEEVENT_SITE = https://git.kernel.org/pub/scm/libs/libtrace/libtraceevent.git/snapshot
> +LIBTRACEEVENT_INSTALL_STAGING = YES
> +LIBTRACEEVENT_LICENSE = GPL-2.0, LGPL-2.1
> +LIBTRACEEVENT_LICENSE_FILES = LICENSES/GPL-2.0 LICENSES/LGPL-2.1
> +
> +LIBTRACEEVENT_CONF_OPTS = \
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
