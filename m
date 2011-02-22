From: Guillaume Gardet <guillaume.gardet@free.fr>
Date: Tue, 22 Feb 2011 09:08:23 +0100
Subject: [Buildroot] booting JFFS2 or UBIFS created with buildroot
In-Reply-To: <AANLkTimY2pEGmkM+ZvyXSKUuaWHae=B-cQA3iC3xi_2A@mail.gmail.com>
References: <AANLkTimrjTXp24EtKa1zPrf1j6-s-p1twWYA832PAGun@mail.gmail.com>	<9AC3F0E75060224C8BBC5BA2DDC8853A1F5E11D6@EXV1.corp.adtran.com>
	<AANLkTimY2pEGmkM+ZvyXSKUuaWHae=B-cQA3iC3xi_2A@mail.gmail.com>
Message-ID: <4D636EF7.3050608@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Did you enable JFFS2 support and the drivers needed for your NOR memory in the kernel?

Guillaume


Le 21/02/2011 22:30, Charles Krinke a ?crit :
> Dear Andy et.al <http://et.al>.:
>
> When I boot a jffs2 image created with buildroot with its associated kernel, I get a kernel panic when trying to mount the jffs2 image that looks like this:
>
> VFS: Cannot open root device "mtdblock2" or unknown-block(2,0)
> Please append a correct "root=" boot option; here are the available partitions:
> Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(2,0)
> Call Trace:
> [c3823ed0] [c0008270] show_stack+0x48/0x168 (unreliable)
> [c3823f10] [c03049c0] panic+0xa4/0x1e4
> [c3823f60] [c03b6de4] mount_block_root+0x198/0x240
> [c3823fb0] [c03b70e0] prepare_namespace+0x13c/0x1d0
> [c3823fd0] [c03b6258] kernel_init+0x138/0x174
> [c3823ff0] [c000f21c] kernel_thread+0x4c/0x68
> Rebooting in 180 seconds..
>
> My bootcmd and bootargs in u-boot looks like this:
>
> bootcmd=bootm 0xfe120000 - 0xfe080000
> bootargs=root=/dev/mtdblock2 rootfstype=jffs2 mtdparts=nor:1152k(U-Boot),2176k(kernel),-(JFFS2) rw console=ttyS0,115200
>
> As I recall, this was working the last time I did it 5 years ago, but again, I probably have forgotten a few details or there are some config options not yet turned on. I am working with buildroot defaults so far.
>
> Charles
>
>
>
>
> On Mon, Feb 21, 2011 at 1:19 PM, ANDY KENNEDY <ANDY.KENNEDY at adtran.com <mailto:ANDY.KENNEDY@adtran.com>> wrote:
>
>
>
>     From: buildroot-bounces at busybox.net <mailto:buildroot-bounces@busybox.net> [mailto:buildroot-bounces at busybox.net <mailto:buildroot-bounces@busybox.net>] On Behalf Of Charles Krinke
>     Sent: Monday, February 21, 2011 2:54 PM
>     To: buildroot at busybox.net <mailto:buildroot@busybox.net>
>     Subject: [Buildroot] booting JFFS2 or UBIFS created with buildroot
>
>     Thanks guys for bearing with my first two questions. I believe I can compile u-boot, linux and various file systems such as cpio, jffs2, ubifs so now I get to a new puzzle.
>
>     When I create a jffs2 image, I am used to giving u-boot a bootargs line that looks somewhat like:
>
>     root=/dev/mtdblock2 rootfstype=jffs2 rw mtdparts=nor:1162k(U-boot),1536k(kernel),-(JFFS2)
>
>     Which I believe essentially means that I have created mtdparts partitions on the fly and that the root filesystem should boot at the offset of JFFS2 and that the dynamic creation on the fly of the number of partitions doesnt matter as long as the jffs2 lines up with the last incantation.
>
>     But, ... this doesnt work anymore.
>
>
>
>
>     Define "doesn't work anymore".  The problem I'm seeing in linux-2.6.36.1 is that the kernel panics when attempting to create the devices on the fly (I think I have seen the panic around the function call add_device IIRC).  If this is a similar issue you are having, give me another week and I'll have it fixed as the MTD guys have ignored/not known the answer to my question from about a month ago.
>
>
>
>
>
> -- 
> Charles Krinke
>
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110222/41158cec/attachment.html>
