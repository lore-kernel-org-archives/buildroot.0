From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Feb 2012 16:47:43 +0100
Subject: [Buildroot] [git commit] boot: only show vendor-specific
 bootloaders for applicable arm variant
In-Reply-To: <20120201224701.C13259097B@busybox.osuosl.org>
References: <20120201224701.C13259097B@busybox.osuosl.org>
Message-ID: <20120202164743.30dfab12@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Wed, 1 Feb 2012 23:46:48 +0100,
Peter Korsgaard <jacmet@sunsite.dk> a ?crit :

> Atmel at91sam9 and NXP lpc32xx are both all arm926t, so only show
> then if that arm variant is selected.

Technically this is correct, but I am pretty sure a lot of people keep
the default "generic_arm" and therefore would not see the availability
of AT91Bootstrap or the LPC bootloaders.

For example, if you use a CodeSourcery external toolchain, there is
basically no difference between generic_arm and arm926t, because the
toolchain already defaults to armv5t.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
