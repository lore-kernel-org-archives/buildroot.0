From: Charles Krinke <charles.krinke@gmail.com>
Date: Mon, 21 Feb 2011 15:35:36 -0800
Subject: [Buildroot] booting JFFS2 or UBIFS created with buildroot
In-Reply-To: <9AC3F0E75060224C8BBC5BA2DDC8853A1F5E12C4@EXV1.corp.adtran.com>
References: <AANLkTimrjTXp24EtKa1zPrf1j6-s-p1twWYA832PAGun@mail.gmail.com>
	<9AC3F0E75060224C8BBC5BA2DDC8853A1F5E11D6@EXV1.corp.adtran.com>
	<AANLkTimY2pEGmkM+ZvyXSKUuaWHae=B-cQA3iC3xi_2A@mail.gmail.com>
	<9AC3F0E75060224C8BBC5BA2DDC8853A1F5E12C4@EXV1.corp.adtran.com>
Message-ID: <AANLkTinL696jm0k2+6U2YXxMT0TVjP7Q7nsD5r_cO2nv@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks Andy:

I think I need to go do some research on kernel config of nand/nor,
something I havent looked at for a few years. I just glibly accepted all the
defaults the testing I did so the "cheap shot" got me a fur piece, but there
is some homework to be done.

I'll go do that homework and report back.

Charles

On Mon, Feb 21, 2011 at 3:29 PM, ANDY KENNEDY <ANDY.KENNEDY@adtran.com>wrote:

> > From: Charles Krinke [mailto:charles.krinke at gmail.com]
> > Sent: Monday, February 21, 2011 3:30 PM
> > To: ANDY KENNEDY
> > Cc: buildroot at busybox.net
> > Subject: Re: [Buildroot] booting JFFS2 or UBIFS created with buildroot
> >
> > Dear Andy et.al.:
> >
> > When I boot a jffs2 image created with buildroot with its associated
> > kernel, I get a kernel panic when trying to mount the jffs2 image that
> > looks like this:
> >
> > VFS: Cannot open root device "mtdblock2" or unknown-block(2,0)
> > Please append a correct "root=" boot option; here are the available
> partitions:
> > Kernel panic - not syncing: VFS: Unable to mount root fs on
> unknown-block(2,0)
> > Call Trace:
> > [c3823ed0] [c0008270] show_stack+0x48/0x168 (unreliable)
> > [c3823f10] [c03049c0] panic+0xa4/0x1e4
> > [c3823f60] [c03b6de4] mount_block_root+0x198/0x240
> > [c3823fb0] [c03b70e0] prepare_namespace+0x13c/0x1d0
> > [c3823fd0] [c03b6258] kernel_init+0x138/0x174
> > [c3823ff0] [c000f21c] kernel_thread+0x4c/0x68
> > Rebooting in 180 seconds..
> >
> > My bootcmd and bootargs in u-boot looks like this:
> >
> > bootcmd=bootm 0xfe120000 - 0xfe080000
> > bootargs=root=/dev/mtdblock2 rootfstype=jffs2
> > mtdparts=nor:1152k(U-Boot),2176k(kernel),-(JFFS2) rw console=ttyS0,115200
> >
> > As I recall, this was working the last time I did it 5 years ago, but
> > again, I probably have forgotten a few details or there are some
> > config options not yet turned on. I am working with buildroot defaults
> > so far.
> >
> > Charles
>
> This looks like you don't have your NAND/NOR flash configured in the
> kernel.
>



-- 
Charles Krinke
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110221/79c658ec/attachment-0001.html>
