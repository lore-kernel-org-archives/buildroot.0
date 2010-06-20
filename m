From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Jun 2010 15:35:08 +0200
Subject: [Buildroot] [PATCH 01/10] New, simpler,
 infrastructure for building the Linux kernel
In-Reply-To: <87hbkyajnf.fsf@macbook.be.48ers.dk>
References: <cover.1276454802.git.thomas.petazzoni@free-electrons.com>
	<cover.1276454802.git.thomas.petazzoni@free-electrons.com>
	<851a84fbbe113196adb69e1a241e18a958cd77c2.1276454802.git.thomas.petazzoni@free-electrons.com>
	<87bpb8b0ld.fsf@macbook.be.48ers.dk> <20100619161327.3748f49c@surf>
	<87hbkyajnf.fsf@macbook.be.48ers.dk>
Message-ID: <20100620153508.4e7e2a28@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 19 Jun 2010 21:48:20 +0200
Peter Korsgaard <jacmet@uclibc.org> wrote:

> Well, "stable" has different meanings to different people. When I think
> of stable in regard to kernels, I think of the stable at kernel.org
> releases (E.G. 2.6.x.y).

Ah, I see. For me, 2.6.x versions are also stable versions, by
oppposition with -rc versions. But ok, I've changed this.

>  Thomas> I could add another option to say ? same version as kernel headers ?.
>  Thomas> However, I'd prefer to keep the "BR2_LINUX_KERNEL_2_6_34" option as it
>  Thomas> is: remember that in the external toolchain case, ? same version as
>  Thomas> kernel headers ? doesn't make sense.
> 
> Ok. You could hide the option if !internal toolchain.

Sure, done.

> Well, only add it if you need the text string for something (E.G. the
> make target). If you prefer doing it in make, then that's fine as well -
> It's not something that needs to change often.
> 
> In general I think it makes sense to keep these things in Kconfig when
> you need to keep several lines in sync, and otherwise don't need to
> change anything in .mk files (E.G. when adding new kernel headers,
> busybox versions, ..).

Ok. I haven't changed this part for now.

> The point is that it isn't consistent. We don't do this for
> uclibc/busybox, and you don't do it for defconfigs in the kernel tree
> (which often are also slightly outdated).

Ok, I got rid of it.

>  Thomas> make uImage only builds the uImage kernel image. make with no arguments
>  Thomas> builds the default kernel image (zImage in the ARM case) and also
>  Thomas> builds the modules.
> 
> This seems platform/arch specific. On PPC, the default image is
> typically uImage, so make with no arguments builds uImage and modules.
> 
> Does this mean that the existing advanced linux support is broken on
> ARM/uImage when using a modular kernel? - There it looks like it just
> calls 'make uImage'. I always use a nonmodular kernel, so I never
> noticed.

The current advanced thing does "make modules ; make modules_install"
when CONFIG_MODULES is enabled.

>  Thomas>  make uImage
>  Thomas>  make modules
> 
> Probably better to do make; make <format> (where format is uImage/zImage/bzImage/..)

Isn't this what I'm doing already ?

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
