From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 29 Aug 2020 21:45:41 +0200
Subject: [Buildroot] [PATCH v3 05/13] package/libblockdev: add support
 for fs plugin
In-Reply-To: <20200725230618.3640682-6-aduskett@gmail.com>
References: <20200725230618.3640682-1-aduskett@gmail.com>
 <20200725230618.3640682-6-aduskett@gmail.com>
Message-ID: <20200829214541.10359c93@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 25 Jul 2020 16:06:10 -0700
aduskett at gmail.com wrote:

> +config BR2_PACKAGE_LIBBLOCKDEV_FS
> +	bool "filesystem"
> +	depends on BR2_ENABLE_LOCALE # parted
> +	select BR2_PACKAGE_PARTED

You had forgotten that parted had a dependency on !uclibc. However, we
had a patch sitting in patchwork to remove this dependency, so I
applied it, and then applied this patch to next.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
