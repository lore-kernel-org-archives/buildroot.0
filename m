From: Chris Wilkinson <kinsham@verizon.net>
Date: Thu, 11 Oct 2012 11:16:09 -0400
Subject: [Buildroot] Creating initrd
In-Reply-To: <20121011164826.753f8312@skate>
References: <1349964303.8392.39.camel@Homeserver>
 <20121011164826.753f8312@skate>
Message-ID: <1349968569.14474.10.camel@Homeserver>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The .config is here

http://pastebin.com/84LqnBXS

This shows what I'm trying to achieve.

http://d-i.alioth.debian.org/manual/en.armel/ch05s01.html#boot-firmware. 

The output on the serial console goes like this on power up.

>>
No network interfaces found

EM-7210 ver.T04 2005-12-12 (For ver.AA)
== Executing boot script in 1.000 seconds - enter ^C to abort

At this point, hit Control-C to interrupt the boot loader[4]. This will
give you the RedBoot prompt. Enter the following commands:

> load -v -r -b 0x01800000 -m ymodem ramdisk.gz
> load -v -r -b 0x01008000 -m ymodem zImage
> exec -c "console=ttyS0,115200 rw root=/dev/ram mem=256M at 0xa0000000" -r
0x01800000

Chris
On Thu, 2012-10-11 at 16:48 +0200, Thomas Petazzoni wrote:
> Dear Chris Wilkinson,
> 
> On Thu, 11 Oct 2012 10:05:03 -0400, Chris Wilkinson wrote:
> > I haven't been able to figure out how to get BR to create an initial
> > ramdisk.
> > 
> > I selected initramfs in Filesystem images. What I end up with is
> > 
> > -rw-r--r-- 1 chrisw chrisw 38356992 Oct 11 09:00 rootfs.cpio
> > -rw-r--r-- 1 chrisw chrisw 13666196 Oct 11 09:00 rootfs.cpio.gz
> > -rw-r--r-- 1 chrisw chrisw 48346112 Oct 11 09:00 rootfs.ext2
> > -rw-r--r-- 1 chrisw chrisw 13990321 Oct 11 09:00 rootfs.ext2.gz
> > -rwxr-xr-x 1 chrisw chrisw  1422576 Oct 11 09:01 zImage
> > 
> > There is no initrd and the rootfs is way too big for flash.
> 
> Forget about initrd, nobody uses that anymore.
> 
> Can you post your entire .config?
> 
> Thanks,
> 
> Thomas
