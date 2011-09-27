From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Sep 2011 22:46:03 +0200
Subject: [Buildroot] [PATCH 1 of 3] linux: add linux-update-config and
 linux-update-defconfig targets
In-Reply-To: <81756817dc47990f5c42.1317151269@localhost6.localdomain6>
References: <patchbomb.1317151268@localhost6.localdomain6>
 <81756817dc47990f5c42.1317151269@localhost6.localdomain6>
Message-ID: <20110927224603.02a7e0b1@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 27 Sep 2011 21:21:09 +0200,
Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :

> In analogy to build targets uclibc-update and busybox-update, add
> extra targets to copy the current configuration to the custom
> configuration file set in buildroot. These targets facilitate the
> work of developers adding support for a specific board.
> 
> linux-update-config copies .config directly.
> linux-update-defconfig first creates a defconfig and copies that.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

As further improvements, I am wondering :

 * Whether linux-update-*config should display a warning/error when
   BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE is not used, instead of being
   silent.

 * Whether this configuration update shouldn't be done automatically
   when one does "make linux-menuconfig" or "make linux-xconfig".
   People have often found strange to loose their configuration changes
   in Linux/Busybox/uClibc when they do a make clean.

But regardless of this discussion, I think your patch should be merged
as is.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
