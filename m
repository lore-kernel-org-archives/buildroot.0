From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Sat, 22 Jun 2013 12:04:49 +0200
Subject: [Buildroot] libunwind: new package
In-Reply-To: <51C57411.40608@wp.pl>
References: <51C57411.40608@wp.pl>
Message-ID: <51C576C1.1030500@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Andy,
> Signed-off-by:  Andy Kennedy <andy.kennedy@adtran.com  <http://lists.busybox.net/mailman/listinfo/buildroot>>
> ---
> diff -Naur a/package/Config.in b/package/Config.in
> --- a/package/Config.in 2013-06-20 10:32:07.000000000 -0500
> +++ b/package/Config.in 2013-06-21 17:00:21.000000000 -0500
> @@ -612,6 +612,7 @@
>   source "package/libtasn1/Config.in"
>   source "package/libtpl/Config.in"
>   source "package/libseccomp/Config.in"
> +source "package/libunwind/Config.in"
>   source "package/liburcu/Config.in"
>   source "package/linux-pam/Config.in"
>   source "package/log4cxx/Config.in"
> diff -Naur a/package/libunwind/Config.in b/package/libunwind/Config.in
> --- a/package/libunwind/Config.in       1969-12-31 18:00:00.000000000 -0600
> +++ b/package/libunwind/Config.in       2013-06-21 17:23:46.000000000 -0500
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_LIBUNWIND
> +	bool "libunwind"
> +	help
> +	  C API to determine the call-chain of a program.
> +
> +	  Project home:  <http://www.nongnu.org/libunwind/index.html>
> diff -Naur a/package/libunwind/libunwind.mk b/package/libunwind/libunwind.mk
> --- a/package/libunwind/libunwind.mk    1969-12-31 18:00:00.000000000 -0600
> +++ b/package/libunwind/libunwind.mk    2013-06-21 17:23:38.000000000 -0500
> @@ -0,0 +1,12 @@
> +################################################################################
> +#
> +# libuwind
Please fix typo - libunwind.

Regards,
Jerzy
> +#
> +################################################################################
> +
> +LIBUNWIND_VERSION = 1.1
> +LIBUNWIND_SITE =http://download.savannah.gnu.org/releases/libunwind
> +LIBUNWIND_INSTALL_STAGING = YES
> +LIBUNWIND_LICENSE_FILES = COPYING
> +
> +$(eval $(autotools-package))
> ------------------------------------------------------------------------

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130622/55cd8718/attachment.html>
