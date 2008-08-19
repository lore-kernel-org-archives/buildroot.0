From: Teemu Keskinarkaus <Teemu.Keskinarkaus@cc-systems.com>
Date: Tue, 19 Aug 2008 08:53:21 +0200
Subject: [Buildroot] Errors on rootfs
In-Reply-To: <330EC2471BF24E48B513AF1A6975EB695D59E2@MAIL-UA.ccs.local>
References: <330EC2471BF24E48B513AF1A6975EB695D59E2@MAIL-UA.ccs.local>
Message-ID: <330EC2471BF24E48B513AF1A6975EB696041F3@MAIL-UA.ccs.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am I really the only one that has problems with RootFS generation?

 

I keep getting same error with the actual hardware. Other than that,
things are working ok.

 

Those errors appear only with rootfs. I have another partition that I
generate fs myself and when I'm mounting it I don't get any errors.

 

Teemu K.

 

________________________________

From: buildroot-bounces@uclibc.org [mailto:buildroot-bounces at uclibc.org]
On Behalf Of Teemu Keskinarkaus
Sent: 11. elokuuta 2008 10:25
To: buildroot at uclibc.org
Subject: [Buildroot] Errors on rootfs

 

Hi,

 

I'm using buildroot to generate system for AT91SAM9263ek board.
Everything works fine except rootfs mount gives few errors when
mounting.

 

Maybe 20 errors like these:

[    1.133916] CLEANMARKER node found at 0x00060000 has totlen 0xc !=
normal 0x0

[    1.170913] CLEANMARKER node found at 0x00080000 has totlen 0xc !=
normal 0x0

 

And maybe 10 errors like these:

[    1.834864] jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found
at 0x002b73f0 0x90fa instead

[    1.843863] jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found
at 0x002b73f4 0xac8f instead

 

First errors seem to come from every block that is used for rootfs.

 

I'm using Samba/USB to program the rootfs to board. At the moment board
is Atmel's evaluation board. I verified before rebooting the board that
flash contained exactly the same image that there were supposed to be.
So for some reason buildroot generates broken rootfs or am I doing
something wrong? Block size is correct since filesystem is working just
fine except those errors on boot. They will stay on every boot.

 

I wouldn't mind that, but I need to get system up and running as fast as
possible and those errors take about 1.5seconds and in this case every
seconds count. ;)

 

Teemu K.

 

-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080819/6256423c/attachment.htm 
