From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 28 Dec 2012 14:21:15 +0100
Subject: [Buildroot] buildroot for AM3358 AM3359 with wireless-tools
 shared library
In-Reply-To: <1351596954.5576.22.camel@debian.fritz.box>
References: <50897A02.7000407@rie.eu> <20121025182332.GC5178@tarshish>
 <1351596954.5576.22.camel@debian.fritz.box>
Message-ID: <20121228142115.50e3643d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rgen Benjamin Ronshausen,

On Tue, 30 Oct 2012 12:35:54 +0100, J?rgen Benjamin Ronshausen wrote:

> i am developing wireless tracking software. i use the wireless-tools
> library to scan for wireless networks in the area.
> 
> i hope to use buildroot for compiling the c program, and to handle the
> library part. my program includes  #include <iwlib.h>.
> 
> on my old board (arm926t) i could compile by 
> ~/buildroot-2012.08/output/host/usr/bin/arm-linux-gcc -Wall -o
> "oldboard" "main.c" -liw
> 
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

The problem you reported at
https://raw.github.com/steven11/the-hunt-for-wireless-tools/master/logfile1
was fixed in the current Git repository of Buildroot. It was a problem
on 32 bits hosts while building a toolchain with largefile support
disabled.

The commit fixing it is
http://git.buildroot.net/buildroot/commit/?id=7ce93438c12ca68c9bb12ed28c4d15d1fa840c94.
You can either use the current Git of Buildroot, of backport this fix
in 2012.11 (which should be trivial).

Do not hesitate to let us know if this solves your problem, or if you
face other issues.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
