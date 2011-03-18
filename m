From: Barry Kauler <bkauler@gmail.com>
Date: Fri, 18 Mar 2011 12:33:02 +0800
Subject: [Buildroot] Cannot compile gcc in target
In-Reply-To: <AANLkTi=0qnn024KC8WWhg33-wCWi2Loy1RrBVuL0HdOT@mail.gmail.com>
References: <AANLkTi=0qnn024KC8WWhg33-wCWi2Loy1RrBVuL0HdOT@mail.gmail.com>
Message-ID: <AANLkTin2wP04wwz-YyYeAPkjT=xzua=+LpmekAsP2zFN@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update, I have now got gcc-target to compile.

I don't know what I did specifically, but I reran menuconfig and made
a few changes: changed gcc from 4.3.5 to 4.4.5, changed old
linuxthreads to posix native threads, enabled mpc package, maybe one
or two other things.

I read somewhere that gcc needs mpc, but really unsure about that.

Anyway, if anyone else wants a working i586 uclibc 0.9.32-rc3
toolchain, the .config is attached.

Regards,
Barry Kauler


On 3/18/11, Barry Kauler <bkauler@gmail.com> wrote:
> Hi, I am new to Buildroot, and it would be great if someone
> experienced with Buildroot could help me out.
>
> First time through, I just ran "make menuconfig" and apart from
> choosing i586 architecture, just accepted the defaults, and got a
> target root filesystem.
>
> Fine, but it only has runtime files and what I want is a basic cli
> compiling environment for compiling some applications statically. So I
> ran 'make clean' then 'make menuconfig' again, and made what seem like
> the minimum changes to create a compiling environment in the target
> rootfs.
>
> It all goes well until compiling gcc for the target, and stops with this:
>
> TARGET_CPU_DEFAULT="" \
> 	HEADERS="options.h config/i386/i386.h config/i386/unix.h
> config/i386/att.h config/dbxelf.h config/elfos.h config/svr4.h
> config/linux.h config/i386/linux.h defaults.h"
> DEFINES="UCLIBC_DEFAULT=1" \
> 	/bin/sh
> /mnt/sdb3/buildroot/buildroot-2011.02/output/toolchain/gcc-4.3.5/gcc/mkconfig.sh
> tm.h
> gawk -f
> /mnt/sdb3/buildroot/buildroot-2011.02/output/toolchain/gcc-4.3.5/gcc/opt-gather.awk
> /mnt/sdb3/buildroot/buildroot-2011.02/output/toolchain/gcc-4.3.5/gcc/ada/lang.opt
> /mnt/sdb3/buildroot/buildroot-2011.02/output/toolchain/gcc-4.3.5/gcc/fortran/lang.opt
> /mnt/sdb3/buildroot/buildroot-2011.02/output/toolchain/gcc-4.3.5/gcc/java/lang.opt
> /mnt/sdb3/buildroot/buildroot-2011.02/output/toolchain/gcc-4.3.5/gcc/treelang/lang.opt
> /mnt/sdb3/buildroot/buildroot-2011.02/output/toolchain/gcc-4.3.5/gcc/c.opt
> /mnt/sdb3/buildroot/buildroot-2011.02/output/toolchain/gcc-4.3.5/gcc/common.opt
> /mnt/sdb3/buildroot/buildroot-2011.02/output/toolchain/gcc-4.3.5/gcc/config/i386/i386.opt
> /mnt/sdb3/buildroot/buildroot-2011.02/output/toolchain/gcc-4.3.5/gcc/config/linux.opt
>> tmp-optionlist
> TARGET_CPU_DEFAULT="" \
> 	HEADERS="auto-build.h ansidecl.h" DEFINES="" \
> 	/bin/sh
> /mnt/sdb3/buildroot/buildroot-2011.02/output/toolchain/gcc-4.3.5/gcc/mkconfig.sh
> bconfig.h
> make[3]: *** No rule to make target `auto-build.h', needed by
> `build/genmodes.o'.  Stop.
> make[3]: *** Waiting for unfinished jobs....
> /bin/sh
> /mnt/sdb3/buildroot/buildroot-2011.02/output/toolchain/gcc-4.3.5/gcc/../move-if-change
> tmp-optionlist optionlist
> echo timestamp > s-options
> make[3]: Leaving directory
> `/mnt/sdb3/buildroot/buildroot-2011.02/output/build/gcc-4.3.5-target/gcc'
> make[2]: *** [all-gcc] Error 2
> make[2]: Leaving directory
> `/mnt/sdb3/buildroot/buildroot-2011.02/output/build/gcc-4.3.5-target'
> make[1]: *** [all] Error 2
> make[1]: Leaving directory
> `/mnt/sdb3/buildroot/buildroot-2011.02/output/build/gcc-4.3.5-target'
> make: ***
> [/mnt/sdb3/buildroot/buildroot-2011.02/output/build/gcc-4.3.5-target/.compiled]
> Error 2
> #
>
> I also tried the latest snapshot of Builroot, same problem. Does
> anyone know what is going wrong here?
>
> The .config file is attached.
>
> Regards,
> Barry Kauler
>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: DOTconfig-20110318-1009.gz
Type: application/x-gzip
Size: 3978 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110318/3845d365/attachment.bin>
