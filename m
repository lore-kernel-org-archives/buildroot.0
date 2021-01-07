From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 7 Jan 2021 11:13:03 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/casync: new package
In-Reply-To: <-L4OoHbI_s2GypxkG9mFgazGU5zBSrAAbDJZ8-Z4fV4jx0pA4UFDZgnIAi8Jjovzv_ody4LtOlfNmnZ8evA-5BlsbQoa5goxcwgc3zOALIU=@protonmail.com>
References: <-L4OoHbI_s2GypxkG9mFgazGU5zBSrAAbDJZ8-Z4fV4jx0pA4UFDZgnIAi8Jjovzv_ody4LtOlfNmnZ8evA-5BlsbQoa5goxcwgc3zOALIU=@protonmail.com>
Message-ID: <20210107111303.17d64eec@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for the new iteration!

On Thu, 07 Jan 2021 07:12:57 +0000
Yair Ben-Avraham via buildroot <buildroot@busybox.net> wrote:

> +	depends on BR2_PACKAGE_HAS_UDEV

udev is not a mandatory dependency.

> +CASYNC_VERSION = 4ad9bcb94bc83ff36cfc65515107ea06a88c2dfc
> +CASYNC_SITE = $(call github,systemd,casync,$(CASYNC_VERSION))
> +CASYNC_LICENSE = LGPL-2.1+
> +CASYNC_LICENSE_FILES = LICENSE.LGPL2.1
> +# xz is mandatory because of ./src/castore.c:5:10: #include <lzma.h>
> +CASYNC_DEPENDENCIES = acl libcurl openssl xz

This seems odd, I *think* I got it to build without xz. Did you pass
the right -D option ?

Other than those two questions, looks good to me!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
