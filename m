Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C885C47DB3
	for <buildroot@archiver.kernel.org>; Mon, 29 Jan 2024 18:17:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77C34822F5;
	Mon, 29 Jan 2024 18:17:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77C34822F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5HHRSVSyII3D; Mon, 29 Jan 2024 18:17:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9681B82572;
	Mon, 29 Jan 2024 18:17:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9681B82572
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 03FBB1BF287
 for <buildroot@lists.busybox.net>; Mon, 29 Jan 2024 18:17:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D1459417C6
 for <buildroot@lists.busybox.net>; Mon, 29 Jan 2024 18:16:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D1459417C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0G2U6IQ4rJmz for <buildroot@lists.busybox.net>;
 Mon, 29 Jan 2024 18:16:58 +0000 (UTC)
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 071C4417C3
 for <buildroot@buildroot.org>; Mon, 29 Jan 2024 18:16:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 071C4417C3
Received: from [192.168.178.36] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 88B452C8386B;
 Mon, 29 Jan 2024 19:16:55 +0100 (CET)
Message-ID: <5e8fffaa-6479-42b7-89a5-04199228dd1d@bubu1.eu>
Date: Mon, 29 Jan 2024 19:16:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Boerge Struempfel <boerge.struempfel@gmail.com>
References: <20240123155829.387063-1-bstruempfel@ultratronik.de>
 <20240123155829.387063-2-bstruempfel@ultratronik.de>
In-Reply-To: <20240123155829.387063-2-bstruempfel@ultratronik.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1706552215; bh=hl49LbeCy8oHx1uFvpOGmi9XDLlEm5w64yD+/uxAdn8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=EsQuz112iEMTo3lNF21LAYYaFcLoVl6x3uLPQ5OIoGf1KHgyIYt92+KOuIZkWmHj0
 SBJrsNh4H0Ijc035I2xGC/u5SUlB8fOjytlmM/3KC5CYHxrTZLDKkunS2SOAJzwGOe
 jjS0IqIKwOarTH7uYCGw3oCJOFgT5pabbtvo1aYOHassdpN2kneIFC3MMd/j0lWnXo
 Eiiu1tT3pU9mdAOZqOZg3E3iqxC1KlBA7VAuV+32SvuI4G8B9BDW12CU8xXR/smxwY
 E+kJ7lhmn20dqqjOsl30I2a+3ANZhlYGBGNg/1hNzxTw78c1OEnGUNZM+GLVfkGN4c
 qMpkDvZU8IdgQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=EsQuz112
Subject: Re: [Buildroot] [PATCH v4 1/2] package/libgpiod2: new package
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: buildroot@buildroot.org, vfazio@xes-inc.com, bonet@grenoble.cnrs.fr,
 bstruempfel@ultratronik.de
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Boerge,

I finally got around to testing this. The python bindings don't work for 
me, see below for a possible solution.

On 23.01.24 16:58, Boerge Struempfel wrote:
> From: Boerge Struempfel <boerge.struempfel@gmail.com>
> 
> Due to a significant api change as well as more recent kernel version
> requirements, we introduce a separate package for version 2.0 and higher.
> The newpackage is incompatible to libgpiod 1.x. This allows for iteratively
> updating all dependent packages without breaking anything as a result.
> 
> For now we will have libgpiod2 depend on !libgpiod. However, in the
> future, it might be preferable to have it the other way around,
> such that packages, which select libgpiod2 don't have to also add the
> the !libgpiod dependency.
> 
> Note that this package does not correspond to the debian libgpiod2 package,
> which currently uses only version 1.6.3
> 
> Signed-off-by: Boerge Struempfel <bstruempfel@ultratronik.de>
> ---
>   DEVELOPERS                       |  3 +++
>   package/Config.in                |  1 +
>   package/libgpiod2/Config.in      | 27 +++++++++++++++++++++
>   package/libgpiod2/libgpiod2.hash |  4 ++++
>   package/libgpiod2/libgpiod2.mk   | 41 ++++++++++++++++++++++++++++++++
>   5 files changed, 76 insertions(+)
>   create mode 100644 package/libgpiod2/Config.in
>   create mode 100644 package/libgpiod2/libgpiod2.hash
>   create mode 100644 package/libgpiod2/libgpiod2.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 9528837dd0..7a9d33c911 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -522,6 +522,9 @@ N:	Bilal Wasim <bilalwasim676@gmail.com>
>   F:	board/chromebook/elm/
>   F:	configs/chromebook_elm_defconfig
>   
> +N:	Boerge Struempfel <boerge.struempfel@gmail.com>
> +F:	package/libgpiod2/
> +
>   N:	Bogdan Radulescu <bogdan@nimblex.net>
>   F:	package/iftop/
>   F:	package/ncdu/
> diff --git a/package/Config.in b/package/Config.in
> index 5b8b15fa54..b1adb18877 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1748,6 +1748,7 @@ menu "Hardware handling"
>   	source "package/libftdi1/Config.in"
>   	source "package/libgphoto2/Config.in"
>   	source "package/libgpiod/Config.in"
> +	source "package/libgpiod2/Config.in"
>   	source "package/libgudev/Config.in"
>   	source "package/libhid/Config.in"
>   	source "package/libiio/Config.in"
> diff --git a/package/libgpiod2/Config.in b/package/libgpiod2/Config.in
> new file mode 100644
> index 0000000000..9775ed42f9
> --- /dev/null
> +++ b/package/libgpiod2/Config.in
> @@ -0,0 +1,27 @@
> +config BR2_PACKAGE_LIBGPIOD2
> +	bool "libgpiod2"
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
> +	depends on !BR2_PACKAGE_LIBGPIOD
> +	help
> +	  This is a C library that abstracts the GPIO character
> +	  device operations on linux.
> +
> +	  https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/
> +
> +	  This package is the continuation of the libgpiod package
> +	  for versions 2.0 and above.
> +
> +	  Note that a kernel of 5.10 or above is required for the
> +	  ioctls to work.
> +
> +if BR2_PACKAGE_LIBGPIOD2
> +
> +config BR2_PACKAGE_LIBGPIOD2_TOOLS
> +	bool "install tools"
> +	help
> +	  Include a set of command-line tools for managing GPIOs.
> +
> +endif
> +
> +comment "Consider upgrading to libgpiod2"
> +	depends on BR2_PACKAGE_LIBGPIOD
> diff --git a/package/libgpiod2/libgpiod2.hash b/package/libgpiod2/libgpiod2.hash
> new file mode 100644
> index 0000000000..b5488496b2
> --- /dev/null
> +++ b/package/libgpiod2/libgpiod2.hash
> @@ -0,0 +1,4 @@
> +# From https://www.kernel.org/pub/software/libs/libgpiod/sha256sums.asc
> +sha256  fa4024a080121c958502f9a46a5bda44bea85e7a4dd7fcb3dead463b6fc4261c  libgpiod-2.1.tar.xz
> +# Hash for license file
> +sha256  eb17a56966db5d986bec449ee44ed61f01f9e3fafa952e527db67a8f9594fd11  COPYING
> diff --git a/package/libgpiod2/libgpiod2.mk b/package/libgpiod2/libgpiod2.mk
> new file mode 100644
> index 0000000000..0749ec3cc4
> --- /dev/null
> +++ b/package/libgpiod2/libgpiod2.mk
> @@ -0,0 +1,41 @@
> +################################################################################
> +#
> +# libgpiod2
> +#
> +################################################################################
> +
> +# Be careful when bumping versions.
> +# Dependency on kernel header versions may change.
> +LIBGPIOD2_VERSION = 2.1
> +LIBGPIOD2_SOURCE = libgpiod-$(LIBGPIOD2_VERSION).tar.xz
> +LIBGPIOD2_SITE = https://www.kernel.org/pub/software/libs/libgpiod
> +LIBGPIOD2_LICENSE = LGPL-2.1+
> +LIBGPIOD2_LICENSE_FILES = COPYING
> +LIBGPIOD2_INSTALL_STAGING = YES
> +LIBGPIOD2_DEPENDENCIES = host-pkgconf host-autoconf-archive
> +LIBGPIOD2_CONF_OPTS = --disable-tests --disable-examples
> +
> +ifeq ($(BR2_PACKAGE_LIBGPIOD2_TOOLS),y)
> +LIBGPIOD2_CONF_OPTS += --enable-tools
> +else
> +LIBGPIOD2_CONF_OPTS += --disable-tools
> +endif
> +
> +ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
> +LIBGPIOD2_CONF_OPTS += --enable-bindings-cxx
> +else
> +LIBGPIOD2_CONF_OPTS += --disable-bindings-cxx
> +endif
> +
> +ifeq ($(BR2_PACKAGE_PYTHON3),y)
> +LIBGPIOD2_CONF_OPTS += --enable-bindings-python

The python bindings don't work for me here:

/home/marcus/repos/buildroot_tmp/recovery/per-package/libgpiod2/host/bin/python3 
setup.py build_ext --inplace \
	--include-dirs=../../include/:../../tests/gpiosim/ \
	--library-dirs=../../lib/.libs/:../../tests/gpiosim/.libs/
Traceback (most recent call last):
   File 
"/home/marcus/repos/buildroot_tmp/recovery/build/libgpiod2-2.1/bindings/python/setup.py", 
line 7, in <module>
     from setuptools import Extension, find_packages, setup
ModuleNotFoundError: No module named 'setuptools'

So it needs at least a host-python-setuptools dependency. But then it 
fails with:

creating build/lib.linux-x86_64-cpython-311
creating build/lib.linux-x86_64-cpython-311/gpiod
/home/marcus/repos/buildroot_tmp/recovery/per-package/libgpiod2/host/bin/ccache 
/usr/bin/gcc -shared 
-L/home/marcus/repos/buildroot_tmp/recovery/per-package/libgpiod2/host/lib 
-Wl,-rpath,/home/marcus/repos/buildroot_tmp/recovery/per-package/libgpiod2/host/lib 
-Wl,--enable-new-dtags 
build/temp.linux-x86_64-cpython-311/gpiod/ext/chip.o 
build/temp.linux-x86_64-cpython-311/gpiod/ext/common.o 
build/temp.linux-x86_64-cpython-311/gpiod/ext/line-config.o 
build/temp.linux-x86_64-cpython-311/gpiod/ext/line-settings.o 
build/temp.linux-x86_64-cpython-311/gpiod/ext/module.o 
build/temp.linux-x86_64-cpython-311/gpiod/ext/request.o 
-L../../lib/.libs/ -L../../tests/gpiosim/.libs/ 
-L/home/marcus/repos/buildroot_tmp/recovery/per-package/libgpiod2/host/lib 
-lgpiod -o 
build/lib.linux-x86_64-cpython-311/gpiod/_ext.cpython-311-x86_64-linux-gnu.so
/usr/bin/ld: skipping incompatible ../../lib/.libs//libgpiod.so when 
searching for -lgpiod
/usr/bin/ld: cannot find -lgpiod: No such file or directory
/usr/bin/ld: skipping incompatible ../../lib/.libs//libgpiod.so when 
searching for -lgpiod
collect2: error: ld returned 1 exit status
error: command 
'/home/marcus/repos/buildroot_tmp/recovery/per-package/libgpiod2/host/bin/ccache' 
failed with exit code 1

Openembedded (where the package is maintained by the libgpiod 
maintainer) switched to installing the python bindings as a "normal" 
python package from pypi.org [1][2]

Note that there is https://pypi.org/project/libgpiod/ which was briefly 
used as a package name for one single version but now 
https://pypi.org/project/gpiod/ is used which previously (<2.0) was 
hosting a completely different implementation of interfacing with 
libgpiod from python... yeah, this isn't confusing at all, again :D.

Anyway, I had this:

   PYTHON_LIBGPIOD_VERSION = 2.0.1
   PYTHON_LIBGPIOD_SOURCE = libgpiod-$(PYTHON_LIBGPIOD_VERSION).tar.gz
   PYTHON_LIBGPIOD_SITE = https://files.pythonhosted.org/packages/6d/e3 
/7a3a102b1cc490c4ff19ab63a5d8a228b3b3effa1339cefe1e5bb04f9320
   PYTHON_LIBGPIOD_SETUP_TYPE = setuptools
   PYTHON_LIBGPIOD_DEPENDENCIES = libgpiod

   $(eval $(python-package))

Which worked, but now it obviously should to be called PYTHON_GPIOD and 
point to version 2.1(.3).


[1] 
https://github.com/openembedded/meta-openembedded/commit/941b3bc262dd439eaf4bd6e0f2c7df8ed14c56cf
[2] 
https://github.com/openembedded/meta-openembedded/commit/cd26db61af27a9f822492b1d67b0e39e6828e7cb


Best,
Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
