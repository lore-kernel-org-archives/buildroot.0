From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Jul 2012 20:07:36 +0200
Subject: [Buildroot] [PATCH] dfu-util: new package
In-Reply-To: <500981F4.7020007@calao-systems.com>
References: <500981F4.7020007@calao-systems.com>
Message-ID: <20120720200736.59009dbd@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 20 Jul 2012 18:06:12 +0200,
gregory hermant <gregory.hermant@calao-systems.com> a ?crit :

> Signed-off-by: Gregory Hermant <gregory.hermant@calao-systems.com>

Applied, thanks, with a few minor fixes (see below)

> +DFU_UTIL_VERSION:=0.6

We prefer '=' instead of ':=' these days.

> +DFU_UTIL_SOURCE = dfu-util-$(DFU_UTIL_VERSION).tar.gz
> +DFU_UTIL_SITE = http://dfu-util.gnumonks.org/releases/
> +
> +HOST_DFU_UTIL_DEPENDENCIES = host-libusb
> +
> +$(eval $(call AUTOTARGETS,host))

Since the beginning of the week, this should now be:

$(eval $(host-autotools-package))

I've made those fixes before committing.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
