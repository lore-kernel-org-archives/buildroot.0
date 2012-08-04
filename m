From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Aug 2012 14:43:16 +0200
Subject: [Buildroot] [PATCH] sudo: fix main executable permissions
In-Reply-To: <1343998111-15331-1-git-send-email-spdawson@gmail.com>
References: <1343998111-15331-1-git-send-email-spdawson@gmail.com>
Message-ID: <20120804144316.469003e8@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri,  3 Aug 2012 13:48:31 +0100,
spdawson at gmail.com a ?crit :

> +define SUDO_FIX_PERMISSIONS
> +  chmod 4755 $(TARGET_DIR)/usr/bin/sudo
> +endef
> +
> +SUDO_POST_INSTALL_TARGET_HOOKS += SUDO_FIX_PERMISSIONS

The principle is good, but not the way it is implemented.  Please use
the <pkg>_PERMISSIONS infrastructure instead. See the documentation, or
package/busybox/busybox.mk for an example.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
