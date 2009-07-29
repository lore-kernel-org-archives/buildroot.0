From: Daniel Mack <daniel@caiaq.de>
Date: Wed, 29 Jul 2009 16:26:10 +0200
Subject: [Buildroot] linux .config : override: reassigning tosymbolAEABI
In-Reply-To: <F81DF98CADE6064F81A746D7C8323593782CB2@fr-ex009.groupinfra.com>
References: <F81DF98CADE6064F81A746D7C8323593782CAA@fr-ex009.groupinfra.com>
	<20090729132515.GM19257@buzzloop.caiaq.de>
	<F81DF98CADE6064F81A746D7C8323593782CAC@fr-ex009.groupinfra.com>
	<20090729134234.GY13236@buzzloop.caiaq.de>
	<F81DF98CADE6064F81A746D7C8323593782CB2@fr-ex009.groupinfra.com>
Message-ID: <20090729142610.GB9464@buzzloop.caiaq.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jul 29, 2009 at 03:59:18PM +0200, Courousse, Damien wrote:
> > Could you check that this condition is met by adding an echo debug in
> > there?
> [Damien Courouss?] 
> Here are the results - EABI is not set: 
> rm -rf /mnt/fractal/buildroot/buildroot-2009.05/project_build_arm/logica_demo/buildroot-config
> mkdir -p /mnt/fractal/buildroot/buildroot-2009.05/project_build_arm/logica_demo
> cp -dpRf package/config/buildroot-config /mnt/fractal/buildroot/buildroot-2009.05/project_build_arm/logica_demo/buildroot-config
> /mnt/fractal/buildroot/buildroot-2009.05/toolchain_build_arm/bin/sed -i -e '/CONFIG_AEABI=y/d' /mnt/fractal/buildroot/buildroot-2009.05/project_build_arm/logica_demo/linux-2.6.28/.config
> echo "-- TEST -- BR2_ARM_EABI is not SET"
> -- TEST -- BR2_ARM_EABI is not SET
> echo "# CONFIG_AEABI is not set" >> /mnt/fractal/buildroot/buildroot-2009.05/project_build_arm/logica_demo/linux-2.6.28/.config
> /mnt/fractal/buildroot/buildroot-2009.05/toolchain_build_arm/bin/sed -i -e '/CONFIG_IPV6=y/d' /mnt/fractal/buildroot/buildroot-2009.05/project_build_arm/logica_demo/linux-2.6.28/.config
> 
> Maybe I was fooled but the message : "override: reassigning to symbol AEABI". I tought it means that the EABI symbol is set to "y", but it might only mean that the symbol was overridden, with no assumption about the final value!
> And actually, in my case, as BR2_ARM_EABI is not set, the kernel config EABI symbol is overridden, but with the same value, i.e. it is not set.
> However it does not explain the kernel panic.

Ok, fine. You're digging at the wrong end then :) Try setting
CONFIG_DEBUG_USER in your kernel config and pass user_debug=255 on
startup. That will output more details when user space binaries crash.

Daniel
