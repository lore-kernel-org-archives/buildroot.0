From: Philippe Ney <philippe.ney@pardes.ws>
Date: Mon, 21 Aug 2006 07:52:26 +0200
Subject: [Buildroot] Bootloader (grub?)
In-Reply-To: <20060821034734.GA14534@reid1.localdomain>
References: <20060821034734.GA14534@reid1.localdomain>
Message-ID: <20060821075226.0518718a.philippe.ney@pardes.ws>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Which bootloader do you-all recommend for an x86 (Via EPIA) system
> booting from a compact flash card?
> 
> I have been trying to set up grub, just because that is the one I am
> used to. First I found it wouldn't build (due to a makefile problem
> reported in Jan.). Then I found the patch file called for is no longer
> on the source server. These make me think it isn't getting much use.
> 
> When I finally got it all compiles, I couldn't find any trace of it in
> the target file system.  I guess it could be nicely put into the MBR for
> me. But shouldn't there still be some files (/boot/grub/*)?
> 
> Do I just need to create the menu file manually?
> 
> Don Reid

Hi Don,

I use grub on EPIA/iDoC system with the following lines in my grub.mk

GRUB_SOURCE:=grub_0.95+cvs20040624.orig.tar.gz
GRUB_PATCH=grub_0.95+cvs20040624-17.diff.gz
GRUB_SITE=http://ftp.debian.org/debian/pool/main/g/grub

And the packages are both availlable.

What target did you build ? I guess the only one target using grub is
the iso9660 one.

But if you want to install a firmware on the compact flash, you have 
to write an installer that will run the grub shell to set the MBR.

Philippe
