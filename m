From: Andrea Provasi <pkrcel@gmail.com>
Date: Tue, 4 Dec 2007 09:52:14 +0100
Subject: [Buildroot] Kernel not configuring [PowerPC 603e]
In-Reply-To: <4ac2955e0712040031w3217e3b3s9733b271e246e671@mail.gmail.com>
References: <a2be1d440712040019x45aa8fbfp5079d3077e30abf8@mail.gmail.com>
	<4ac2955e0712040031w3217e3b3s9733b271e246e671@mail.gmail.com>
Message-ID: <a2be1d440712040052q32bd98d2q2570a670cc770b2b@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks,
 one further question while I try that, since the lite5200_defconfig file is
in arch/ppc/config
subfolder of the linux sources, could I directly put that into the buildroot
menuconfig or
do I hae to copy/move it to the buildroot directory?

This si cause I intendo to build several FSs using the same buildroot, as I
have another 2
powerPC board with different specs: an MPC8360 (which is still a 603e) and a
PowerPC405GX.

For all of them I'd like to build a Kernel and root filesystem and I wonder
how to differentiate te
.config for the different kernels.

Cheers
Andy



2007/12/4, mahendra varman <mahendravarman15@gmail.com>:
>
> Hi
>
> Under kernel section of the menuconfig you have to give your board
> specific kernel config file.
> Say for example , you can copy the .config file of ur kernel and name it
> as test.config paste into the
> buildroot folder. Give the name test.config under kernel .config section
> in menuconfig
>
> Good luck
> Mahendravarman
>
>
>
>
> On Dec 4, 2007 1:49 PM, Andrea Provasi <pkrcel@gmail.com > wrote:
>
> > Hi all,
> >    I am trying to build a rootfs and a kernel with buildroot for a
> > Lite5200 evaluation board from Freescale. The board has an MPC5200B powerpc
> > (it's a 603e core)
> >
> > I made buildroot menuconfig changing the config to "Advanced
> > Configuration", vmlinux binary image in uImage, and rootfs type ext2 gzip
> > compressed. All the rest is as per defconfig (I think)
> >
> > All build goes fine through toolchain and uClib.
> >
> >  When it is time to configure the kernel I get the following error:
> >
> > ==========================================================
> > You should create a .config for your kernel
> > and install it as /-linux-2.6.21.config
> >
> > cp -dpf /-linux-2.6.21.config/opt/buildroot/project_build_powerpc/uclibc/linux-
> > 2.6.21/.config
> > cp: impossibile fare stat di `/- linux-2.6.21.config': No such file or
> > directory
> > make: *** [/opt/buildroot/project_build_powerpc/uclibc/linux- 2.6.21/.configured]
> > Error 1
> > ===========================================================
> >
> > this is quite expceted being the .config origin name wrong? (I may ask
> > :-))
> >
> > Looking into
> > the Makefile.in.advanced in the kernel package subtree,
> > /opt/buildroot/target/linux
> > seem that the calling make process is failing to export the variables:
> >
> > BR2_BOARD_PATH and BR2_BOARD_NAME
> >
> > I actuallyam NOT very keen in browsing the makefiles...I can't tell if
> > it's ME that I'm missing something or is anywhere anything I should set in
> > the menuconfig to define the two envvars?
> >
> > Many thanks in advance for any help
> >
> > Regads
> > Andy
> >
> >
> >
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at uclibc.org
> > http://busybox.net/mailman/listinfo/buildroot
> >
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20071204/29a36f47/attachment.htm 
