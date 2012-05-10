From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 10 May 2012 09:16:32 +0200
Subject: [Buildroot] [PATCH] owl-linux: new package
In-Reply-To: <1336580658-4324-1-git-send-email-spdawson@gmail.com>
References: <1336580658-4324-1-git-send-email-spdawson@gmail.com>
Message-ID: <20120510091632.2f277fa8@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed,  9 May 2012 17:24:18 +0100,
spdawson at gmail.com a ?crit :
> diff --git a/package/Config.in b/package/Config.in
> index fb1b08f..971b106 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -208,6 +208,7 @@ source "package/mtd/Config.in"
>  source "package/ntfs-3g/Config.in"
>  source "package/open2300/Config.in"
>  source "package/openocd/Config.in"
> +source "package/owl-linux/Config.in"
>  source "package/parted/Config.in"
>  source "package/pciutils/Config.in"
>  source "package/picocom/Config.in"

At some point maybe it'll make sense to have a section for Device
drivers, but we don't have enough at the moment to justify a separate
section, IMO.

> +config BR2_PACKAGE_OWL_LINUX
> +	bool "H&D Wireless SPB104 SD-card WiFi SIP"

You should add a:

	depends on BR2_LINUX_KERNEL

here.

> +define OWL_LINUX_BUILD_CMDS
> +	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) KERNELDIR=$(LINUX_DIR) CROSS_COMPILE=$(TARGET_CROSS) ARCH=$(KERNEL_ARCH)
> +endef

Any reason not to use $(LINUX_MAKE_FLAGS) here?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
