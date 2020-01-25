From: Nathaniel Roach <nroach44@nroach44.id.au>
Date: Sat, 25 Jan 2020 23:35:33 +0800
Subject: [Buildroot] [PATCH 1/2] package/liboping: remove -Werror build
 flag
In-Reply-To: <20200125153233.32426-1-nroach44@nroach44.id.au>
References: <20200125153233.32426-1-nroach44@nroach44.id.au>
Message-ID: <a3148155-4e79-a8e6-7e7c-1f7a09e441c5@nroach44.id.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Patch is standalone, title can be amended if no other changes are needed


On 25/1/20 11:32 pm, Nathaniel Roach wrote:
> Same as https://bugs.gentoo.org/675344 - when building, GCC
> will fail the build due to a truncation warning.
>
> Remove -Wall and -Werror from Makefile.am and run automake
> to apply the change
>
> Signed-off-by: Nathaniel Roach <nroach44@nroach44.id.au>
> ---
>   package/liboping/0002-no-werror.patch | 14 ++++++++++++++
>   package/liboping/liboping.mk          |  1 +
>   2 files changed, 15 insertions(+)
>   create mode 100644 package/liboping/0002-no-werror.patch
>
> diff --git a/package/liboping/0002-no-werror.patch b/package/liboping/0002-no-werror.patch
> new file mode 100644
> index 0000000000..febb2c0335
> --- /dev/null
> +++ b/package/liboping/0002-no-werror.patch
> @@ -0,0 +1,14 @@
> +--- a/src/Makefile.am
> ++++ b/src/Makefile.am
> +@@ -2,10 +2,6 @@ AUTOMAKE_OPTIONS = foreign no-dependencies
> +
> + SUBDIRS = mans
> +
> +-if COMPILER_IS_GCC
> +-AM_CFLAGS = -Wall -Werror
> +-endif
> +-
> + include_HEADERS = oping.h
> + lib_LTLIBRARIES = liboping.la
> +
> +
> diff --git a/package/liboping/liboping.mk b/package/liboping/liboping.mk
> index 4aa3e30ee8..6e3530fdb0 100644
> --- a/package/liboping/liboping.mk
> +++ b/package/liboping/liboping.mk
> @@ -11,6 +11,7 @@ LIBOPING_INSTALL_STAGING = YES
>   LIBOPING_CONF_OPTS = --without-perl-bindings
>   LIBOPING_LICENSE = LGPL-2.1+, GPL-2.0
>   LIBOPING_LICENSE_FILES = COPYING
> +LIBOPING_AUTORECONF = YES
>   
>   ifeq ($(BR2_PACKAGE_NCURSES),y)
>   LIBOPING_DEPENDENCIES += ncurses
