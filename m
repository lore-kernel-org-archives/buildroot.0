From: Ulf Samuelsson <ulf@atmel.com>
Date: Tue, 4 Dec 2007 19:35:20 +0100
Subject: [Buildroot] Kernel not configuring [PowerPC 603e]
References: <a2be1d440712040019x45aa8fbfp5079d3077e30abf8@mail.gmail.com>
Message-ID: <7fd901c836a4$7111af60$dcc4af0a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



----- Original Message ----- 
From: "Andrea Provasi" <pkrcel@gmail.com>
To: <buildroot@uclibc.org>
Sent: Tuesday, December 04, 2007 9:19 AM
Subject: [Buildroot] Kernel not configuring [PowerPC 603e]


> Hi all,
>   I am trying to build a rootfs and a kernel with buildroot for a Lite5200
> evaluation board from Freescale. The board has an MPC5200B powerpc (it's a
> 603e core)
> 
> I made buildroot menuconfig changing the config to "Advanced Configuration",
> vmlinux binary image in uImage, and rootfs type ext2 gzip compressed. All
> the rest is as per defconfig (I think)
> 
> All build goes fine through toolchain and uClib.
> 
> When it is time to configure the kernel I get the following error:
> 
> ==========================================================
> You should create a .config for your kernel
> and install it as /-linux-2.6.21.config
> 
> cp -dpf /-linux-2.6.21.config/opt/buildroot/project_build_powerpc/uclibc/linux-
> 2.6.21/.config
> cp: impossibile fare stat di `/-linux-2.6.21.config': No such file or
> directory
> make: *** [/opt/buildroot/project_build_powerpc/uclibc/linux-2.6.21/.configured]
> Error 1
> ===========================================================
> 
> this is quite expceted being the .config origin name wrong? (I may ask :-))
> 
> Looking into
> the Makefile.in.advanced in the kernel package subtree,
> /opt/buildroot/target/linux
> seem that the calling make process is failing to export the variables:
> 
> BR2_BOARD_PATH and BR2_BOARD_NAME
> 
> I actuallyam NOT very keen in browsing the makefiles...I can't tell if it's
> ME that I'm missing something or is anywhere anything I should set in the
> menuconfig to define the two envvars?
> 
> Many thanks in advance for any help
> 
> Regads
> Andy
>

Your board support needs to define these BOARD support variables,
(involves editing makefiles)
or you have to change the default path to the linux config file to something
which exists.



Best Regards
Ulf Samuelsson
