From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Sun, 25 Jan 2009 08:32:37 +0100
Subject: [Buildroot] 2009.02-rc2 released
In-Reply-To: <3B941116898CDA489B91563DEF88F4B607F8DB@iwt-server.iwt.local>
References: <3B941116898CDA489B91563DEF88F4B607F8DB@iwt-server.iwt.local>
Message-ID: <1232868757.5311.170.camel@elrond.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

s?n 2009-01-25 klockan 11:28 +1100 skrev Paul Jones:
> I had a go at compiling this for an ARM and I get this error:
> 
> 
> 
Noone has put a lot of effort into supporting the
"generic" ARM so there is no linux configuration file available.

You have obviously selected Advanced Kernel configuration, and for
that you need Qt installed, or you have to select
to use "menuconfig" in the setup instead of "xconfig"

Try doing 

make at91sam9260dfc_defconfig
make

THis will have a linux config file which you can modify later.

- or select the "normal" kernel configuration.
That means you first have to extract the kernel outside
Buildroot and generate a .config file
which you supply as a configuration item to Buildroot.

BR
Ulf Samuelsson


> # Try to get a config for this linux version in the board directory
> echo "LINUX26_VERSION = 2.6.28.1"
> LINUX26_VERSION = 2.6.28.1
> if [ ! -f
> "/home/paul.jones/dev/buildroot-2009.02-rc2/project_build_arm/uclibc/lin
> ux-2.6.28.1/.config" ] ; then \
>             if [ -f "/arm-linux-2.6.28.1.config" ] ; then \
>                 cp -dpf /arm-linux-2.6.28.1.config
> /home/paul.jones/dev/buildroot-2009.02-rc2/project_build_arm/uclibc/linu
> x-2.6.28.1/.config ; \
>             fi ; \
>         fi
> # Try to get a config for latest linux version in the board directory
> if [ ! -f
> "/home/paul.jones/dev/buildroot-2009.02-rc2/project_build_arm/uclibc/lin
> ux-2.6.28.1/.config" ] ; then \
>                 scripts/get_linux_config.sh
> /home/paul.jones/dev/buildroot-2009.02-rc2/project_build_arm/uclibc/linu
> x-2.6.28.1 ; \
>         fi
> ls: cannot access
> /home/paul.jones/dev/buildroot-2009.02-rc2/project_build_arm/uclibc/linu
> x-2.6.28.1/*linux-2.6.*.config: No such file or directory
> basename: missing operand
> Try `basename --help' for more information.
> ls: cannot access
> /home/paul.jones/dev/buildroot-2009.02-rc2/project_build_arm/uclibc/linu
> x-2.6.28.1/*linux*.config: No such file or directory
> # Use a board config defined in the linux source.
> if [ ! -f
> "/home/paul.jones/dev/buildroot-2009.02-rc2/project_build_arm/uclibc/lin
> ux-2.6.28.1/.config" ] ; then \
>                 /usr/bin/make -j1 HOSTCC="/usr/bin/gcc" HOSTCFLAGS=""
> ARCH=arm CFLAGS_KERNEL="-Os
> -I/home/paul.jones/dev/buildroot-2009.02-rc2/build_arm/staging_dir/usr/i
> nclude
> -I/home/paul.jones/dev/buildroot-2009.02-rc2/build_arm/staging_dir/inclu
> de
> --sysroot=/home/paul.jones/dev/buildroot-2009.02-rc2/build_arm/staging_d
> ir/ -isysroot
> /home/paul.jones/dev/buildroot-2009.02-rc2/build_arm/staging_dir
> -mtune=arm920t"
> INSTALL_MOD_PATH=/home/paul.jones/dev/buildroot-2009.02-rc2/project_buil
> d_arm/uclibc/root
> CROSS_COMPILE=/home/paul.jones/dev/buildroot-2009.02-rc2/build_arm/stagi
> ng_dir/usr/bin/arm-linux-uclibcgnueabi-
> LDFLAGS="-L/home/paul.jones/dev/buildroot-2009.02-rc2/build_arm/staging_
> dir/lib
> -L/home/paul.jones/dev/buildroot-2009.02-rc2/build_arm/staging_dir/usr/l
> ib
> --sysroot=/home/paul.jones/dev/buildroot-2009.02-rc2/build_arm/staging_d
> ir/"
> LZMA="/home/paul.jones/dev/buildroot-2009.02-rc2/toolchain_build_arm/bin
> /lzma"
> PATH=/home/paul.jones/dev/buildroot-2009.02-rc2/project_build_arm/uclibc
> /u-boot-tools:/usr/local/bin:/usr/bin:/bin:/opt/bin:/usr/x86_64-pc-linux
> -gnu/arm-unknown-linux-gnu/gcc-bin/4.2.4:/usr/x86_64-pc-linux-gnu/arm-un
> known-linux-uclibc/gcc-bin/4.2.4:/usr/x86_64-pc-linux-gnu/gcc-bin/4.1.2:
> ~/buildroot/build_arm/staging_dir/usr/bin/ -C
> /home/paul.jones/dev/buildroot-2009.02-rc2/project_build_arm/uclibc/linu
> x-2.6.28.1 arm_defconfig || \
>                         echo "arm_defconfig failed..." ; \
>         fi
> make[1]: Entering directory
> `/home/paul.jones/dev/buildroot-2009.02-rc2/project_build_arm/uclibc/lin
> ux-2.6.28.1'
> ***
> *** Can't find default configuration "arch/arm/configs/arm_defconfig"!
> ***
> make[2]: *** [arm_defconfig] Error 1
> make[1]: *** [arm_defconfig] Error 2
> make[1]: Leaving directory
> `/home/paul.jones/dev/buildroot-2009.02-rc2/project_build_arm/uclibc/lin
> ux-2.6.28.1'
> arm_defconfig failed...
> # let the user create his/her own config
> if [ ! -f
> "/home/paul.jones/dev/buildroot-2009.02-rc2/project_build_arm/uclibc/lin
> ux-2.6.28.1/.config" ] ; then \
>                 /usr/bin/make -j1 HOSTCC="/usr/bin/gcc" HOSTCFLAGS=""
> ARCH=arm CFLAGS_KERNEL="-Os
> -I/home/paul.jones/dev/buildroot-2009.02-rc2/build_arm/staging_dir/usr/i
> nclude
> -I/home/paul.jones/dev/buildroot-2009.02-rc2/build_arm/staging_dir/inclu
> de
> --sysroot=/home/paul.jones/dev/buildroot-2009.02-rc2/build_arm/staging_d
> ir/ -isysroot
> /home/paul.jones/dev/buildroot-2009.02-rc2/build_arm/staging_dir
> -mtune=arm920t"
> INSTALL_MOD_PATH=/home/paul.jones/dev/buildroot-2009.02-rc2/project_buil
> d_arm/uclibc/root
> CROSS_COMPILE=/home/paul.jones/dev/buildroot-2009.02-rc2/build_arm/stagi
> ng_dir/usr/bin/arm-linux-uclibcgnueabi-
> LDFLAGS="-L/home/paul.jones/dev/buildroot-2009.02-rc2/build_arm/staging_
> dir/lib
> -L/home/paul.jones/dev/buildroot-2009.02-rc2/build_arm/staging_dir/usr/l
> ib
> --sysroot=/home/paul.jones/dev/buildroot-2009.02-rc2/build_arm/staging_d
> ir/"
> LZMA="/home/paul.jones/dev/buildroot-2009.02-rc2/toolchain_build_arm/bin
> /lzma"
> PATH=/home/paul.jones/dev/buildroot-2009.02-rc2/project_build_arm/uclibc
> /u-boot-tools:/usr/local/bin:/usr/bin:/bin:/opt/bin:/usr/x86_64-pc-linux
> -gnu/arm-unknown-linux-gnu/gcc-bin/4.2.4:/usr/x86_64-pc-linux-gnu/arm-un
> known-linux-uclibc/gcc-bin/4.2.4:/usr/x86_64-pc-linux-gnu/gcc-bin/4.1.2:
> ~/buildroot/build_arm/staging_dir/usr/bin/ -C
> /home/paul.jones/dev/buildroot-2009.02-rc2/project_build_arm/uclibc/linu
> x-2.6.28.1 xconfig ; \
>         fi
> make[1]: Entering directory
> `/home/paul.jones/dev/buildroot-2009.02-rc2/project_build_arm/uclibc/lin
> ux-2.6.28.1'
>   CHECK   qt
> *
> * Unable to find the QT3 installation. Please make sure that
> * the QT3 development package is correctly installed and
> * either install pkg-config or set the QTDIR environment
> * variable to the correct location.
> *
> make[2]: *** No rule to make target `scripts/kconfig/.tmp_qtcheck',
> needed by `scripts/kconfig/qconf.o'.  Stop.
> make[1]: *** [xconfig] Error 2
> make[1]: Leaving directory
> `/home/paul.jones/dev/buildroot-2009.02-rc2/project_build_arm/uclibc/lin
> ux-2.6.28.1'
> make: ***
> [/home/paul.jones/dev/buildroot-2009.02-rc2/project_build_arm/uclibc/lin
> ux-2.6.28.1/.config] Error 2
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
