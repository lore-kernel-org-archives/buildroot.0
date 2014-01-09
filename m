From: Jeremy Rosen <jeremy.rosen@openwide.fr>
Date: Thu, 9 Jan 2014 09:03:46 +0100 (CET)
Subject: [Buildroot] [PATCH] force devtmpfs and inotify kernel option
 when udev is used as dev handler
In-Reply-To: <20140108234525.49fae894@skate>
Message-ID: <417664924.1670725.1389254626278.JavaMail.root@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


----- Mail original -----
> Dear J?r?my Rosen,
> 
> On Wed,  8 Jan 2014 14:48:33 +0100, J?r?my Rosen wrote:
> 
> > +	$(if $(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV),
> > +                $(call
> > KCONFIG_ENABLE_OPT,CONFIG_INOTIFY_USER,$(@D)/.config)
> > +		$(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS,$(@D)/.config)
> > +		$(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS_MOUNT,$(@D)/.config))
> 
> These two last lines are not needed, we already have:
> 
>         $(if $(BR2_ROOTFS_DEVICE_CREATION_STATIC),,
>                 $(call
>                 KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS,$(@D)/.config)
>                 $(call
>                 KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS_MOUNT,$(@D)/.config))
> 
> Note the two commas at the end of the first line. It means that when
> BR2_ROOTFS_DEVICE_CREATION_STATIC is *NOT* enabled, then we enabled
> devtmpfs and devtmpfs_mount.
> 

geez, I hate make syntax :(

thx for the catch, someday i'll learn.

> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
> 
