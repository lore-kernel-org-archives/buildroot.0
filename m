Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13557ECAAA1
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 15:57:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9FE7441633;
	Sat, 17 Sep 2022 15:57:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9FE7441633
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ocg-tHaKFThp; Sat, 17 Sep 2022 15:57:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C6F2A40420;
	Sat, 17 Sep 2022 15:57:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C6F2A40420
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 79BA11BF388
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 15:57:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5481F813EE
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 15:57:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5481F813EE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gGctZsX_W8Oe for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 15:57:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2EAA9813CF
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2EAA9813CF
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 15:57:09 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CDBD31C0004;
 Sat, 17 Sep 2022 15:57:07 +0000 (UTC)
Date: Sat, 17 Sep 2022 17:57:05 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Message-ID: <20220917175705.325903a1@windsurf>
In-Reply-To: <1663333463-55247-1-git-send-email-gwenj@trabucayre.com>
References: <1663333463-55247-1-git-send-email-gwenj@trabucayre.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663430228;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TCFaeCZm0g/92ImJ/DisS55ybTLQ4ws8fYj7pcm35yk=;
 b=TvahviajiG5AvXl9/335mHuF/cvp6mpFwSlR245Fd44z3YXuklJNqJO4xJNJAlbTjpyFrw
 8Bp4oKmzx3mkzL31aMJQNqdJhB2KsetAKJgEhgseVANbhRZhQ7u3UCH1YbUsdqfQeEOise
 nZiihOq7aE9kTuNTyYmWyn+t/qhO8oO+x/plFkBCEGedHC0qG0ss3alETh/1WzkSpmgP1k
 iDcinjnPgYBxeBmyy5aXDQPmyINBnVV/oVtnATlzzU5p980JK2btidB1lcnG1fYPeC8mqB
 Skgf9HcgyBLWeDMsMFtSAhtvylegdphWzNAeODwogQH8z2q8us5lbKCyS94qng==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Tvahviaj
Subject: Re: [Buildroot] [PATCH v2] package/gnuradio: bump version to
 3.10.3.0
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Fri, 16 Sep 2022 15:04:23 +0200
Gwenhael Goavec-Merou <gwenj@trabucayre.com> wrote:

> diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
> index 103175946c..fd693c1851 100644
> --- a/package/gnuradio/Config.in
> +++ b/package/gnuradio/Config.in
> @@ -15,19 +15,19 @@ config BR2_PACKAGE_GNURADIO
>  	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
>  	depends on BR2_USE_MMU # use fork()
>  	depends on BR2_USE_WCHAR # boost
> -	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-atomic, boost-filesystem
> +	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-atomic, boost-thread
>  	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_43744
>  	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-thread
>  	select BR2_PACKAGE_BOOST
>  	select BR2_PACKAGE_BOOST_ATOMIC
>  	select BR2_PACKAGE_BOOST_DATE_TIME
> -	select BR2_PACKAGE_BOOST_FILESYSTEM
>  	select BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
>  	select BR2_PACKAGE_BOOST_REGEX
>  	select BR2_PACKAGE_BOOST_SYSTEM
>  	select BR2_PACKAGE_BOOST_THREAD
>  	select BR2_PACKAGE_LOG4CPP
>  	select BR2_PACKAGE_GMP
> +	select BR2_PACKAGE_SPDLOG
>  	select BR2_PACKAGE_VOLK
>  	help
>  	  GNU Radio is a free & open-source software development
> @@ -80,7 +80,8 @@ config BR2_PACKAGE_GNURADIO_PYTHON
>  	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
>  	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # python-numpy
>  	select BR2_PACKAGE_BOOST_PYTHON
> -	select BR2_PACKAGE_PYTHON_NUMPY # runtime
> +	select BR2_PACKAGE_PYTHON_NUMPY

Why are you removing the "# runtime" comment here? Your patch doesn't
change numpy to a build time dependency.

> +	select BR2_PACKAGE_PYTHON_PYBIND

The target pybind is a build time dependency?

> -# host-python-mako and host-python-six are needed for volk to compile
>  GNURADIO_DEPENDENCIES = \
>  	host-python3 \
> -	host-python-mako \
> -	host-python-six \
> -	host-swig \
>  	boost \
>  	log4cpp \
>  	gmp \
> +	spdlog \
>  	volk
>  
>  GNURADIO_CONF_OPTS = \
> @@ -115,7 +112,8 @@ GNURADIO_CONF_OPTS += -DENABLE_GR_FILTER=OFF
>  endif
>  
>  ifeq ($(BR2_PACKAGE_GNURADIO_PYTHON),y)
> -GNURADIO_DEPENDENCIES += python3
> +GNURADIO_DEPENDENCIES += python3 python-pybind \
> +	host-python-numpy host-python-packaging

Could you clarify if you need python-pybind on the target or on the
host? And also explain in the commit log why host-python-numpy and
host-python-packaging are now needed?

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
