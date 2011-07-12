From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 12 Jul 2011 23:48:34 +0200
Subject: [Buildroot] [PATCHv2] udev: bump to 172
In-Reply-To: <4E1C5DE4.4010208@visionsystems.de>
References: <4E1C5DE4.4010208@visionsystems.de>
Message-ID: <20110712234834.5786dab0@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 12 Jul 2011 16:44:52 +0200,
Yegor Yefremov <yegor_sub1@visionsystems.de> a ?crit :

> +define UDEV_INSTALL_INITSCRIPT
> +    $(INSTALL) -m 0755 package/udev/S10udev $(TARGET_DIR)/etc/init.d/S10udev
>  endef

This isn't used anywhere. It looks like something like:

UDEV_POST_INSTALL_TARGET_HOOKS += UDEV_INSTALL_INITSCRIPT

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
