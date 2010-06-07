From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 7 Jun 2010 20:44:13 +0200
Subject: [Buildroot] buildroot for Freescale P2020RDB board
In-Reply-To: <AANLkTilZluCVpvJzNT8FhStCyABMxOtL_Sh_RC9d_Ibh@mail.gmail.com>
References: <AANLkTilZluCVpvJzNT8FhStCyABMxOtL_Sh_RC9d_Ibh@mail.gmail.com>
Message-ID: <20100607204413.540d07fe@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Marcus,

On Mon, 7 Jun 2010 18:41:29 +0200
Marcus Tangermann <marcus.tangermann@gmail.com> wrote:

> I try to get a working kernel and image for a Freescale PowerPC P2
> based board P2020RDB using buildroot 2010.05.
> In menuconfig I've chosen a PowerPC generic architecture with uClibc
> 0.9.30 and gcc 4.4.4.
> The compiled images (kernel and ext2 rootfs) don't work. After
> loading them via tftp and u-boot, the machine simply stops (=crashes).

The kernel is very specific to each board, so if you don't configure
the kernel compilation process in Buildroot, you'll end up having a
kernel that very likely isn't designed to run on your hardware.

It's also very likely that the support for your board isn't available
in the mainline kernel, so you'd probably have to tell Buildroot to
apply a few patches to the kernel.

As no-one has contributed support for your board to Buildroot, you will
definitely not be able to generate a working kernel image ? out of the
box ?. Some work will be needed.

> To test the rootfs I've manually compiled a kernel using the Freescale
> toolchain. The kernel works but the rootfs crashes the machine after
> loading.

? crash ? is unfortunately a relatively poor description of what's
going on. Do you have the boot log ?

> So, I would be glad if someone has some hints regarding my problem:
> 1. Is it possible to generate a working image for an P2020RDB or are
> there problems with the e500v2 core?

I'm not a PowerPC expert, so I can't say.

> 2. Is it possible to integrate the external toolchain from Freescale
> (gcc-4.3.74-eglibc-2.8.74-dp-2) ?

Depends whether their toolchain supports sysroot or not. Is this
toolchain publicly available ?

> The toolchain type seems to fit neither glibc nor eglibc style.

Well, according to the toolchain name you provided, it is very likely
based on eglibc.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
