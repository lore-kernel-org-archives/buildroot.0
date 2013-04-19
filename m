From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Apr 2013 00:56:05 +0200
Subject: [Buildroot] RFC: "make emu" build and start QEMU target
In-Reply-To: <CAEBucnDgqjO+3RpdXOgqJzkitSG6P-L=cbOEJws09WZXnnD5kQ@mail.gmail.com>
References: <CAEBucnDgqjO+3RpdXOgqJzkitSG6P-L=cbOEJws09WZXnnD5kQ@mail.gmail.com>
Message-ID: <20130420005605.70e482a1@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Spenser Gilliland,

On Wed, 17 Apr 2013 13:32:07 -0500, Spenser Gilliland wrote:

> I'm proposing a project where a "make emu" target would be added to
> Buildroot in order to start a virtualized version of the target.  This
> would provide developers with the ability to quickly test and validate
> their configuration.

Thanks for your proposal!

> To configure the emu target a new top-level menu, "Target Emulation,"
> would be added.  This menu would contain the following options.
> 
> Emulation Method -> QEMU
> QEMU Version -> Custom Git Tree | Custom tarball | Custom Version |
> X.Y.Z ... Source Configuration similar to Kernel ...
> Machine -> list of machines
> Memory -> Memory in Megabytes
> Additional QEMU Options -> (additional options for command line)
> 
> This will start the qemu-system-$(ARCH) version of QEMU with the
> appropriate configuration.

I am not sure to understand the reasoning behind this proposal.
Buildroot is a tool that, given a .config file, generates a
toolchain+root filesystem+kernel+bootloader for a given platform. We
already have defconfigs for various platforms, some of them being real
hardware platforms, some others being emulated platforms in Qemu.

We've worked really hard to get rid of all the board-specific code
that used to be in Buildroot, and what you're proposing seems like
reintroducing this.

I have nothing against adding a host-qemu package, but for the rest, I
don't understand the need. Each Qemu defconfig is associated with a
readme.txt file in board/qemu/<something>/ that explains how to start
the emulation. Just like we have a readme.txt file for some platforms
in board/<foo>/<bar> that explain how to format the SD card or other
platform-specific details.

I don't see why Qemu platforms should be handled differently.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
