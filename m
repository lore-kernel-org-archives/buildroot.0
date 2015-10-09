From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 Oct 2015 22:55:34 +0200
Subject: [Buildroot] [PATCH v6 1/3] python-numpy: introduce
 ARCH_SUPPORTS hidden variable
In-Reply-To: <1444203799-16230-1-git-send-email-gwenj@trabucayre.com>
References: <1444203799-16230-1-git-send-email-gwenj@trabucayre.com>
Message-ID: <20151009225534.5a507232@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gwenhael,

On Wed,  7 Oct 2015 09:43:17 +0200, Gwenhael Goavec-Merou wrote:

> diff --git a/package/python-numpy/Config.in b/package/python-numpy/Config.in
> index f8170f8..f25102a 100644
> --- a/package/python-numpy/Config.in
> +++ b/package/python-numpy/Config.in
> @@ -1,9 +1,13 @@
> -config BR2_PACKAGE_PYTHON_NUMPY
> -	bool "python-numpy"
> +config BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
> +	bool
>  	# Numpy has some CPU specific code
>  	depends on BR2_aarch64 || BR2_arm || BR2_armeb || BR2_i386 \
>  		|| BR2_mips || BR2_mipsel || BR2_powerpc || BR2_powerpc64 \
>  		|| BR2_sh || BR2_x86_64

With this code, the BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS option is
always false: there is nothing that makes it equal to 'y', so I don't
see how you could test these patches.

So I've fixed that by replacing:

	depends on BR2_aarch64 ...

by:

	default y if BR2_aarch64 ...

And applied.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
