From: Charles Krinke <charles.krinke@gmail.com>
Date: Mon, 21 Feb 2011 13:53:59 -0800
Subject: [Buildroot] booting JFFS2 or UBIFS created with buildroot
In-Reply-To: <20110221224029.07260bea@surf>
References: <AANLkTimrjTXp24EtKa1zPrf1j6-s-p1twWYA832PAGun@mail.gmail.com>
	<9AC3F0E75060224C8BBC5BA2DDC8853A1F5E11D6@EXV1.corp.adtran.com>
	<AANLkTimY2pEGmkM+ZvyXSKUuaWHae=B-cQA3iC3xi_2A@mail.gmail.com>
	<20110221224029.07260bea@surf>
Message-ID: <AANLkTi=O_EN_7eCuv0Xcdn7UsLo8J_TEMm+VhUYQ-L+H@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas:

I am currently using the default from buildroot for the Freescale
MPC8323ERDB reference board but have included it as an attachment.

As I think about this, it may be my problem is that I am using a u-boot.bin
from OpenEmbedded. What is really happening here is that I am trying to
"wean" my group from OpenEmbedded and onto buildroot. It is probable that no
mtd support is compiled into the u-boot I currently have on my MPC8323ERDB.
So, ... I am compiling a u-boot.bin from within buildroot right now and will
attempt to tftp it onto the board. Normally I try to use my BDI for this,
but am home working today (Presidents Day) so if I fubar the incantations
for updating u-boot, I am done until I get to my office tomorrow.

Charles

On Mon, Feb 21, 2011 at 1:40 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> On Mon, 21 Feb 2011 13:30:01 -0800
> Charles Krinke <charles.krinke@gmail.com> wrote:
>
> > When I boot a jffs2 image created with buildroot with its associated
> kernel,
> > I get a kernel panic when trying to mount the jffs2 image that looks like
> > this:
> >
> > VFS: Cannot open root device "mtdblock2" or unknown-block(2,0)
> > Please append a correct "root=" boot option; here are the available
> > partitions:
> > Kernel panic - not syncing: VFS: Unable to mount root fs on
> > unknown-block(2,0)
>
> Could you post your kernel .config ?
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>



-- 
Charles Krinke
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110221/4a3c3e9d/attachment-0001.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: dotconfig
Type: application/octet-stream
Size: 45888 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110221/4a3c3e9d/attachment-0001.obj>
