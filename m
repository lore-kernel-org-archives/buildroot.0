Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 326D6C61D9D
	for <buildroot@archiver.kernel.org>; Sat, 25 Nov 2023 12:20:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C1ED940012;
	Sat, 25 Nov 2023 12:20:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C1ED940012
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o6_MhebnuY3a; Sat, 25 Nov 2023 12:20:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8A1BD400CF;
	Sat, 25 Nov 2023 12:20:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A1BD400CF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2AD291BF487
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 12:20:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0407E82243
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 12:20:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0407E82243
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3NCmy_uHEk3Z for <buildroot@lists.busybox.net>;
 Sat, 25 Nov 2023 12:19:59 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D6C9882230
 for <buildroot@buildroot.org>; Sat, 25 Nov 2023 12:19:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D6C9882230
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:a9ce:514c:eb15:225c])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id ED17C13F8A2;
 Sat, 25 Nov 2023 13:19:53 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 25 Nov 2023 13:19:53 +0100
Date: Sat, 25 Nov 2023 13:19:53 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Michael Nosthoff <buildroot@heine.tech>
Message-ID: <20231125121953.GI3177259@scaer>
References: <20231124090758.3299176-1-buildroot@heine.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231124090758.3299176-1-buildroot@heine.tech>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1700914796;
 bh=ubCdWpWDuffARtyIEeFSan1BXUPtUXIbx5i1iAyLhbE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LJsiJIpyPgK6JxnYMBM9roXKhxPM56xkqk9Gjb/niMKy8gBPYP736Gd2QMp2owvJ4
 Q4HMBf+LUQxFCpqda1it5bunTvoPMXBe1KX4gTJFVspPwKHKQswYwL0oIlSG6yNvqg
 wVu+sGQWpQlVb9pHbKSvnnagV8WYy8n0ayO/+gfYcRbsG8PkTq+BcIkruNQYZmquA9
 O/OSCWnrdrbSjjn8w4xQ3MIq3k97eDnSopGr2WwtjNOYwI5sjDca01cO4qcVnd6SO7
 0aVd5ORjC8vtKgCIuQgqtJvn9EBPDvTE3sEVEGykcl8KdkTU+ZIrP1T9G4iqmdPziZ
 a+ROrx/b3lfyg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=LJsiJIpy
Subject: Re: [Buildroot] [PATCH] package/re2: bump to version 2023.11.01
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 2023-11-24 10:07 +0100, Michael Nosthoff via buildroot spake thusly:
> - libabseil-cpp is now a dependency
> - raise c++ standard to c++14 (due to abseil) --> requires gcc8
> - drop fix for gcc <= 5 introduced in 25fd3b0a523805db14682f7c559cc1c9c366ed55
>   (c++ >= 14 is the default for gcc >= 8)
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> ---
>  package/re2/Config.in |  7 ++++---
>  package/re2/re2.hash  |  2 +-
>  package/re2/re2.mk    | 13 +++++--------
>  3 files changed, 10 insertions(+), 12 deletions(-)
> 
> diff --git a/package/re2/Config.in b/package/re2/Config.in
> index 64217e8aa2..d3bcad8d1a 100644
> --- a/package/re2/Config.in
> +++ b/package/re2/Config.in
> @@ -1,8 +1,9 @@
>  config BR2_PACKAGE_RE2
>  	bool "re2"
>  	depends on BR2_INSTALL_LIBSTDCPP
> -	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # needs C++11
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # needs C++14, libabseil-cpp

You said in the commit log that the C++14 requirement is due to
libaseil-cpp, but the comment you wrote here is ambiguoug, as it seems
to imply that re2 itself needs C++14.

If the C++14 is only due to libaseil-cpp, then the comment should be:

    depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # libabseil-cpp

If however re2 needs C++ for itself, then the comment should be:

    depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # C++14

Can you clarify this?

Also, re2 is selected by two packages:

  - gprc, and it already depends on gcc >= 8 becasue of libabseil-cpp

  - qt5webengne, but that one only depends on gcc >= 4.9, so the new
    dependency mustbe propagated there too.

Can you check and respin, please?

Regards,
Yann E. MORIN.

>  	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	select BR2_PACKAGE_LIBABSEIL_CPP
>  	help
>  	  RE2 is a fast, safe, thread-friendly alternative
>  	  to backtracking regular expression engines like
> @@ -11,7 +12,7 @@ config BR2_PACKAGE_RE2
>  
>  	  https://github.com/google/re2
>  
> -comment "re2 needs a toolchain w/ C++, threads, gcc >= 4.8"
> +comment "re2 needs a toolchain w/ C++, threads, gcc >= 8"
>  	depends on !BR2_INSTALL_LIBSTDCPP || \
>  		!BR2_TOOLCHAIN_HAS_THREADS || \
> -		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_8
> diff --git a/package/re2/re2.hash b/package/re2/re2.hash
> index a39dece7a9..5f590aba6e 100644
> --- a/package/re2/re2.hash
> +++ b/package/re2/re2.hash
> @@ -1,3 +1,3 @@
>  # locally calculated
> -sha256  cbce8b7803e856827201a132862e41af386e7afd9cc6d9a9bc7a4fa4d8ddbdde  re2-2023-02-01.tar.gz
> +sha256  4e6593ac3c71de1c0f322735bc8b0492a72f66ffccfad76e259fa21c41d27d8a  re2-2023-11-01.tar.gz
>  sha256  6040cda75d90b1738292a631d89934c411ef7ffd543c4d6a1b7edfc8edf29449  LICENSE
> diff --git a/package/re2/re2.mk b/package/re2/re2.mk
> index 5587366b1f..b81a64f2e9 100644
> --- a/package/re2/re2.mk
> +++ b/package/re2/re2.mk
> @@ -4,29 +4,26 @@
>  #
>  ################################################################################
>  
> -RE2_VERSION = 2023-02-01
> +RE2_VERSION = 2023-11-01
>  RE2_SITE = $(call github,google,re2,$(RE2_VERSION))
>  RE2_LICENSE = BSD-3-Clause
>  RE2_LICENSE_FILES = LICENSE
>  RE2_INSTALL_STAGING = YES
> -
> -RE2_MAKE_OPTS = \
> -	$(TARGET_CONFIGURE_OPTS) \
> -	CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
> +RE2_DEPENDENCIES = libabseil-cpp
>  
>  define RE2_BUILD_CMDS
> -	$(TARGET_MAKE_ENV) $(MAKE) $(RE2_MAKE_OPTS) \
> +	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
>  		-C $(@D) $(if $(BR2_STATIC_LIBS),static)
>  endef
>  
>  define RE2_INSTALL_STAGING_CMDS
> -	$(TARGET_MAKE_ENV) $(MAKE) $(RE2_MAKE_OPTS) \
> +	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
>  		DESTDIR="$(STAGING_DIR)" prefix=/usr -C $(@D) \
>  		$(if $(BR2_STATIC_LIBS),static-install,install)
>  endef
>  
>  define RE2_INSTALL_TARGET_CMDS
> -	$(TARGET_MAKE_ENV) $(MAKE) $(RE2_MAKE_OPTS) \
> +	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
>  		DESTDIR="$(TARGET_DIR)" prefix=/usr -C $(@D) \
>  		$(if $(BR2_STATIC_LIBS),static-install,install)
>  endef
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
