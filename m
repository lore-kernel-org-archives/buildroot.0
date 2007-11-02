From: Ulf Samuelsson <ulf@atmel.com>
Date: Fri, 2 Nov 2007 15:41:57 +0100
Subject: [Buildroot] Latest svn + NGW100 def config = "mkimage" command
	notfound
References: <472B076E.4030906@mimc.co.uk>
Message-ID: <00df01c81d5f$181fe060$01c4af0a@Glamdring>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

----- Original Message ----- 
From: "Mark Jackson" <mpfj@mimc.co.uk>
To: <buildroot@uclibc.org>
Sent: Friday, November 02, 2007 12:18 PM
Subject: [Buildroot] Latest svn + NGW100 def config = "mkimage" command 
notfound


> I've just checked out the latest (20349) buildroot, and have encountered 
> the following error ...
>
> # svn co svn://uclibc.org/trunk/buildroot
> # make ngw100_defconfig
> # make
>
> ... eventually the make fails with ...
>
>  SYSMAP  System.map
>  SYSMAP  .tmp_System.map
>  MODPOST vmlinux
>  OBJCOPY arch/avr32/boot/images/vmlinux.bin
>  GZIP    arch/avr32/boot/images/vmlinux.gz
>  UIMAGE arch/avr32/boot/images/uImage
> "mkimage" command not found - U-Boot images will not be built
>  Image arch/avr32/boot/images/uImage is ready
> make[1]: Leaving directory 
> `/usr/local/dev/avr32/buildroot-20349/project_build_avr32/atngw100/linux-2.6.22.10'
> cp -dpf 
> /usr/local/dev/avr32/buildroot-20349/project_build_avr32/atngw100/linux-2.6.22.10/arch/avr32/boot/images/uImage 
> /usr/local/dev/avr32/buildroot-20349/binaries/atngw100/atngw100-linux-2.6.22.10-20071102
> cp: cannot stat 
> `/usr/local/dev/avr32/buildroot-20349/project_build_avr32/atngw100/linux-2.6.22.10/arch/avr32/boot/images/uImage': 
> No such file or directory
> make: *** 
> [/usr/local/dev/avr32/buildroot-20349/binaries/atngw100/atngw100-linux-2.6.22.10-20071102] 
> Error 1
>
> I've Googled for this error, but found nothing to fix the problem (except 
> for manually downloading mkimage).
>
> I assume this is a buildroot config error, so can someone point out where 
> I should be looking ?
>
> Thanks
> Mark
>

mkimage is a tool which is built as part of U-boot.
One workaround is to build the latest U-Boot for AVR32 and put mkimage in 
your path.
I.E: /usr/local/bin/mkimage

The Atmel AVR32 specific buildroot at www.atmel.no/buildroot might do this 
for you.

You can also select to build vmlinux as your linux target and generate the 
uImage manually from vmlinux.

Probably, linux should depend on U-Boot, if uImage is selected

Best Regards
Ulf Samuelsson
