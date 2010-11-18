From: Tamamontu M <tamamontu@yahoo.com.au>
Date: Wed, 17 Nov 2010 21:46:49 -0800 (PST)
Subject: [Buildroot] arm-linux-ld: BFD 2.17 assertion fail with
	arm-linux-gcc 4.1.1
Message-ID: <964203.74563.qm@web114602.mail.gq1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Guys, 

I am trying to compile my source code which uses std librarie functions. I have added following option to LDFLAGS in the make file.

 -L/usr/local/arm/4.1.1-920t/lib -L/usr/local/arm/4.1.1-920t/lib/gcc/arm-linux-uclibc/4.1.1 -lgcc -lc 


It is giving this error=>  
-------------------------------------------------------------------------
make

make -C main
make[1]: Entering directory `/home/pritam/spi_boot_example/SDcard_bootloader_fat16/main'
arm-linux-gcc -MM -O2 -Wall -fPIC -mcpu=arm9tdmi -I../include  head.S main.c print.c spi.c sd_raw.c delay.c rootdir.c partition.c fat16.c 1>.depend
echo $PWD
/home/pritam/spi_boot_example/SDcard_bootloader_fat16/main
arm-linux-ld -T SDcard_bootloader_fat16.lnk -Map SDcard_bootloader_fat16.map -L/usr/local/arm/4.1.1-920t/lib -L/usr/local/arm/4.1.1-920t/lib/gcc/arm-linux-uclibc/4.1.1 -lgcc -lc   -r -o mainrom.o head.o main.o print.o spi.o sd_raw.o delay.o rootdir.o partition.o fat16.o     
make[1]: Leaving directory `/home/pritam/spi_boot_example/SDcard_bootloader_fat16/main'
arm-linux-ld -T SDcard_bootloader_fat16.lnk -Map SDcard_bootloader_fat16.map -L/usr/local/arm/4.1.1-920t/lib -L/usr/local/arm/4.1.1-920t/lib/gcc/arm-linux-uclibc/4.1.1 -lgcc -lc   -o SDcard_bootloader_fat16.elf main/mainrom.o
arm-linux-ld: BFD 2.17 assertion fail /opt/buildroot.920t-cc/toolchain_build_arm_nofpu/binutils-2.17/bfd/elf32-arm.c:7214
make: *** [SDcard_bootloader] Segmentation fault
-------------------------------------------------------------------------

Initially i was arm-linux-gcc 3.4 that also give similar errors hence I updated the tool chain and tried compiling again. There is only error now as compared to arm-linux-gcc 3.4. 

Can some one please explain why this error is generated. 

Thanks
Tama




      
