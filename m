From: Michael Nosthoff <buildroot@heine.tech>
Date: Wed, 03 Feb 2021 10:04:47 +0100
Subject: [Buildroot] 
 =?utf-8?q?=5BPATCH_1/1=5D_package/libgpiod=3A__disab?=
 =?utf-8?q?le_examples?=
In-Reply-To: <20210202192703.123317-1-fontaine.fabrice@gmail.com>
Message-ID: <18c0-601a6700-1-43a9f300@79832856>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabrice,

On Tuesday, February 02, 2021 20:27 CET, Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote: 
 
> This will fix a build failure with libgpiod in version 1.6.2

Thanks for taking care of this.

> --- a/package/libgpiod/libgpiod.mk
> +++ b/package/libgpiod/libgpiod.mk
> @@ -12,7 +12,10 @@ LIBGPIOD_SITE = https://www.kernel.org/pub/software/libs/libgpiod
>  LIBGPIOD_LICENSE = LGPL-2.1+
>  LIBGPIOD_LICENSE_FILES = COPYING
>  LIBGPIOD_INSTALL_STAGING = YES
> -LIBGPIOD_DEPENDENCIES = host-pkgconf
> +# We're patching configure.ac
> +LIBGPIOD_AUTORECONF = YES
> +LIBGPIOD_AUTORECONF_OPTS = --include=$(HOST_DIR)/share/autoconf-archive
> +LIBGPIOD_DEPENDENCIES = host-pkgconf host-autoconf-archive
>  LIBGPIOD_CONF_OPTS = --disable-tests

This was the part of magic I didn't know of when I tried to apply this patch myself. Good to know it was a bit more trickery needed.

Regards,
Michael
