From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Jul 2015 22:54:47 +0200
Subject: [Buildroot] [PATCH 1/1] bluez5_utils: add ability to build
 sixaxis plugin
In-Reply-To: <1437036374-4179-1-git-send-email-limpens@gmail.com>
References: <1437036374-4179-1-git-send-email-limpens@gmail.com>
Message-ID: <20150718225447.3807a4e0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Eric Limpens,

On Thu, 16 Jul 2015 10:46:14 +0200, Eric Limpens wrote:

> +config BR2_PACKAGE_BLUEZ5_PLUGINS_SIXAXIS
> +	bool "build sixaxis plugin"
> +	help
> +	  Build BlueZ 5.x sixaxis plugin (support Sony Dualshock controller)

In fact, the sixaxis plugin can only be enabled when udev support is
available:

AM_CONDITIONAL(SIXAXIS, test "${enable_sixaxis}" = "yes" &&
                                         test "${enable_udev}" != "no")

So I've adjusted the Config.in description of the option to describe
this udev dependency, and applied your patch.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
