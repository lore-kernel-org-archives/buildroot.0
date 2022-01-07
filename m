Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F3BEC433F5
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 23:12:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C913681433;
	Fri,  7 Jan 2022 23:12:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WRPC8vL1XM_R; Fri,  7 Jan 2022 23:12:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E9D4C8142A;
	Fri,  7 Jan 2022 23:12:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B59B61BF36E
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 23:12:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B16E2405AA
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 23:12:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lOHR3-cNjiMb for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 23:12:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8A9034028E
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 23:12:09 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 x18-20020a7bc212000000b00347cc83ec07so1426281wmi.4
 for <buildroot@buildroot.org>; Fri, 07 Jan 2022 15:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=oz8L5IVsQLBZTH6KwcjHKG0mD2EXlPzjuaLMYlyzwF4=;
 b=S08Dpy9EnTLD62Y03MDcHLSKjoitrHGegqjwaw0DM+B6OZiwuFb0xbqvCmiogx4ILW
 oSqp82YAXJpKtf8uijxzZTRWA5MoJTku8FdFRfgKMvDMthbq+D1tugJszsceCl1jbWck
 BK28iDdxkHMYNH+Px0vBAQDyomc8JUcKT49tEaM0AcEZvBbD/5oVO+Znf6HTerlc2/TE
 e1cZ0dDAeSE/1HUGlMhTSntff+ffF+AdvEvUyqFFQbG8RLe4YAS+Fv1uf0biaGUFoi+N
 IFCoAgRJOCDMgVzSPESM6zkL9g+t5okWdSH5oPmMTMacYW4HHLwyCLIcs5TeMwbGEamj
 rMNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=oz8L5IVsQLBZTH6KwcjHKG0mD2EXlPzjuaLMYlyzwF4=;
 b=0tGCz/G4Dn4wXOELu+SCmYYI/nHug8ikCEA6Egc6PfqgZieONtRnOdmYN2WIM/oZIS
 CVAiwFoxZ4qyeNHML6DFFXZLu5/ib/sCooVP/qhoCvYII0styXDhKPbPjxpE6ij9yHpq
 V2A33MCThUml8MbIYC/K2MW9PxNLCjL6zQh83AJaOX3Vin71KgeACCYScWsMSurlZv6P
 ZgXiOA/RXfdO/UmGTMCl82MVrQNroqjBY0LCWwh4vDAD7xnzv26NVImJXrkThsR0u1e/
 grGppAoMOwkIIU1zqsWmDVDdvD80JFN3wVlEYW9Se3BPWraA0sgw+Scy/TCE3N4BqdOT
 FAfA==
X-Gm-Message-State: AOAM533JBdwqOIS1EG2viByLd8Ku1XB5v0JqQqdayK3o3hafYNpWpcvg
 6YTwoU8EXPYA+zoucbJPSgricw==
X-Google-Smtp-Source: ABdhPJzO2z9DTEdlqxR8XJrIRxY4XCVNW6koAbtkpYFmoaAF3AqXN7/VYxNte6ptPCYZz3iDeCnU7A==
X-Received: by 2002:a05:600c:4ed1:: with SMTP id
 g17mr12709801wmq.112.1641597127831; 
 Fri, 07 Jan 2022 15:12:07 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id o11sm91777wmq.15.2022.01.07.15.12.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jan 2022 15:12:07 -0800 (PST)
Message-ID: <42fd555a-d9bc-c8be-8738-8bbdebf22497@mind.be>
Date: Sat, 8 Jan 2022 00:12:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Jagan Teki <jagan@amarulasolutions.com>, buildroot@buildroot.org
References: <20200407111515.21131-1-jagan@amarulasolutions.com>
 <20200407111515.21131-6-jagan@amarulasolutions.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20200407111515.21131-6-jagan@amarulasolutions.com>
Subject: Re: [Buildroot] [PATCH v8 5/5] package/python-scipy: new package
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
Cc: Esben Haabendal <esben@geanix.com>,
 Angelo Compagnucci <angelo@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Suniel Mahesh <sunil@amarulasolutions.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 07/04/2020 13:15, Jagan Teki wrote:
> Add python-scipy with 1.4.1 release version.
> 
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>

  After merging the python-pybind changes, I tried to merge scipy as well. I 
made a bunch of fixes, updated the version, but unfortunately it still doesn't 
build due to cross-compilation issues. So I've sent a WIP version of the series 
and marked this one as superseded. I'll mark the WIP version as Changes 
Requested as well, since it doesn't work.

  Regards,
  Arnout

> ---
> Changes for v8:
> - none
> Changes for v7:
> - update the commit message
> - fix sha256 value of pybind11 LICENCE
> 
>   DEVELOPERS                             |  1 +
>   package/Config.in                      |  1 +
>   package/python-scipy/Config.in         | 22 ++++++++++++
>   package/python-scipy/python-scipy.hash |  9 +++++
>   package/python-scipy/python-scipy.mk   | 46 ++++++++++++++++++++++++++
>   5 files changed, 79 insertions(+)
>   create mode 100644 package/python-scipy/Config.in
>   create mode 100644 package/python-scipy/python-scipy.hash
>   create mode 100644 package/python-scipy/python-scipy.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index f06d54a662..3203b0bc47 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1154,6 +1154,7 @@ F:	configs/orangepi_zero_plus2_defconfig
>   F:	configs/pine64_defconfig
>   F:	configs/pine64_sopine_defconfig
>   F:	package/python-pybind11
> +F:	package/python-scipy
>   
>   N:	James Hilliard <james.hilliard1@gmail.com>
>   F:	package/gensio/
> diff --git a/package/Config.in b/package/Config.in
> index afe32f52b4..f5af9b07ea 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1120,6 +1120,7 @@ menu "External python modules"
>   	source "package/python-scandir/Config.in"
>   	source "package/python-scapy/Config.in"
>   	source "package/python-schedule/Config.in"
> +	source "package/python-scipy/Config.in"
>   	source "package/python-sdnotify/Config.in"
>   	source "package/python-secretstorage/Config.in"
>   	source "package/python-see/Config.in"
> diff --git a/package/python-scipy/Config.in b/package/python-scipy/Config.in
> new file mode 100644
> index 0000000000..4d8227c31a
> --- /dev/null
> +++ b/package/python-scipy/Config.in
> @@ -0,0 +1,22 @@
> +config BR2_PACKAGE_PYTHON_SCIPY
> +	bool "python-scipy"
> +	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # python-numpy
> +	depends on BR2_TOOLCHAIN_HAS_FORTRAN
> +	depends on BR2_TOOLCHAIN_BUILDROOT_CXX
> +	depends on BR2_PACKAGE_PYTHON3
> +	select BR2_PACKAGE_PYTHON_NUMPY
> +	select BR2_PACKAGE_LAPACK
> +	select BR2_PACKAGE_OPENBLAS
> +	help
> +	  The SciPy library is one of the core packages that make up the SciPy
> +	  stack. It provides many user-friendly and efficient numerical
> +	  routines such as routines for numerical integration, interpolation,
> +	  optimization, linear algebra and statistics.
> +
> +	  https://www.scipy.org/scipylib/
> +
> +comment "python-scipy needs toolchain w/ fortran and c++ and glibc or musl"
> +	depends on BR2_PACKAGE_PYTHON3
> +	depends on !BR2_TOOLCHAIN_HAS_FORTRAN || \
> +		!BR2_TOOLCHAIN_BUILDROOT_CXX || \
> +		(!BR2_TOOLCHAIN_USES_GLIBC && !BR2_TOOLCHAIN_USES_MUSL)
> diff --git a/package/python-scipy/python-scipy.hash b/package/python-scipy/python-scipy.hash
> new file mode 100644
> index 0000000000..c9d295ef6b
> --- /dev/null
> +++ b/package/python-scipy/python-scipy.hash
> @@ -0,0 +1,9 @@
> +# Locally generated
> +sha256 dee1bbf3a6c8f73b6b218cb28eed8dd13347ea2f87d572ce19b289d6fd3fbc59  scipy-1.4.1.tar.gz
> +sha256 5cbdbe33385779958be8b9310497e32d2eec144d82ef425780d3e19f8af6de76  LICENSE.txt
> +sha256 37e64a498894ac7c3b070023e3689e954a8ecf8a23b90968d09a455f1b4f7b35  scipy/linalg/src/lapack_deprecations/LICENSE
> +sha256 606209a000716c5f66e33e180ce08434b96ed17db4975ab9723c6b5fbcc89609  scipy/ndimage/LICENSE.txt
> +sha256 3df9207af2fdb861af0ae3b22026f163b9bcfab4e525dc4943afe2ffa3f77624  scipy/optimize/tnc/LICENSE
> +sha256 f0cedf52503b2d42b83411a0a16e6fefac346dfad8fddc66f50050150123470c  scipy/sparse/linalg/dsolve/SuperLU/License.txt
> +sha256 0926566f9f406178d1214f8cc796e166b1213dd7c05e0c5b461a8b8ac9e50bbe  scipy/sparse/linalg/eigen/arpack/ARPACK/COPYING
> +sha256 34db0c0c4f931861d720555c9cd7a2e228d1290ba29af0f2ee80c41bb2038afb  scipy/spatial/qhull_src/COPYING.txt
> diff --git a/package/python-scipy/python-scipy.mk b/package/python-scipy/python-scipy.mk
> new file mode 100644
> index 0000000000..1d66b146ec
> --- /dev/null
> +++ b/package/python-scipy/python-scipy.mk
> @@ -0,0 +1,46 @@
> +################################################################################
> +#
> +# python-scipy
> +#
> +################################################################################
> +
> +PYTHON_SCIPY_VERSION = 1.4.1
> +PYTHON_SCIPY_SOURCE = scipy-$(PYTHON_SCIPY_VERSION).tar.gz
> +PYTHON_SCIPY_SITE = https://pypi.python.org/packages/04/ab/e2eb3e3f90b9363040a3d885ccc5c79fe20c5b8a3caa8fe3bf47ff653260
> +PYTHON_SCIPY_LICENSE = BSD-3-Clause, BSD-2-Clause, BSD, BSD-Style, \
> +	Apache-2.0, MIT
> +PYTHON_SCIPY_LICENSE_FILES = \
> +	LICENSE.txt \
> +	scipy/linalg/src/lapack_deprecations/LICENSE \
> +	scipy/ndimage/LICENSE.txt \
> +	scipy/optimize/tnc/LICENSE \
> +	scipy/sparse/linalg/dsolve/SuperLU/License.txt \
> +	scipy/sparse/linalg/eigen/arpack/ARPACK/COPYING \
> +	scipy/spatial/qhull_src/COPYING.txt
> +PYTHON_SCIPY_SETUP_TYPE = setuptools
> +PYTHON_SCIPY_DEPENDENCIES += \
> +	host-python-numpy \
> +	host-python-pybind11 \
> +	lapack \
> +	openblas \
> +	python-numpy
> +
> +PYTHON_SCIPY_BUILD_OPTS = config_fc --fcompiler=gnu95
> +PYTHON_SCIPY_ENV += F90=$(TARGET_CROSS)gfortran F77=$(TARGET_CROSS)gfortran
> +
> +# Provide system configuration options to numpy distutils extenions, telling
> +# to find all include files and libraries in staging directory.
> +define PYTHON_SCIPY_CONFIGURE_CMDS
> +	-rm -f $(@D)/site.cfg
> +	echo "[DEFAULT]" >> $(@D)/site.cfg
> +	echo "library_dirs = $(STAGING_DIR)/usr/lib" >> $(@D)/site.cfg
> +	echo "include_dirs = $(STAGING_DIR)/usr/include" >> $(@D)/site.cfg
> +endef
> +
> +# Use the target numpy pkg-config configuration files modified for target
> +# cross-compilation.  Without this, numpy distutils will cause the linker to
> +# link with host libnpymath.a.
> +PYTHON_SCIPY_ENV += NPY_PKG_CONFIG_PATH=$(PYTHON_NUMPY_NPY_PKG_CONFIG_PATH)
> +PYTHON_SCIPY_INSTALL_STAGING = YES
> +
> +$(eval $(python-package))
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
