From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Mar 2014 23:30:03 +0100
Subject: [Buildroot] [PATCH v3 1/2] libubox: new package
In-Reply-To: <1395172899-3799-1-git-send-email-yegorslists@googlemail.com>
References: <1395172899-3799-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <20140318233003.779610f2@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yegor Yefremov,

On Tue, 18 Mar 2014 21:01:38 +0100, Yegor Yefremov wrote:

> +LIBUBOX_VERSION = bbd846ec2d72b2629758b69dc122ac0b0f2c3e4b
> +LIBUBOX_SITE = git://nbd.name/luci2/libubox.git
> +LIBUBOX_LICENSE = LGPLv2.1, GPLv2, BSD-3c, MIT
> +LIBUBOX_INSTALL_STAGING = YES
> +
> +ifeq ($(BR2_PACKAGE_LUA),y)
> +	LIBUBOX_DEPENDENCIES = lua
> +	LIBUBOX_MAKE_ENV = \
> +		PKG_CONFIG_SYSROOT_DIR="$(STAGING_DIR)"	\
> +		PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig"

No. These variables should I believe not be necessary. The
cmake-package infrastructure should simply use PATH=$(TARGET_PATH) so
that when a CMake package is built, $(HOST_DIR)/usr/bin/pkg-config is
used, and this pkg-config variant already knows the right path and
sysroot for the .pc files.

I believe Samuel Martin has already sent a patch doing this for the
CMake package infrastructure.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
