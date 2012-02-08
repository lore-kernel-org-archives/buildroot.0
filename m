From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Feb 2012 22:26:39 +0100
Subject: [Buildroot] [PATCH] busybox: add watchdog daemon startup script
In-Reply-To: <1328686893-6841-1-git-send-email-fabio.porcedda@telit.com>
References: <1328686893-6841-1-git-send-email-fabio.porcedda@telit.com>
Message-ID: <20120208222639.36359e6a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed,  8 Feb 2012 08:41:33 +0100,
Fabio Porcedda <fabio.porcedda@telit.com> a ?crit :

> +config BR2_PACKAGE_BUSYBOX_WATCHDOG
> +	bool "Install watchdog daemon startup script"
> +	help
> +	  Install the watchdog daemon startup script,
> +	  that just start at the boot the busybox watchdog daemon.
> +

Maybe instead of creating a new configuration option, we can just make
the installation of the S15watchdog script automatic if the Busybox
configuration file has enabled CONFIG_WATCHDOG=y?

The current default Busybox configuration file in Buildroot has
CONFIG_WATCHDOG=y, so we may want to change this default to disable
CONFIG_WATCHDOG.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
