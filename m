From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 6 Sep 2020 16:39:36 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/mrp: new package
In-Reply-To: <20200831182540.2987984-1-horatiu.vultur@microchip.com>
References: <20200831182540.2987984-1-horatiu.vultur@microchip.com>
Message-ID: <20200906163936.4ca1dabd@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Horatiu,

On Mon, 31 Aug 2020 20:25:40 +0200
Horatiu Vultur via buildroot <buildroot@busybox.net> wrote:

> Signed-off-by: Horatiu Vultur <horatiu.vultur@microchip.com>

I've applied to master. See below for a few comments.

> diff --git a/package/mrp/Config.in b/package/mrp/Config.in
> new file mode 100644
> index 0000000000..471f3105ee
> --- /dev/null
> +++ b/package/mrp/Config.in
> @@ -0,0 +1,17 @@
> +config BR2_PACKAGE_MRP
> +	bool "mrp"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0
> +	select BR2_PACKAGE_LIBEV
> +	select BR2_PACKAGE_LIBMNL
> +	select BR2_PACKAGE_LIBNL
> +	help
> +	  This is the userspace application that configures the kernel
> +	  to run MRP protocol. The userspace application is made of 2
> +	  applications, one deamon and a client.

Typo: deamon -> daemon.

Since there is a daemon, perhaps it makes sense to have an init script
and/or systemd unit file for it ?

> +	  https://github.com/microchip-ung/mrp
> +
> +comment "mrp needs a toolchain /w threads, headers >= 5.0"

/w should have been w/


> +MRP_VERSION = 1.1
> +MRP_SITE = $(call github,microchip-ung,mrp,v$(MRP_VERSION))
> +MRP_DEPENDENCIES = libev libmnl libnl
> +MRP_LICENSE = GPL-2.0+

All the SPDX statements in the source code indicate GPL-2.0, except the
bits of kernel headers that are imported, which are GPL-2.0+. So the
overall license really is GPL-2.0. I fixed that when applying.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
