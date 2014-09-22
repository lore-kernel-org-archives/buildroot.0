From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 Sep 2014 14:23:39 +0200
Subject: [Buildroot] [PATCH v2] swig: add symlink to /usr/bin/swig2.0
In-Reply-To: <1411385468-24878-2-git-send-email-jeremy.rosen@openwide.fr>
References: <1411385468-24878-1-git-send-email-jeremy.rosen@openwide.fr>
 <1411385468-24878-2-git-send-email-jeremy.rosen@openwide.fr>
Message-ID: <20140922142339.5d50bdfa@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 22 Sep 2014 13:31:08 +0200, J?r?my Rosen wrote:

> diff --git a/package/swig/swig.mk b/package/swig/swig.mk
> index e9ef521..07f0548 100644
> --- a/package/swig/swig.mk
> +++ b/package/swig/swig.mk
> @@ -4,7 +4,8 @@
>  #
>  ################################################################################
>  
> -SWIG_VERSION = 2.0.12
> +SWIG_MAJOR = 2.0
> +SWIG_VERSION = $(SWIG_MAJOR).12
>  SWIG_SITE = http://downloads.sourceforge.net/project/swig/swig/swig-$(SWIG_VERSION)
>  SWIG_DEPENDENCIES = host-bison
>  HOST_SWIG_CONF_OPT = \
> @@ -14,4 +15,10 @@ HOST_SWIG_CONF_OPT = \
>  SWIG_LICENSE = GPLv3+ BSD-2c BSD-3c
>  SWIG_LICENSE_FILES = LICENSE LICENSE-GPL LICENSE-UNIVERSITIES
>  
> +define HOST_SWIG_INSTALL_SYMLINK
> +	ln -fs $(HOST_DIR)/usr/bin/swig $(HOST_DIR)/usr/bin/swig$(SWIG_MAJOR)
> +endef
> +
> +HOST_SWIG_POST_INSTALL_HOOKS += HOST_SWIG_INSTALL_SYMLINK

Samuel, can you tell us if we can explicitly tell to CMake the path to
Swig, knowing that it is detected by CMake using find_program() ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
