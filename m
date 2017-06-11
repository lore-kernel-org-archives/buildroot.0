From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 11 Jun 2017 19:38:09 +0200
Subject: [Buildroot] [PATCH 04/14] package/minetest: new package
References: <20170411222643.9770-1-romain.naour@gmail.com>
 <20170411222643.9770-4-romain.naour@gmail.com>
Message-ID: <1pb01exniq.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Romain,

Am Wed, 12 Apr 2017 00:26:33 +0200 schrieb Romain Naour:

> Signed-off-by: Romain Naour <romain.naour-
Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  DEVELOPERS                   |  1 +
>  package/Config.in            |  1 +
>  package/minetest/Config.in   | 58 +++++++++++++++++++++++++++++++++++++
+++++++
>  package/minetest/minetest.mk | 44 +++++++++++++++++++++++++++++++++

please add a hash file, support for tarballs created by the github helper 
was merged today.

> diff --git a/package/minetest/minetest.mk b/package/minetest/minetest.mk
> new file mode 100644
> index 0000000..f110f7c
> --- /dev/null
> +++ b/package/minetest/minetest.mk
> @@ -0,0 +1,44 @@
> 
+################################################################################
> +#
> +# minetest
> +#
> 
+################################################################################
> +
> +MINETEST_VERSION = 0.4.15

Version 0.4.16 was released meanwhile.

Building with this defconfig worked fine:

BR2_TOOLCHAIN_BUILDROOT_MUSL=y
BR2_BINUTILS_VERSION_2_28_X=y
BR2_GCC_VERSION_7_X=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_MINETEST=y
BR2_PACKAGE_MINETEST_CLIENT_SERVER=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_DRI_DRIVER_I965=y
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_LUAJIT=y

Regards, Bernd
