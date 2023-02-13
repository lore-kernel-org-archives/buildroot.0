Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AC29C636D4
	for <buildroot@archiver.kernel.org>; Mon, 13 Feb 2023 22:21:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0731D4031F;
	Mon, 13 Feb 2023 22:21:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0731D4031F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eDIcsSpwzsUb; Mon, 13 Feb 2023 22:20:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD455403A7;
	Mon, 13 Feb 2023 22:20:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD455403A7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7C02A1BF325
 for <buildroot@lists.busybox.net>; Mon, 13 Feb 2023 22:20:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4851681DF5
 for <buildroot@lists.busybox.net>; Mon, 13 Feb 2023 22:20:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4851681DF5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vPverdjFmv5Z for <buildroot@lists.busybox.net>;
 Mon, 13 Feb 2023 22:20:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A97AB81CEF
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A97AB81CEF
 for <buildroot@buildroot.org>; Mon, 13 Feb 2023 22:20:55 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4B879240006;
 Mon, 13 Feb 2023 22:20:52 +0000 (UTC)
Date: Mon, 13 Feb 2023 23:20:50 +0100
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230213232050.5fe67607@windsurf>
In-Reply-To: <20221124220552.2836398-1-ju.o@free.fr>
References: <20221124220552.2836398-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1676326852;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MlLUFKWqMJrY7R5SzSoCEfpMyG07MDt6k0v9/rzQjnA=;
 b=QV2lzbtcd5E9Xh1plCScA4X0ZNLg1KR/GDBLqOx3y/gGSGSndPUTtFQWIzwUE+iXy7w2/5
 yflkE5Ayi14Lb5Beg3g8VObnXEL28WMhnBjMWWqX+TKECkRW7nQJ0UK9zvU0CkY+ypILgI
 Xc73nBMOFpvelgVuoHtoDVhj1KBYgviOObtVWgKkNnYkhQnDRd9BS1ZL9jQqdBksaQlVcC
 lRjEbGrnddFBrPRlN/VDvc3znBJmM6DJHCdgE8BYFFxJ8nPRI4nhtdei1v/AzjdbNfD3lv
 G353bJG6IJz3A+ZY+VWRl2OCGBLzotWrb/V95ZSi6H7eVAWBr9IDKTvoegI1cQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QV2lzbtc
Subject: Re: [Buildroot] [PATCH next v2 1/2] package/highway: new package
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 24 Nov 2022 23:05:51 +0100
Julien Olivain <ju.o@free.fr> wrote:

> Highway is a C++ library that provides portable SIMD/vector intrinsics.
> 
> https://github.com/google/highway
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Thanks! I've applied, with some small changes, see below.

> diff --git a/package/highway/0001-Check-for-the-presence-of-sys-auxv.h.patch b/package/highway/0001-Check-for-the-presence-of-sys-auxv.h.patch
> new file mode 100644
> index 0000000000..df86798613
> --- /dev/null
> +++ b/package/highway/0001-Check-for-the-presence-of-sys-auxv.h.patch
> @@ -0,0 +1,62 @@
> +From 491e3b1c2b8c44a2cfd35db117b02ef0fdf6a8e5 Mon Sep 17 00:00:00 2001
> +From: Julien Olivain <ju.o@free.fr>
> +Date: Wed, 23 Nov 2022 23:27:11 +0100
> +Subject: [PATCH] Check for the presence of <sys/auxv.h>
> +
> +Not all gcc versions are providing <sys/auxv.h>. Checking for
> +HWY_ARCH_ARM && HWY_COMPILER_GCC_ACTUAL && HWY_OS_LINUX is not
> +sufficient and fail to build in some situations (it was observed for
> +some gcc armv7m toolchains).
> +
> +This patch adds a check for <sys/auxv.h> and include it only if present.
> +
> +Signed-off-by: Julien Olivain <ju.o@free.fr>

Has this patch been submitted upstream?


> diff --git a/package/highway/Config.in b/package/highway/Config.in
> new file mode 100644
> index 0000000000..23861f0b94
> --- /dev/null
> +++ b/package/highway/Config.in
> @@ -0,0 +1,30 @@
> +config BR2_PACKAGE_HIGHWAY
> +	bool "highway"
> +	depends on BR2_TOOLCHAIN_HAS_ATOMIC
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	# For gcc bug 58969, see:
> +	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=58969
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++11, GCC_BUG_58969
> +	help
> +	  Highway is a C++ library that provides portable SIMD/vector
> +	  intrinsics.
> +
> +	  https://github.com/google/highway
> +
> +if BR2_PACKAGE_HIGHWAY
> +
> +config BR2_PACKAGE_HIGHWAY_CONTRIB
> +	bool "Enable Contrib"
> +	help
> +	  Build Highway contrib library which contains extra
> +	  SIMD-related utilities: an image class with aligned rows, a
> +	  math library (16 functions already implemented, mostly
> +	  trigonometry), and functions for computing dot products and
> +	  sorting.
> +
> +config BR2_PACKAGE_HIGHWAY_EXAMPLES
> +	bool "Enable Examples"
> +	help
> +	  Build Highway examples
> +
> +endif

You forgot the Config.in comment matching the "depends on" of the main
options:

comment "highway needs a toolchain w/ C++, gcc >= 7"
        depends on BR2_TOOLCHAIN_HAS_ATOMIC
        depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_7

> +HIGHWAY_CXXFLAGS = $(TARGET_CXXFLAGS)
> +
> +ifeq ($(BR2_PACKAGE_HIGHWAY_CONTRIB),y)
> +HIGHWAY_CONF_OPTS += -DHWY_ENABLE_CONTRIB=ON
> +else
> +HIGHWAY_CONF_OPTS += -DHWY_ENABLE_CONTRIB=OFF
> +endif
> +
> +# Examples are not installed by cmake. This binary can be useful for
> +# quick testing and debug.
> +define HIGHWAY_INSTALL_EXAMPLES
> +	$(INSTALL) -m 0755 \
> +		$(@D)/examples/hwy_benchmark \
> +		$(TARGET_DIR)/usr/bin/hwy_benchmark
> +endef

I've moved this...

> +
> +ifeq ($(BR2_PACKAGE_HIGHWAY_EXAMPLES),y)
> +HIGHWAY_CONF_OPTS += -DHWY_ENABLE_EXAMPLES=ON

... here, as it is used only within this condition.

Applied with those changes, thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
