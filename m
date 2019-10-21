From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 21 Oct 2019 10:06:01 +0200
Subject: [Buildroot] [PATCH 1/1] package/libselinux: fix build with
 python 3.8
In-Reply-To: <20191020203119.99538-1-james.hilliard1@gmail.com>
References: <20191020203119.99538-1-james.hilliard1@gmail.com>
Message-ID: <20191021100601.0b88caa0@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 20 Oct 2019 14:31:19 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
> index c707c8a25e..75f01a84b7 100644
> --- a/package/libselinux/libselinux.mk
> +++ b/package/libselinux/libselinux.mk
> @@ -33,7 +33,7 @@ endif
>  ifeq ($(BR2_PACKAGE_PYTHON)$(BR2_PACKAGE_PYTHON3),y)
>  ifeq ($(BR2_PACKAGE_PYTHON3),y)
>  LIBSELINUX_DEPENDENCIES += python3 host-swig
> -LIBSELINUX_PYINC = -I$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)m
> +LIBSELINUX_PYINC = -I$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)

Considering the number of packages that hardcode this path, perhaps we
should have a variable provided by some common code, so that if it
changes again in the future, we don't have to chase down multiple
packages ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
