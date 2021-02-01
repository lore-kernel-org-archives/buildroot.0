From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 1 Feb 2021 10:55:16 +0100
Subject: [Buildroot] [PATCH] package/libgpiod: bump to version 1.6.2
In-Reply-To: <20210201091228.400386-1-buildroot@heine.tech>
References: <20210201091228.400386-1-buildroot@heine.tech>
Message-ID: <CAMRc=MfcP2OHngNzwM+L3YbmhhcvSGcmuGdau2dH_wG5pgQZqQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Feb 1, 2021 at 10:13 AM Michael Nosthoff <buildroot@heine.tech> wrote:
>
> Version 1.6.2 now builds against headers >= 4.8.x. (Previously 5.5 was
> required). Functionality might still be limited depending on the kernel version.
>
> * altered note on updating
> * disable building of tests
>
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> ---
>  package/libgpiod/libgpiod.hash | 2 +-
>  package/libgpiod/libgpiod.mk   | 7 ++++---
>  2 files changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/package/libgpiod/libgpiod.hash b/package/libgpiod/libgpiod.hash
> index 0ea15869b0..7b691aaf5e 100644
> --- a/package/libgpiod/libgpiod.hash
> +++ b/package/libgpiod/libgpiod.hash
> @@ -1,4 +1,4 @@
>  # From https://www.kernel.org/pub/software/libs/libgpiod/sha256sums.asc
> -sha256  a041b06907c956dd1c77836cccf4d392af29b9fe09c8ad18449a6da707b5ba2d  libgpiod-1.4.5.tar.xz
> +sha256  c601e71846f5ab140c83bc757fdd62a4fda24a9cee39cc5e99c96ec2bf1b06a9  libgpiod-1.6.2.tar.xz
>  # Hash for license file
>  sha256  ce64d5f7b49ea6d80fdb6d4cdee6839d1a94274f7493dc797c3b55b65ec8e9ed  COPYING
> diff --git a/package/libgpiod/libgpiod.mk b/package/libgpiod/libgpiod.mk
> index 83d5abb002..72f8ae772c 100644
> --- a/package/libgpiod/libgpiod.mk
> +++ b/package/libgpiod/libgpiod.mk
> @@ -4,15 +4,16 @@
>  #
>  ################################################################################
>
> -# be careful when bumping versions, newer branches (e.g. >= 1.6)
> -# depend on pretty recent kernel headers
> -LIBGPIOD_VERSION = 1.4.5
> +# Be careful when bumping versions.
> +# Dependency on kernel header versions may change.

You can remove this comment - for v1.6.x I won't change the headers
version requirement anymore and vor v2.x we'll start bundling the
kernel header with the library. I also don't plan on making any new
feature releases for the v1.x series.

> +LIBGPIOD_VERSION = 1.6.2
>  LIBGPIOD_SOURCE = libgpiod-$(LIBGPIOD_VERSION).tar.xz
>  LIBGPIOD_SITE = https://www.kernel.org/pub/software/libs/libgpiod
>  LIBGPIOD_LICENSE = LGPL-2.1+
>  LIBGPIOD_LICENSE_FILES = COPYING
>  LIBGPIOD_INSTALL_STAGING = YES
>  LIBGPIOD_DEPENDENCIES = host-pkgconf
> +LIBGPIOD_CONF_OPTS = --disable-tests
>

Maybe add an option to build them conditionally? Like yocto's ptest
distro feature?

Bart

>  ifeq ($(BR2_PACKAGE_LIBGPIOD_TOOLS),y)
>  LIBGPIOD_CONF_OPTS += --enable-tools
> --
> 2.25.1
>
