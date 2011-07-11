From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 11 Jul 2011 15:45:48 +0200
Subject: [Buildroot] CONFIG_FEATURE_MDEV_LOAD_FIRMWARE not enough to get
 firmware loading working
In-Reply-To: <CALB96N=r5bjJKyPq+T3rsr0M5dVZVuAW-fnCG=4FGQGehjxj7Q@mail.gmail.com>
References: <CALB96N=r5bjJKyPq+T3rsr0M5dVZVuAW-fnCG=4FGQGehjxj7Q@mail.gmail.com>
Message-ID: <20110711154548.1e1f6beb@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Nicolas,

Le Mon, 11 Jul 2011 14:59:30 +0200,
"Dechesne, Nicolas" <n-dechesne@ti.com> a ?crit :

> it seems that enabling CONFIG_FEATURE_MDEV_LOAD_FIRMWARE in the
> busybox config is not enough to get mdev firmware loading
> out-of-the-box, and we need to create an init script that ends up
> doing something like this:
> 
> echo /sbin/mdev > /proc/sys/kernel/hotplug
> 
> is that expected or are we missing something?

If you compile your kernel with Buildroot, then Buildroot already takes
care of this, see http://git.buildroot.net/buildroot/tree/linux/linux.mk#n141 :

ifeq ($(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV),y)
	$(call KCONFIG_SET_OPT,CONFIG_UEVENT_HELPER_PATH,\"/sbin/mdev\",$(@D)/.config)
endif

If Buildroot is not responsible of compiling your kernel, then it's up
to you to adjust your kernel configuration similarly.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
