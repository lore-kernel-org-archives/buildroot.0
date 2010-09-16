From: Ormund Williams <ormundw@panix.com>
Date: Thu, 16 Sep 2010 04:51:04 -0400
Subject: [Buildroot] EXT2-fs error
In-Reply-To: <SNT119-W315E2AFFA66E576AA7F27A827A0@phx.gbl>
References: <29591683.post@talk.nabble.com> <29641651.post@talk.nabble.com>
	, <SNT119-W3039C61443ADF5E85164F582730@phx.gbl>
	, <SNT119-W26A1FD2D4331730D164D2C82770@phx.gbl>
	, <20100913102031.03481d63@surf>
	, <SNT119-W9D3C2902126B58DEE9A1282770@phx.gbl>
	, <87mxrm6lrc.fsf@macbook.be.48ers.dk>
	, <SNT119-W4750F1F26C2613C40FB5C82790@phx.gbl>
	, <20100915133124.604f8b74@surf>
	, <SNT119-W19D1DBCD197B0F139037EA82790@phx.gbl>
	, <20100915190725.459aaca8@surf>
	<SNT119-W315E2AFFA66E576AA7F27A827A0@phx.gbl>
Message-ID: <1284627065.4173.2221.camel@station1.ormlab.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 2010-09-16 at 06:50 +0000, Johnny Beardsmore wrote:
> What I'm doing is using Buildroot to create an embedded OS for a small
> computing device (a pc-104).  I have some code which then runs on the
> device and acts as a data collection/analysis system.
I have built a similar system to yours.

> Un-taring the rootfs.i486.tar.bz onto the flashdrive of the device
> using grub has worked for me (with the exception of the problem I'm
> experiencing),
The confusion starts here.  Where is the "rootfs.i486.tar.bz" and why
are you un-taring it unto a flash drive?

In my system I use Syslinux to load the kernel, bzImage, into ram and
then gunzip the file-system also into ram.  Syslinux then passes some
command line argument to linux and the system starts.

Where does the rootfs.i486.tar.bz file come from? Do you create it
manually? or is it the output of buildroot?  The file-system image I get
from buildroot is called rootfs.i486.ext2.gz, no tar.  

> and the whole procedure has been built around this (most of this has
> been achieved by trial-and-error, and assistance from forums).  I'd
> really like to avoid changing things to use the ext2 image file if
> possible and continue using the .tar.bz file.  The problem is I keep
> loosing frequently accessed files, which is (I bilieve) due to me
> mounting a file system which hasn't been checked.  I get a warning
> about the fs on boot, and inode errors when I try to acces a file
> which has been struck.
Do you have the flash drive mounted as you root file system?  You maybe
wearing out the flash thus loosing the those frequently accessed files.
My flash drive (CF card) is mounted read-only and when certain events
occur or a timeout in my application, the flash drive is remounted
read-write, the data is written and then the flash drive is remounted
read-only, in over three years and 23 system I haven?t lost any data.

> I believe this is quite a simple problem to fix - I just can't figure
> this one out.  I believe I need (some how) to check the file system on
> either the build machine, and/or the target.  If it is done on the
> target I may need to do this periodically/on-boot (due to the high
> number of unclean shut-down the device is likely to experience). 
I don't think doing in fsck on boot is going to help you, your files are
getting corrupted on the unclean shut-downs fsck isn't going to be able
to repair them.

>  Hopefully this is enough detail, but I'm pulling my hair out with
> this, so will willingly forward anything further which may assist. 
If you can clarify the confusion noted above maybe I can help.

-- 
Ormund Williams
OrmLab LLC
