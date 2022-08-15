Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1801C00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 13:58:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 73DCD60E48;
	Mon, 15 Aug 2022 13:58:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 73DCD60E48
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q9Waq0R5hkup; Mon, 15 Aug 2022 13:58:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 014EB60594;
	Mon, 15 Aug 2022 13:58:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 014EB60594
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B07111BF31B
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 13:58:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8B4B640AF9
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 13:58:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B4B640AF9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tiATiYQjSLZJ for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 13:58:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6286540AE2
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6286540AE2
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 13:58:44 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:c91d:14e3:a117:34c4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 7486C60144;
 Mon, 15 Aug 2022 15:58:39 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 15 Aug 2022 15:58:39 +0200
Date: Mon, 15 Aug 2022 15:58:39 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220815135839.GB2854108@scaer>
References: <20220815100555.458862-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220815100555.458862-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1660571922;
 bh=czOFIa6REoV99AndiCKosD2VevF7UCpsLanZRAEHOtM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=i4WVFXxrFy3H23oJbvuTpCiLH12BaLFNFPKS96EBVWSSb6qqA3lGZubusTdnCwt/c
 LF+sIY/+MUqh82hlcQpsF1E6sul7gIvtzy0sKlKiCCWi4VX7I7r7y36+Nvmnm9fwcm
 l/oCaWOJw3w6EEgkqbWDjwfh9L9HuQQ6kUHMoTOWQQ07jK4FmEx8Y1YAY/UBGociFa
 Gbsjho4qBr575eABN0I1r4H69LUikcg6Uu6Ts9LmpJRovIkKtISL8PuuhcWambmTsE
 P7NbUckd8/GnvnbopjEQTTzSik5e4s2hOxepmG3WVraQfOz6E1x/SWuqOBeF4yswmL
 ToOcr78CwAOqQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=i4WVFXxr
Subject: Re: [Buildroot] [PATCH v2, 1/1] package/alsa-utils: fix static build
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-08-15 12:05 +0200, Fabrice Fontaine spake thusly:
> alsatplg needs dynamic library since bump to version 1.2.7 in commit
> 4dc8563363d639255217ffc59482eaccf93a1b51 and
> https://github.com/alsa-project/alsa-utils/commit/44d3e8aa44fc12f95bfeef0e3a1051e8f77047b5:
> 
> pre-processor.c:28:10: fatal error: dlfcn.h: No such file or directory
>    28 | #include <dlfcn.h>
>       |          ^~~~~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/1173a1ee28a58ce565a3274f35e868c35bb2e04e
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> Changes v1 -> v2 (after review of Thomas Petazzoni):
>  - Only disable alsatplg without dynamic library
> 
>  ...nfigure.ac-fix-build-without-dlfcn.h.patch | 48 +++++++++++++++++++
>  package/alsa-utils/Config.in                  |  4 ++
>  package/alsa-utils/alsa-utils.mk              |  2 +
>  3 files changed, 54 insertions(+)
>  create mode 100644 package/alsa-utils/0003-configure.ac-fix-build-without-dlfcn.h.patch
> 
> diff --git a/package/alsa-utils/0003-configure.ac-fix-build-without-dlfcn.h.patch b/package/alsa-utils/0003-configure.ac-fix-build-without-dlfcn.h.patch
> new file mode 100644
> index 0000000000..69dae5102c
> --- /dev/null
> +++ b/package/alsa-utils/0003-configure.ac-fix-build-without-dlfcn.h.patch
> @@ -0,0 +1,48 @@
> +From 0e74339bf0751932abf6aa49bf07aa1c035f9ec6 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Sun, 14 Aug 2022 20:31:30 +0200
> +Subject: [PATCH] configure.ac: fix build without dlfcn.h
> +
> +Fix the following static build failure (i.e. without dlfcn.h) raised
> +since version 1.2.7 and
> +https://github.com/alsa-project/alsa-utils/commit/44d3e8aa44fc12f95bfeef0e3a1051e8f77047b5:
> +
> +pre-processor.c:28:10: fatal error: dlfcn.h: No such file or directory
> +   28 | #include <dlfcn.h>
> +      |          ^~~~~~~~~
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/1173a1ee28a58ce565a3274f35e868c35bb2e04e
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status: https://github.com/alsa-project/alsa-utils/pull/165]
> +---
> + configure.ac | 5 ++++-
> + 1 file changed, 4 insertions(+), 1 deletion(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 20cbb68..6833800 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -27,6 +27,9 @@ AC_CHECK_FUNC([snd_ctl_elem_add_enumerated],
> + 	      , [AC_ERROR([No user enum control support in alsa-lib])])
> + fi
> + 
> ++
> ++AC_CHECK_HEADERS([dlfcn.h])
> ++
> + dnl Check components
> + AC_CHECK_HEADERS([alsa/pcm.h], [have_pcm="yes"], [have_pcm="no"],
> +   [#include <alsa/asoundlib.h>])
> +@@ -74,7 +77,7 @@ AM_CONDITIONAL(HAVE_MIXER, test "$have_mixer" = "yes")
> + AM_CONDITIONAL(HAVE_RAWMIDI, test "$have_rawmidi" = "yes")
> + AM_CONDITIONAL(HAVE_SEQ, test "$have_seq" = "yes")
> + AM_CONDITIONAL(HAVE_UCM, test "$have_ucm" = "yes")
> +-AM_CONDITIONAL(HAVE_TOPOLOGY, test "$have_topology" = "yes")
> ++AM_CONDITIONAL(HAVE_TOPOLOGY, test "$have_topology" = "yes" -a "$ac_cv_header_dlfcn_h" = "yes")
> + AM_CONDITIONAL(HAVE_SAMPLERATE, test "$have_samplerate" = "yes")
> + AM_CONDITIONAL(HAVE_FFADO, test "$have_ffado" = "yes")
> + 
> +-- 
> +2.35.1
> +
> diff --git a/package/alsa-utils/Config.in b/package/alsa-utils/Config.in
> index 2d7062b0ca..555f06fd21 100644
> --- a/package/alsa-utils/Config.in
> +++ b/package/alsa-utils/Config.in
> @@ -45,6 +45,10 @@ config BR2_PACKAGE_ALSA_UTILS_ALSAUCM
>  
>  config BR2_PACKAGE_ALSA_UTILS_ALSATPLG
>  	bool "alsatplg"
> +	depends on !BR2_STATIC_LIBS # dlfcn.h
> +
> +comment "alsatplg needs a toolchain w/ dynamic library"
> +	depends on BR2_STATIC_LIBS
>  
>  config BR2_PACKAGE_ALSA_UTILS_AMIDI
>  	bool "amidi"
> diff --git a/package/alsa-utils/alsa-utils.mk b/package/alsa-utils/alsa-utils.mk
> index 65a7853c79..c1cfc74774 100644
> --- a/package/alsa-utils/alsa-utils.mk
> +++ b/package/alsa-utils/alsa-utils.mk
> @@ -14,6 +14,8 @@ ALSA_UTILS_DEPENDENCIES = host-pkgconf alsa-lib \
>  	$(if $(BR2_PACKAGE_NCURSES),ncurses) \
>  	$(if $(BR2_PACKAGE_LIBSAMPLERATE),libsamplerate) \
>  	$(TARGET_NLS_DEPENDENCIES)
> +# We're patching configure.ac
> +ALSA_UTILS_AUTORECONF = YES
>  
>  ifeq ($(BR2_PACKAGE_ALSA_UTILS_ALSACTL),y)
>  ALSA_UTILS_SELINUX_MODULES += alsa
> -- 
> 2.35.1
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
