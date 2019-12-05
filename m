From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 5 Dec 2019 22:14:30 +0100
Subject: [Buildroot] [PATCH 1/1] package/systemd: bump to version 244
In-Reply-To: <20191205205321.2489258-1-aduskett@gmail.com>
References: <20191205205321.2489258-1-aduskett@gmail.com>
Message-ID: <20191205221430.603a32bb@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu,  5 Dec 2019 12:53:21 -0800
aduskett at gmail.com wrote:

> -SYSTEMD_VERSION = 243.4
> +SYSTEMD_VERSION = 244
>  SYSTEMD_SITE = $(call github,systemd,systemd-stable,v$(SYSTEMD_VERSION))
> -SYSTEMD_LICENSE = LGPL-2.1+, GPL-2.0+ (udev), Public Domain (few source files, see README)
> -SYSTEMD_LICENSE_FILES = LICENSE.GPL2 LICENSE.LGPL2.1 README
> +SYSTEMD_LICENSE = BSD-Style LGPL-2.1+, GPL-2.0+ (udev), Public Domain (few source files, see README)

Missing comma separator after BSD-Style. Also BSD-Style is not a proper
license in https://spdx.org/licenses/, we need to use the exact
license, which is a BSD-3-Clause in this case.

Also, we want some indication of to what the license applies, between
parenthesis.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
