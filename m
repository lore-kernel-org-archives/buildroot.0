From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 25 Nov 2012 00:04:58 +0100
Subject: [Buildroot] [PATCH 24/33] efl packages: add license info
In-Reply-To: <1353543503-8952-25-git-send-email-s.martin49@gmail.com>
References: <1353543503-8952-1-git-send-email-s.martin49@gmail.com>
 <1353543503-8952-25-git-send-email-s.martin49@gmail.com>
Message-ID: <50B1529A.2090704@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22/11/12 01:18, Samuel Martin wrote:
>
> Signed-off-by: Samuel Martin<s.martin49@gmail.com>
[snip]
> diff --git a/package/efl/libedje/libedje.mk b/package/efl/libedje/libedje.mk
> index 8b4814e..f768dba 100644
> --- a/package/efl/libedje/libedje.mk
> +++ b/package/efl/libedje/libedje.mk
> @@ -7,6 +7,9 @@
>   LIBEDJE_VERSION = 1.1.0
>   LIBEDJE_SOURCE = edje-$(LIBEDJE_VERSION).tar.bz2
>   LIBEDJE_SITE =  http://download.enlightenment.org/releases/
> +LIBEDJE_LICENSE = epp binary is licensed under GPLv2, everything else is licensed under BSD-2c

  Although I'm OK with verbose license text, I think this is a bit too much.
How about: "GPLv2+ (epp binary), BSD-2c (everything else)"

  Note that it's GPLv2+

> +LIBEDJE_LICENSE_FILES = COPYING
> +
>   LIBEDJE_INSTALL_STAGING = YES
>
>   LIBEDJE_DEPENDENCIES = host-pkgconf lua libeina libeet libecore libevas \
[snip]
> diff --git a/package/efl/libembryo/libembryo.mk b/package/efl/libembryo/libembryo.mk
> index 5484ccf..6f66b10 100644
> --- a/package/efl/libembryo/libembryo.mk
> +++ b/package/efl/libembryo/libembryo.mk
> @@ -7,6 +7,9 @@
>   LIBEMBRYO_VERSION = 1.1.0
>   LIBEMBRYO_SOURCE = embryo-$(LIBEMBRYO_VERSION).tar.bz2
>   LIBEMBRYO_SITE = http://download.enlightenment.org/releases/
> +LIBEMBRYO_LICENSE = source containing the ITB CompuPhase copyright are released as-is  and the others are licensed under BSD-2c

  Again a bit too verbose.  I think the following should be sufficient:
"BSD-2c, Embryo license"

> +LIBEMBRYO_LICENSE_FILES = COPYING
> +
>   LIBEMBRYO_INSTALL_STAGING = YES
>
>   LIBEMBRYO_DEPENDENCIES = host-pkgconf libeina
> diff --git a/package/efl/libethumb/libethumb.mk b/package/efl/libethumb/libethumb.mk
> index 92e4c83..785fb28 100644
> --- a/package/efl/libethumb/libethumb.mk
> +++ b/package/efl/libethumb/libethumb.mk
> @@ -7,6 +7,9 @@
>   LIBETHUMB_VERSION = 0.1.1.65643
>   LIBETHUMB_SOURCE = ethumb-$(LIBETHUMB_VERSION).tar.bz2
>   LIBETHUMB_SITE = http://download.enlightenment.org/snapshots/2011-11-28
> +LIBETHUMB_LICENSE = LGPLv2.1

  LGPLv2.1+


  Regards,
  Arnout

> +LIBETHUMB_LICENSE_FILES = COPYING
> +
>   LIBETHUMB_INSTALL_STAGING = YES
>
>   LIBETHUMB_DEPENDENCIES = libeina libevas libecore libedje host-libedje
> diff --git a/package/efl/libevas/libevas.mk b/package/efl/libevas/libevas.mk
> index 594db60..402aa48 100644
> --- a/package/efl/libevas/libevas.mk
> +++ b/package/efl/libevas/libevas.mk
> @@ -7,6 +7,9 @@
>   LIBEVAS_VERSION = 1.1.0
>   LIBEVAS_SOURCE = evas-$(LIBEVAS_VERSION).tar.bz2
>   LIBEVAS_SITE = http://download.enlightenment.org/releases/
> +LIBEVAS_LICENSE = BSD-2c
> +LIBEVAS_LICENSE_FILES = COPYING
> +
>   LIBEVAS_INSTALL_STAGING = YES
>
>   LIBEVAS_DEPENDENCIES = host-pkgconf zlib libeina freetype

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
