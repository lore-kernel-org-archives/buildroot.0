From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 15 Jan 2011 16:26:21 +0100
Subject: [Buildroot] [PATCH] Add libsigc++ package
In-Reply-To: <201011291822.20672.hartleys@visionengravers.com> (H. Hartley
	Sweeten's message of "Mon, 29 Nov 2010 18:22:20 -0700")
References: <201011291822.20672.hartleys@visionengravers.com>
Message-ID: <8762tq6vdu.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "H" == H Hartley Sweeten <hartleys@visionengravers.com> writes:

 H> Add support for the libsigc++ library.
 H> Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>

Thanks, committed with a few tweaks (see below).

 H> diff --git a/package/Config.in b/package/Config.in
 H> index 03e580a..1f6f7c1 100644
 H> --- a/package/Config.in
 H> +++ b/package/Config.in
 H> @@ -322,6 +322,7 @@ source "package/libevent/Config.in"
 H>  source "package/libfloat/Config.in"
 H>  source "package/libglib2/Config.in"
 H>  source "package/liboil/Config.in"
 H> +source "package/libsigc++/Config.in"
 H>  source "package/startup-notification/Config.in"
 H>  endmenu
 
 H> diff --git a/package/libsigc++/Config.in b/package/libsigc++/Config.in
 H> new file mode 100644
 H> index 0000000..8ec674c
 H> --- /dev/null
 H> +++ b/package/libsigc++/Config.in
 H> @@ -0,0 +1,9 @@
 H> +config BR2_PACKAGE_LIBSIGC
 H> +	bool "libsigc++"

You need to depend on C++ support.

 H> +	help
 H> +	  libsigc++ implements a typesafe callback system for standard C++.
 H> +	  It allows you to define signals and to connect those signals to
 H> +	  any callback function, either global or a member function,
 H> +	  regardless of whether it is static or virtual.
 H> +
 H> +	  http://libsigc.sourceforge.net/

 H> diff --git a/package/libsigc++/libsigc.mk b/package/libsigc++/libsigc.mk
 H> new file mode 100644
 H> index 0000000..640c803
 H> --- /dev/null
 H> +++ b/package/libsigc++/libsigc.mk

AUTOTARGETS expects the package directory to be the same as the package
name, otherwise it won't find patches.

 H> @@ -0,0 +1,12 @@
 H> +#############################################################
 H> +#
 H> +# libsigc++
 H> +#
 H> +#############################################################
 H> +LIBSIGC_VERSION = 2.2.8
 H> +LIBSIGC_SOURCE = libsigc++-$(LIBSIGC_VERSION).tar.bz2
 H> +LIBSIGC_SITE = http://ftp.gnome.org/pub/GNOME/sources/libsigc++/2.2
 H> +LIBSIGC_LIBTOOL_PATCH = NO

We now have libtool v2.2 patch support, so this line can go.

-- 
Bye, Peter Korsgaard
