Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BA18C38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 19:44:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2437A60ADC;
	Sun, 30 Oct 2022 19:44:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2437A60ADC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9hErxRUIn25N; Sun, 30 Oct 2022 19:44:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22AF260AE6;
	Sun, 30 Oct 2022 19:44:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22AF260AE6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 722771BF956
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 19:43:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4A13A8129A
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 19:43:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A13A8129A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xDciNyq6f7CS for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 19:43:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B73088128D
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B73088128D
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 19:43:24 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:afdc:c5f1:f1be:8b47])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id F0CF5B00535;
 Sun, 30 Oct 2022 20:43:19 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 30 Oct 2022 20:43:19 +0100
Date: Sun, 30 Oct 2022 20:43:19 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20221030194319.GF1058960@scaer>
References: <20221030193307.1190297-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221030193307.1190297-1-bernd.kuhls@t-online.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1667159003;
 bh=kbhqvSwmU+Vsylxk8qErIKk89ISVVuzOwItNaHgftQs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=W3uLYUhAIPychAi1ymGyDoK5p/801OMAmmsAOl/aaEavjVVKI3q4Ha8YZPb+0Qhaa
 NsaVRhX6Cdcgr0f+9QzArygJBwZrmlpI36au+445Wl1+i+9EoJDnxtLMsvacZiUU8b
 OpG9L1TPYpHUyWiZWaHFEEqzBvrKvVyLpElfbJ3uXumfNASRU01qF3NtIoYFS7G10l
 9Q4quP5t7qEVFcgaJWUlTXK5LhD+lxDrJzTM76iHE2/RVUVRt5+ADyiVtcZ+OHOGQz
 WHuvMjaIu5/Rvx5ArrCGX7SjNM0JZrTuSn1k0NWStYpobvzAzHukaJIFCZTV9GzX+6
 AaivWgu3367Jw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=W3uLYUhA
Subject: Re: [Buildroot] [PATCH v2 1/4] package/alsa-lib: topology modules
 need dynamic library support
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
Cc: Charles Hardin <ckhardin@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bernd, All,

On 2022-10-30 20:33 +0100, Bernd Kuhls spake thusly:
> With this new option we can remove a patch from alsa-utils which fixed
> its static build. A static build of topology modules is not supported
> by upstream however:
> 
> "Note that it does not make sense to build static topology modules.
>  They are not usable."
> https://github.com/alsa-project/alsa-utils/issues/152#issuecomment-1144485929
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
[--SNIP--]
> diff --git a/package/alsa-lib/Config.in b/package/alsa-lib/Config.in
> index af3de984d9..c6fb501d07 100644
> --- a/package/alsa-lib/Config.in
> +++ b/package/alsa-lib/Config.in
> @@ -80,4 +80,9 @@ config BR2_PACKAGE_ALSA_LIB_OLD_SYMBOLS
>  	bool "old-symbols"
>  	default y
>  
> +config BR2_PACKAGE_ALSA_LIB_TOPOLOGY
> +	bool "topology"
> +	depends on !BR2_STATIC_LIBS
> +	default y

    $ make check-package
    package/alsa-lib/Config.in:86: attributes order: type, default,
    depends on, select, help (http://nightly.buildroot.org/#_config_files)

Applied to master with the above fixed, thanks.

Rest of the series also applied to master, thanks

Regards,
Yann E. MORIN.

>  endif
> diff --git a/package/alsa-lib/alsa-lib.mk b/package/alsa-lib/alsa-lib.mk
> index f3ed195a5c..659ec26ba3 100644
> --- a/package/alsa-lib/alsa-lib.mk
> +++ b/package/alsa-lib/alsa-lib.mk
> @@ -58,6 +58,9 @@ endif
>  ifneq ($(BR2_PACKAGE_ALSA_LIB_OLD_SYMBOLS),y)
>  ALSA_LIB_CONF_OPTS += --disable-old-symbols
>  endif
> +ifneq ($(BR2_PACKAGE_ALSA_LIB_TOPOLOGY),y)
> +ALSA_LIB_CONF_OPTS += --disable-topology
> +endif
>  
>  ifeq ($(BR2_PACKAGE_ALSA_LIB_PYTHON),y)
>  ALSA_LIB_CONF_OPTS += \
> diff --git a/package/alsa-utils/0003-configure.ac-fix-build-without-dlfcn.h.patch b/package/alsa-utils/0003-configure.ac-fix-build-without-dlfcn.h.patch
> deleted file mode 100644
> index 69dae5102c..0000000000
> --- a/package/alsa-utils/0003-configure.ac-fix-build-without-dlfcn.h.patch
> +++ /dev/null
> @@ -1,48 +0,0 @@
> -From 0e74339bf0751932abf6aa49bf07aa1c035f9ec6 Mon Sep 17 00:00:00 2001
> -From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -Date: Sun, 14 Aug 2022 20:31:30 +0200
> -Subject: [PATCH] configure.ac: fix build without dlfcn.h
> -
> -Fix the following static build failure (i.e. without dlfcn.h) raised
> -since version 1.2.7 and
> -https://github.com/alsa-project/alsa-utils/commit/44d3e8aa44fc12f95bfeef0e3a1051e8f77047b5:
> -
> -pre-processor.c:28:10: fatal error: dlfcn.h: No such file or directory
> -   28 | #include <dlfcn.h>
> -      |          ^~~~~~~~~
> -
> -Fixes:
> - - http://autobuild.buildroot.org/results/1173a1ee28a58ce565a3274f35e868c35bb2e04e
> -
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -[Upstream status: https://github.com/alsa-project/alsa-utils/pull/165]
> ----
> - configure.ac | 5 ++++-
> - 1 file changed, 4 insertions(+), 1 deletion(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index 20cbb68..6833800 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -27,6 +27,9 @@ AC_CHECK_FUNC([snd_ctl_elem_add_enumerated],
> - 	      , [AC_ERROR([No user enum control support in alsa-lib])])
> - fi
> - 
> -+
> -+AC_CHECK_HEADERS([dlfcn.h])
> -+
> - dnl Check components
> - AC_CHECK_HEADERS([alsa/pcm.h], [have_pcm="yes"], [have_pcm="no"],
> -   [#include <alsa/asoundlib.h>])
> -@@ -74,7 +77,7 @@ AM_CONDITIONAL(HAVE_MIXER, test "$have_mixer" = "yes")
> - AM_CONDITIONAL(HAVE_RAWMIDI, test "$have_rawmidi" = "yes")
> - AM_CONDITIONAL(HAVE_SEQ, test "$have_seq" = "yes")
> - AM_CONDITIONAL(HAVE_UCM, test "$have_ucm" = "yes")
> --AM_CONDITIONAL(HAVE_TOPOLOGY, test "$have_topology" = "yes")
> -+AM_CONDITIONAL(HAVE_TOPOLOGY, test "$have_topology" = "yes" -a "$ac_cv_header_dlfcn_h" = "yes")
> - AM_CONDITIONAL(HAVE_SAMPLERATE, test "$have_samplerate" = "yes")
> - AM_CONDITIONAL(HAVE_FFADO, test "$have_ffado" = "yes")
> - 
> --- 
> -2.35.1
> -
> diff --git a/package/alsa-utils/alsa-utils.mk b/package/alsa-utils/alsa-utils.mk
> index 1b16a2457a..65a7853c79 100644
> --- a/package/alsa-utils/alsa-utils.mk
> +++ b/package/alsa-utils/alsa-utils.mk
> @@ -15,9 +15,6 @@ ALSA_UTILS_DEPENDENCIES = host-pkgconf alsa-lib \
>  	$(if $(BR2_PACKAGE_LIBSAMPLERATE),libsamplerate) \
>  	$(TARGET_NLS_DEPENDENCIES)
>  
> -# We're patching configure.ac
> -ALSA_UTILS_AUTORECONF = YES
> -
>  ifeq ($(BR2_PACKAGE_ALSA_UTILS_ALSACTL),y)
>  ALSA_UTILS_SELINUX_MODULES += alsa
>  endif
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
