From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Dec 2015 13:45:00 +0100
Subject: [Buildroot] buildroot support for OrangePI PC
In-Reply-To: <56769FEB.60400@xiot.nl>
References: <08485173-6FC7-42EF-9BFE-7B3B9967EEC0@xiot.nl>
 <56748758.7040908@mind.be> <56769FEB.60400@xiot.nl>
Message-ID: <20151220134500.549ecf55@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Eelco Chaudron,

On Sun, 20 Dec 2015 13:32:43 +0100, Eelco Chaudron wrote:

> /home/echaudron/buildroot_opi/output/host/usr/bin/armeb-buildroot-linux-uclibcgnueabi-ld.bfd: 
> BFD (GNU Binutils) 2.24 assertion fail elf32-arm.c:12387
> /home/echaudron/buildroot_opi/output/host/usr/bin/armeb-buildroot-linux-uclibcgnueabi-ld.bfd: 
> BFD (GNU Binutils) 2.24 assertion fail elf32-arm.c:12387
> Segmentation fault (core dumped)
> Makefile:1193: recipe for target 'u-boot' failed
> make[2]: *** [u-boot] Error 139

Seems like you are hitting bug
https://sourceware.org/bugzilla/show_bug.cgi?id=16698. It seems to be
fixed in the 2.24.90 snapshot, though it is not clear which specific
commit fixed it, so it's hard to backport it.

Can you try with with binutils 2.25 ?

Also, you have selected ARM big endian as the architecture, which is
almost certainly not what you want. If you're new to ARM and have no
reason to use big endian, then use ARM little endian, which is what
99.9999% of the people use.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
