From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Mar 2014 19:01:26 +0100
Subject: [Buildroot] [PATCH v4 2/2] eigen: add an option to install
 unsupported modules
In-Reply-To: <1395244134-32329-2-git-send-email-d.viti@infosolution.it>
References: <1395244134-32329-1-git-send-email-d.viti@infosolution.it>
 <1395244134-32329-2-git-send-email-d.viti@infosolution.it>
Message-ID: <20140319190126.7d7f6358@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Davide Viti,

On Wed, 19 Mar 2014 16:48:54 +0100, Davide Viti wrote:

> +config BR2_PACKAGE_EIGEN_UNSUPPORTED_MODULES
> +       bool "unsupported modules"
> +       help

Indentation should be done with one tab, not spaces.

> +         Install eigen unsupported modules

Indentation should be one tab + two spaces.



> +endif
> +
>  comment "eigen needs a toolchain w/ C++"
>  	depends on !BR2_INSTALL_LIBSTDCPP
> diff --git a/package/eigen/eigen.mk b/package/eigen/eigen.mk
> index 9a5ce7d..ac030a9 100644
> --- a/package/eigen/eigen.mk
> +++ b/package/eigen/eigen.mk
> @@ -14,12 +14,19 @@ EIGEN_INSTALL_STAGING = YES
>  EIGEN_INSTALL_TARGET = NO
>  EIGEN_DEST_DIR = $(STAGING_DIR)/usr/include/eigen3
>  
> +ifeq ($(BR2_PACKAGE_EIGEN_UNSUPPORTED_MODULES),y)
> +define EIGEN_INSTALL_UNSUPPORTED_MODULES_CMDS
> +	cp -a $(@D)/unsupported $(EIGEN_DEST_DIR)
> +endef
> +endif
> +
>  # This package only consists of headers that need to be
>  # copied over to the sysroot for compile time use
>  define EIGEN_INSTALL_STAGING_CMDS
>  	$(RM) -r $(EIGEN_DEST_DIR)
>  	mkdir -p $(EIGEN_DEST_DIR)
>  	cp -a $(@D)/Eigen $(EIGEN_DEST_DIR)
> +	$(EIGEN_INSTALL_UNSUPPORTED_MODULES_CMDS)

Here the indentation is correct, it's done with one tab.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
