From: Gary Altenberg <gary@ioengineering.com>
Date: Thu, 24 Feb 2011 08:57:03 -0600
Subject: [Buildroot] final link failed: Nonrepresentable section on output
 during build ARM7TDMI uClibc toolchain with Buildroot
Message-ID: <4D6671BF.40802@ioengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I have been attempting to build a toolchain for an ARM7 based board.

I chose the following settings in buildroot:

arm
arm7tdmi
EABI
Kernel headers for 2.6.21
uClibC 0.9.31.x
binutils 2.21
gcc 4.3.x

I want to use the toolchain to build uClinux for this board. I can build 
uClinux with some much older tools and older uClibc and it runs on the 
board but it's very buggy. Lots of memory problems. I thought if I could 
upgrade my tools, busybox and uClibc. I can't even build the latest 
busybox for this board with the old tools.

I am building buildroot on an Ubuntu 9.10 machine

I have attempted this with buildroot-2010.11 then with buildroot-2011.02-rc1

I extract buildroot then run menuconfig and just set the options for a 
toolchain with the parameters from above.

Each time I have run into the getline problem where 
linux-2.6.21/unifdef.c has a getline function that needs to be renamed. 
Renaming the function gets me past that.

Then I keep running into a problem with "final link failed: 
Nonrepresentable section on output" I have looked and looked but cannot 
find any solution to this.

Below is the end of the build of buildroot when it quits.

Should I use a different combination of tools, a newer set of kernel 
stuff, a newer build of Ubuntu? Any help would be appreciated.

/work/sd/buildroot-2011.02-rc1/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/lib/libc.a(__uClibc_main.os): 
In function `__uClibc_fini':
__uClibc_main.c:(.text+0x6c): undefined reference to `__fini_array_start'
__uClibc_main.c:(.text+0x74): undefined reference to `__fini_array_end'
/work/sd/buildroot-2011.02-rc1/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/lib/libc.a(__uClibc_main.os): 
In function `__uClibc_main':
__uClibc_main.c:(.text+0x240): undefined reference to 
`__preinit_array_start'
__uClibc_main.c:(.text+0x244): undefined reference to `__preinit_array_end'
__uClibc_main.c:(.text+0x24c): undefined reference to `__init_array_start'
__uClibc_main.c:(.text+0x250): undefined reference to `__init_array_end'
/work/sd/buildroot-2011.02-rc1/output/host/usr/lib/gcc/arm-unknown-linux-uclibcgnueabi/4.3.5/../../../../arm-unknown-linux-uclibcgnueabi/bin/ld: 
.libs/libbfd-2.21.so: hidden symbol `__fini_array_end' isn't defined
/work/sd/buildroot-2011.02-rc1/output/host/usr/lib/gcc/arm-unknown-linux-uclibcgnueabi/4.3.5/../../../../arm-unknown-linux-uclibcgnueabi/bin/ld: 
final link failed: Nonrepresentable section on output
collect2: ld returned 1 exit status
make[5]: *** [libbfd.la] Error 1
make[5]: Leaving directory 
`/work/sd/buildroot-2011.02-rc1/output/build/binutils-2.21/bfd'
make[4]: *** [all-recursive] Error 1
make[4]: Leaving directory 
`/work/sd/buildroot-2011.02-rc1/output/build/binutils-2.21/bfd'
make[3]: *** [all] Error 2
make[3]: Leaving directory 
`/work/sd/buildroot-2011.02-rc1/output/build/binutils-2.21/bfd'
make[2]: *** [all-bfd] Error 2
make[2]: Leaving directory 
`/work/sd/buildroot-2011.02-rc1/output/build/binutils-2.21'
make[1]: *** [all] Error 2
make[1]: Leaving directory 
`/work/sd/buildroot-2011.02-rc1/output/build/binutils-2.21'
make: *** 
[/work/sd/buildroot-2011.02-rc1/output/build/binutils-2.21/.stamp_built] 
Error 2

-- 
Regards,
Gary
   
