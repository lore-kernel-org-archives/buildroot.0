From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Jul 2013 17:40:26 +0200
Subject: [Buildroot] [PATCH 2/4] sunxi-mali: new package
In-Reply-To: <1374277074-14455-3-git-send-email-spenser@gillilanding.com>
References: <1374277074-14455-1-git-send-email-spenser@gillilanding.com>
 <1374277074-14455-3-git-send-email-spenser@gillilanding.com>
Message-ID: <20130728174026.38583b1b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Spenser Gilliland,

On Fri, 19 Jul 2013 18:37:52 -0500, Spenser Gilliland wrote:

> +config BR2_PACKAGE_SUNXI_MALI_R2P4
> +	bool "r2p4"

This one is only available on EABI toolchains.

> +
> +config BR2_PACKAGE_SUNXI_MALI_R3P0
> +	bool "r3p0"

and this one on EABIhf toolchains.


> +define SUNXI_MALI_INSTALL_TARGET_CMDS
> +	$(SUNXI_MALI_MAKE_ENV) $(MAKE) -C $(@D)/lib \
> +		$(SUNXI_MALI_MAKE_OPTS) DESTDIR=$(TARGET_DIR) install

I've added here a chmod +x to ensure libraries are installed with
execution permissions, so that they are properly stripped by Buildroot.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
