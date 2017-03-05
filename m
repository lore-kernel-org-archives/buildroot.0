From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 5 Mar 2017 16:52:48 +0100
Subject: [Buildroot] [PATCH v3 1/2] package/physfs: new package
In-Reply-To: <20170301225611.11494-1-romain.naour@gmail.com>
References: <20170301225611.11494-1-romain.naour@gmail.com>
Message-ID: <4328635a-2687-59f6-a192-4af579aafb58@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 01/03/2017 ? 23:56, Romain Naour a ?crit :
> Backport a patch from SuperTux project:
> https://github.com/SuperTux/physfs/commit/61d3b63abcba8e9615dcb8a3d1fc026bf7f8d5f8
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---

[...]

> @@ -0,0 +1,27 @@
> +################################################################################
> +#
> +# physfs
> +#
> +################################################################################
> +
> +PHYSFS_VERSION = be27dfd07d97336145e7f49d3fd200a6e902f85e
> +PHYSFS_SITE = https://hg.icculus.org/icculus/physfs
> +PHYSFS_SITE_METHOD = hg

I forgot to squash licenses information... sorry.
It should be:

PHYSFS_LICENSE = zlib license (physfs), LGPLv2.1+ (lzma)
PHYSFS_LICENSE_FILES = LICENSE.txt src/lzma/LGPL.txt

Best regards,
Romain

> +
> +PHYSFS_INSTALL_STAGING = YES
> +
> +PHYSFS_CONF_OPTS = -DPHYSFS_BUILD_TEST=OFF
> +
> +ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
> +PHYSFS_CONF_OPTS += -DPHYSFS_BUILD_SHARED=ON
> +else
> +PHYSFS_CONF_OPTS += -DPHYSFS_BUILD_SHARED=OFF
> +endif
> +
> +ifeq ($(BR2_STATIC_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
> +PHYSFS_CONF_OPTS += -DPHYSFS_BUILD_STATIC=ON
> +else
> +PHYSFS_CONF_OPTS += -DPHYSFS_BUILD_STATIC=OFF
> +endif
> +
> +$(eval $(cmake-package))
> 
