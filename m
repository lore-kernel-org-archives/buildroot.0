From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 Oct 2012 23:13:27 +0100
Subject: [Buildroot] buildroot for AM3358 AM3359 with wireless-tools
 shared library
In-Reply-To: <1351596954.5576.22.camel@debian.fritz.box>
References: <50897A02.7000407@rie.eu> <20121025182332.GC5178@tarshish>
 <1351596954.5576.22.camel@debian.fritz.box>
Message-ID: <20121030231327.4f22281c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Tue, 30 Oct 2012 12:35:54 +0100, J?rgen Benjamin Ronshausen wrote:

> The new Board is a AM335x Starter Kit with a Sitara AM3358 Cortex A8 cpu
> and WL1271 Wifi/bluetooth module.
> 
> to make my toolchain i issue:
> 
> make beaglebone_defconfig
> make menuconfig and select under packages, networking wireless-tools and
> library. i included contents of .config below.
> 
> The first problem is, that there are no files in
> /home/john/AM335/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/lib
> i am not sure about it, but i think there should be the .so files for
> the compiler.

Strange. Can you do:

	make clean
	make 2>&1 | tee logfile1
	find output/host > logfile2

Post logfile1 and logfile2 to some pastebin site (pastebin.com for
example), and give us the pastebin URLs.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
