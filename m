From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 Jul 2012 21:48:23 +0200
Subject: [Buildroot] [PATCH] linux: enable ubi and ubifs if we build a
 ubifs root filesystem
In-Reply-To: <1343721051-8380-1-git-send-email-fabio.porcedda@gmail.com>
References: <1343721051-8380-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <20120731214823.6060b684@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for proposing this patch!

Le Tue, 31 Jul 2012 09:50:51 +0200,
Fabio Porcedda <fabio.porcedda@gmail.com> a ?crit :

> +	$(if $(BR2_TARGET_ROOTFS_UBIFS),
> +		$(call KCONFIG_ENABLE_OPT,CONFIG_MTD_UBI,$(@D)/.config)
> +		$(call KCONFIG_ENABLE_OPT,CONFIG_UBIFS_FS,$(@D)/.config))

As Tzu-Jung said, the topic of automatically adjusting the kernel
configuration depending on other configuration options is a sensitive
topic. For example: should we enable Netfilter in the kernel if
iptables package is enabled? Should we enable the MTD subsystem in the
kernel if the mtd-utils package is enabled? Since we definitely don't
want to fiddle too much with the kernel configuration of the user, we
trying to limit the number of such automatic tweaks.

At the moment, I'm leaning towards not doing automatic modification of
the kernel configuration depending on the root filesystem type selected
in Buildroot. Let's keep this up to the user. But I'll listen to the
comments of the other developers/users.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
