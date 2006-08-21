From: don <don_reid@comcast.net>
Date: Sun, 20 Aug 2006 23:13:32 -0700
Subject: [Buildroot] Bootloader (grub?)
In-Reply-To: <20060821075226.0518718a.philippe.ney@pardes.ws>
References: <20060821034734.GA14534@reid1.localdomain>
	<20060821075226.0518718a.philippe.ney@pardes.ws>
Message-ID: <20060821061332.GA9677@reid1.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Aug 21, 2006 at 07:52:26AM +0200, Philippe Ney wrote:
> I use grub on EPIA/iDoC system with the following lines in my grub.mk
> 
> GRUB_SOURCE:=grub_0.95+cvs20040624.orig.tar.gz
> GRUB_PATCH=grub_0.95+cvs20040624-17.diff.gz
> GRUB_SITE=http://ftp.debian.org/debian/pool/main/g/grub
> 
> And the packages are both availlable.

Thanks, I'll try that.  Buildroot installed:

GRUB_SOURCE:=grub_0.97.orig.tar.gz
GRUB_PATCH=grub_0.97-5.diff.gz
GRUB_SITE=http://ftp.debian.org/debian/pool/main/g/grub

I've had trouble before with build systems trying to use the debian servers
as a source.  Things seem to get changed there fairly often.


> What target did you build ? I guess the only one target using grub is
> the iso9660 one.

I have cramfs and ext2 turned on.  I expected to see /boot/grub in the
root files regardless of the target.  Again, I'll look at the iso
target.

> But if you want to install a firmware on the compact flash, you have 
> to write an installer that will run the grub shell to set the MBR.

I think I can install it either from the workstation, or from the
target system.  I can boot from a network right now, but that cable
isn't part of the long term plan.

Don
