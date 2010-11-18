From: Tamamontu M <tamamontu@yahoo.com.au>
Date: Wed, 17 Nov 2010 16:45:57 -0800 (PST)
Subject: [Buildroot] buildroot Digest, Vol 53, Issue 60
Message-ID: <150195.36412.qm@web114614.mail.gq1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> To: buildroot at busybox.net
> Subject: Re: [Buildroot] arm-linux-ld: BFD 2.16.1 assertion
> fail
> Message-ID: <20101117171643.3f701458@surf>
> Content-Type: text/plain; charset=US-ASCII
> 
> Hello,
> 
> On Wed, 17 Nov 2010 03:10:23 -0800 (PST)
> Tamamontu M <tamamontu@yahoo.com.au>
> wrote:
> 
> > This is my post to this mailing list. Let me introduce
> myself, i have
> > a cirrus logic EP9307 based board, with arm-linux-gcc
> 3.4 compiler. I
> > am new to linux arm environment.? 
> > 
> > I am trying to compile fat16 file system (originally
> based on lpc2148
> > arm-elf-gcc). After porting it to EP9307, this source
> code uses std
> > libraries, hence in order to use std libraries I
> added
> > -L/usr/local/arm/3.4/lib -lc? to LDFLAGS in make
> file.
> 
> How is this related to Buildroot ?
> 
> You should also probably upgrade your toolchain, gcc 3.4 is
> now very
> old.
> 
> Thomas

Hi Thomas,

Sorry I didnt mention the errors which I am getting 

-------------------------------------------------------------------------
make
make -C main
make[1]: Entering directory `/home/pritam/spi_boot_example/SDcard_bootloader_fat16/main'
arm-linux-gcc -MM -O2 -Wall -fPIC -mcpu=arm9tdmi -I../include -nostdlib head.S main.c print.c spi.c sd_raw.c delay.c rootdir.c partition.c fat16.c? ? 1>.depend
arm-linux-gcc -O2 -Wall -fPIC -mcpu=arm9tdmi -I../include -nostdlib -r -o mainrom.o head.o main.o print.o spi.o sd_raw.o delay.o rootdir.o partition.o fat16.o???
make[1]: Leaving directory `/home/pritam/spi_boot_example/SDcard_bootloader_fat16/main'
arm-linux-ld -nostdlib -T SDcard_bootloader_fat16.lnk -Map SDcard_bootloader_fat16.map -L/usr/local/arm/3.4/lib -lc? -o SDcard_bootloader_fat16.elf main/mainrom.o
arm-linux-ld: BFD 2.16.1 assertion fail /opt/buildroot/toolchain_build_arm_nofpu/binutils-2.16.1/bfd/elf32-arm.c:5013
arm-linux-ld: BFD 2.16.1 assertion fail /opt/buildroot/toolchain_build_arm_nofpu/binutils-2.16.1/bfd/elf32-arm.c:5013
arm-linux-ld: BFD 2.16.1 assertion fail /opt/buildroot/toolchain_build_arm_nofpu/binutils-2.16.1/bfd/elf32-arm.c:5013
arm-linux-ld: BFD 2.16.1 assertion fail /opt/buildroot/toolchain_build_arm_nofpu/binutils-2.16.1/bfd/elf32-arm.c:5013
arm-linux-ld: BFD 2.16.1 assertion fail /opt/buildroot/toolchain_build_arm_nofpu/binutils-2.16.1/bfd/elf32-arm.c:5013
arm-linux-ld: BFD 2.16.1 assertion fail /opt/buildroot/toolchain_build_arm_nofpu/binutils-2.16.1/bfd/elf32-arm.c:5013
arm-linux-ld: BFD 2.16.1 assertion fail /opt/buildroot/toolchain_build_arm_nofpu/binutils-2.16.1/bfd/elf32-arm.c:5013
arm-linux-ld: BFD 2.16.1 assertion fail /opt/buildroot/toolchain_build_arm_nofpu/binutils-2.16.1/bfd/elf32-arm.c:5013
/usr/local/arm/3.4/lib/libc.so: undefined reference to `main'
arm-linux-ld: BFD 2.16.1 assertion fail /opt/buildroot/toolchain_build_arm_nofpu/binutils-2.16.1/bfd/elf32-arm.c:5013
arm-linux-ld: BFD 2.16.1 assertion fail /opt/buildroot/toolchain_build_arm_nofpu/binutils-2.16.1/bfd/elf32-arm.c:5013
arm-linux-ld: BFD 2.16.1 assertion fail /opt/buildroot/toolchain_build_arm_nofpu/binutils-2.16.1/bfd/elf32-arm.c:5013
arm-linux-ld: BFD 2.16.1 assertion fail /opt/buildroot/toolchain_build_arm_nofpu/binutils-2.16.1/bfd/elf32-arm.c:5013
arm-linux-ld: BFD 2.16.1 assertion fail /opt/buildroot/toolchain_build_arm_nofpu/binutils-2.16.1/bfd/elf32-arm.c:5013
arm-linux-ld: BFD 2.16.1 assertion fail /opt/buildroot/toolchain_build_arm_nofpu/binutils-2.16.1/bfd/elf32-arm.c:5203
make: *** [SDcard_bootloader] Segmentation fault
----------------------------------------------------------------------
These are the errors which I get after I added -L/usr/local/arm/3.4/lib -lc  to LDFLAGS in make file.

I am using the toolchain which came along with the development kit. Its was released around 2005-2006. I am new to this environment hence unable to understand what this error is. In the error message it mentions about /opt/buildroot/toolchain_build_arm.

Can some one please explain what this error is. Has anyone come across it. 

Thanks
Tama





      
