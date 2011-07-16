From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 Jul 2011 09:24:25 +0200
Subject: [Buildroot] [PATCHv3] udev: bump to 172
In-Reply-To: <87y5zz8jm6.fsf@macbook.be.48ers.dk>
References: <4E1D4062.9010909@visionsystems.de>
 <87y5zz8jm6.fsf@macbook.be.48ers.dk>
Message-ID: <20110716092425.02e80735@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 15 Jul 2011 20:49:21 +0200,
Peter Korsgaard <jacmet@uclibc.org> a ?crit :

>  Yegor> +	--disable-udev_acl	\
>  Yegor> +	--disable-gudev
>  Yegor> +else
>  Yegor> +    UDEV_DEPENDENCIES += libusb libusb-compat acl usbutils hwdata libglib2
>  Yegor> +    UDEV_CONF_OPT += 							\
>  Yegor> +    	PKG_CONFIG_PATH=$(STAGING_DIR)/usr/share/pkgconfig 		\
> 
> Why do you need to set this?

I think because usr/share/pkgconfig is not in the default pkg-config
search path, and things like hwdata install their .pc file in
usr/share/pkgconfig. At least, that's what I remember from the time I
did a modern udev package in Buildroot (stuff that I lost when my
laptop got stolen...).

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
