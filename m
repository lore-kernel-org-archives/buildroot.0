From: Ulf Samuelsson <ulf@atmel.com>
Date: Sun, 21 Oct 2007 10:56:33 +0200
Subject: [Buildroot] make atngw100_defconfig - errors
References: <471A938B.2020004@promwad.com>
Message-ID: <00a001c813c0$e79e50e0$01c4af0a@Glamdring>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Hi Ulf,
>
> I'm trying to do
>
> make atngw100_defconfig
>
> make
>
> and have the following error:
> bzcat /sources/u-boot-1.2.0-atmel-patch.tar.bz2 | tar -C 
> /opt/buildroot/project_build_avr32/atngw100/u-boot-patches -xvf -
> u-boot-1.2.0-atmel-patch/README.txt
> u-boot-1.2.0-atmel-patch/README.txt~
> touch /opt/buildroot/project_build_avr32/atngw100/u-boot-patches/.unpacked
> toolchain/patch-kernel.sh /opt/buildroot/build_avr32/u-boot-1.2.0-atmel 
> /opt/buildroot/project_build_avr32/atngw100/u-boot-patches \*.patch
> touch 
> /opt/buildroot/build_avr32/u-boot-1.2.0-atmel/.patched.u-boot-1.2.0-atmel-patch.tar.bz2
> cp target/device/Atmel/atngw100/u-boot/atngw100.h 
> /opt/buildroot/build_avr32/u-boot-1.2.0-atmel/include/configs/.
> cp: cannot stat `target/device/Atmel/atngw100/u-boot/atngw100.h': No such 
> file or directory
> make: *** 
> [/opt/buildroot/project_build_avr32/atngw100/u-boot-1.2.0-atmel/.configured] 
> Error 1
>
> Any advice?
>

Download mainstream U-Boot and copy the
"includes/configs/atngw100.h" file to 
"target/device/Atmel/atngw100/u-boot/atngw100.h"
I have seen this before, but did not have time to fix it.


> Toolchain seems built OK except 
> build_avr32/staging_dir/bin/avr32-linux-uclibc-cc is symlink to gcc
> (which is not present in build_avr32/staging_dir/bin/) - seems it should 
> be symlink to avr32-linux-uclibc-gcc
>

Best Regards
Ulf Samuelsson
