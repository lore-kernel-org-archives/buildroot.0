From: Romain Naour <romain.naour@smile.fr>
Date: Fri, 15 Dec 2017 15:09:34 +0100
Subject: [Buildroot] [PATCH 1/2] iqvlinux: bump to version 1.2.0.3
In-Reply-To: <20171215134800.29328-1-casantos@datacom.ind.br>
References: <20171215134800.29328-1-casantos@datacom.ind.br>
Message-ID: <ba544a7a-7575-3af6-0955-d126b3c40aca@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Carlos,

Le 15/12/2017 ? 14:47, Carlos Santos a ?crit?:
> Also add hashes for license files.
> 
> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
> ---

[...]

> diff --git a/package/iqvlinux/iqvlinux.hash b/package/iqvlinux/iqvlinux.hash
> index ddf57b712c..11195f1d71 100644
> --- a/package/iqvlinux/iqvlinux.hash
> +++ b/package/iqvlinux/iqvlinux.hash
> @@ -1,5 +1,6 @@
> -# From http://sourceforge.net/projects/e1000/files/iqvlinux/1.1.5.3/
> -sha1	bd94416e4364015dbbd78a22e51080bf7ea81fac	iqvlinux.tar.gz
> -md5	fb6a2a4dc122d39070fcb06985c97a05	iqvlinux.tar.gz
>  # locally computed
> -sha256	8cb19f3bfe040100a13bb2d05cb2b54f2b259e55cef23f8cc5aa6f2f31e98bec	iqvlinux.tar.gz
> +sha256	4020a661940ba6d50f24654b90a41280eb8eccf00061fe6d105c654d3d97d551  iqvlinux.tar.gz

Actually this package is really annoying since the archive name doesn't contain
the version.

Buildroot still use the 1.1.5.3 version in his autobuilders (for stable branch)
and the new archive will replace the old one in the dl directory.

I'm not sure if we can rename the archive after downloading...

Best regards,
Romain

> +sha256	386086e232db4708770f717595d4f83188f776aa6e7313cd12fb039e869f494b  COPYING
> +sha256	beded926a8f18aad5d911daf581759e2b25697588034d2b29033ae1a929506ff  src/linux/driver/files.txt
> +sha256	ecf93b9b739fc82f7b87b34f8c6411dfdd271234af2fe45212293d9df2b654b3  inc/linux/files.txt
> +sha256	0a309350c1b32be72479e8fe08f7f6bbbad2e8c3d9a1cbcad3d482ea48a236ad  inc/files.txt
> diff --git a/package/iqvlinux/iqvlinux.mk b/package/iqvlinux/iqvlinux.mk
> index 165c7c4687..abf061f13d 100644
> --- a/package/iqvlinux/iqvlinux.mk
> +++ b/package/iqvlinux/iqvlinux.mk
> @@ -4,13 +4,14 @@
>  #
>  ################################################################################
>  
> -IQVLINUX_VERSION = 1.1.5.3
> -IQVLINUX_SITE = http://sourceforge.net/projects/e1000/files/iqvlinux/$(IQVLINUX_VERSION)
> +IQVLINUX_VERSION = 1.2.0.3
> +IQVLINUX_SITE = https://downloads.sourceforge.net/project/e1000/iqvlinux/$(IQVLINUX_VERSION)
>  IQVLINUX_SOURCE = iqvlinux.tar.gz
>  
>  IQVLINUX_LICENSE = GPL-2.0, BSD-3-Clause
>  IQVLINUX_LICENSE_FILES = \
> -	COPYING src/linux/driver/files.txt \
> +	COPYING \
> +	src/linux/driver/files.txt \
>  	inc/linux/files.txt inc/files.txt
>  
>  IQVLINUX_MODULE_MAKE_OPTS = NALDIR=$(@D) KSRC=$(LINUX_DIR) CC=$(TARGET_CC)
> 
