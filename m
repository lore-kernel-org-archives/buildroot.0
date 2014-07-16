From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Jul 2014 22:50:07 +0200
Subject: [Buildroot] [PATCH v2 06/24] python-numpy: add optional
 blas/lapack support
In-Reply-To: <1398208556-4195-7-git-send-email-s.martin49@gmail.com>
References: <1398208556-4195-1-git-send-email-s.martin49@gmail.com>
 <1398208556-4195-7-git-send-email-s.martin49@gmail.com>
Message-ID: <20140716225007.43763adf@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Wed, 23 Apr 2014 01:15:38 +0200, Samuel Martin wrote:

> +PYTHON_NUMPY_DEPENDENCIES = \
> +	$(if BR2_PACKAGE_CLAPACK,clapack)
> +
> +PYTHON_NUMPY_SITE_CFG_LIBS = \
> +	$(if $(BR2_PACKAGE_CLAPACK),blas lapack)

I've changed this as suggested by Yann E. Morin.

> @@ -19,6 +24,8 @@ define PYTHON_NUMPY_CONFIGURE_CMDS
>  	echo "library_dirs = $(STAGING_DIR)/usr/lib" >> $(@D)/site.cfg
>  	echo "include_dirs = $(STAGING_DIR)/usr/include" >> $(@D)/site.cfg
>  	echo "libraries =" >> $(@D)/site.cfg
> +	$(foreach lib,$(PYTHON_NUMPY_SITE_CFG_LIBS),\
> +		echo "    $(lib)" >> $(@D)/site.cfg ;)

In the example site.cfg file, the syntax is

	libraries = library1,library2

so I've changed this logic to use this syntax, and I've applied your
patch.

Can you check that things are working properly by testing the latest
master? I've checked that things build properly, but I'm not sure how
to test that python-numpy and the blas/lapack support work properly.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
