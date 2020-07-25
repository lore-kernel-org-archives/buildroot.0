From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 25 Jul 2020 23:47:41 +0200
Subject: [Buildroot] [PATCH v2, 1/1] package/zbar: bump to version 0.23.1
In-Reply-To: <20200725210843.865861-1-fontaine.fabrice@gmail.com>
References: <20200725210843.865861-1-fontaine.fabrice@gmail.com>
Message-ID: <20200725234741.208555b8@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 25 Jul 2020 23:08:43 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> -ZBAR_VERSION = 0.23
> +ZBAR_VERSION = 0.23.1
>  ZBAR_SOURCE = zbar-$(ZBAR_VERSION).tar.bz2
>  ZBAR_SITE = https://www.linuxtv.org/downloads/zbar
>  ZBAR_LICENSE = LGPL-2.1+
> @@ -12,9 +12,11 @@ ZBAR_LICENSE_FILES = LICENSE.md
>  ZBAR_INSTALL_STAGING = YES
>  ZBAR_DEPENDENCIES = libv4l jpeg
>  # add host-gettext for AM_ICONV macro
> -ZBAR_DEPENDENCIES += host-gettext
> +ZBAR_DEPENDENCIES += host-gettext $(TARGET_NLS_DEPENDENCIES)

Could you check if this host-gettext dependency for the AM_ICONV macro
is still needed? I think it might not. Indeed, it was needed because we
used to AUTORECONF the package. But we no longer autoreconf it since
8729c4ef881b02ff85b7645b0ad309d6ae44fccf. So perhaps this host-gettext
dependency is no longer needed ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
