From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 1 Aug 2018 08:35:41 +0200
Subject: [Buildroot] [PATCH] linux: kconfig needs the toolchain
In-Reply-To: <d703b5fb-a3e9-6398-c5e8-bf63c25ba106@mind.be>
References: <20180731201617.20829-1-yann.morin.1998@free.fr>
 <d703b5fb-a3e9-6398-c5e8-bf63c25ba106@mind.be>
Message-ID: <20180801083541.653e1abc@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 1 Aug 2018 00:21:18 +0200, Arnout Vandecappelle wrote:

> > Like is done in the kconfig-package infra for the dependency on
> > $(1)-patch, we use an order-only prerequisites on the toolchain,
> > to guarantee the compiler is available before we can display the
> > kconfig of the kernel.  
>  You actually want to say here why an order-only dependency and not a normal
> dependency: "Since 'toolchain' is a phony target and therefore always out of
> date, a normal dependency would cause the .config target to be rebuilt on each
> invocation of make."

When looking at the patch, my initial reaction was: why is the
dependency on the .config file, rather than on the
-menuconfig/-xconfig/-nconfig/... targets. Those are phony targets, so
a normal dependency would work.

This could even be pushed one level up to the pkg-kconfig
infrastructure, as we're pretty likely to see other packages go down
this route in the future maybe ? Of course, it should be optional.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
