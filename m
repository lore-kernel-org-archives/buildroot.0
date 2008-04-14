From: Arun Reddy <reddyac@gmail.com>
Date: Mon, 14 Apr 2008 15:31:24 -0700
Subject: [Buildroot] Creating a bootable filesystem image?
In-Reply-To: <20080414202554.1CDA82FE1132@sam.liddicott.com>
References: <20080414202554.1CDA82FE1132@sam.liddicott.com>
Message-ID: <326f33790804141531v6668f5eia9cbb1c761747a8c@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thank you for the explanation, that clears things up. I was able to actually
get the bootable image created by playing around with the formulas for the
CHS.

I appear to be left with one more error which Sebastian pointed out which is
that /sbin/grub cannot be located. I checked that directory and noticed grub
wasn't there, but found it in /usr/sbin/grub. I changed this accordingly in
the script but I still get the same error back. Does anyone know why this is
occurring and what I can do to get grub noticed? Thank you.

Arun

On Mon, Apr 14, 2008 at 1:29 PM, Sam Liddicott <sam@liddicott.com> wrote:

> I'm trying to get round the error that that loopback moount presumes LBA
> geometry which is not how the disk image was formatted
>
> I've just been scripting disk partition/installs of dualboot linux/freedos
> partitions and learned a lot, but I did't get chance to put it into
> buildroot today, sorry.
>
> Sam
>
> ------------------------------
> From: Arun Reddy <reddyac@gmail.com>
> Sent: 14 April 2008 17:57
> To: Sam Liddicott <sam@liddicott.com>
> Cc: Sebastian <bastisoft@arcor.de>; Buildroot List <buildroot@uclibc.org>
>
> Subject: Re: [Buildroot] Creating a bootable filesystem image?
>
> Hi Sam,
>
> Just to be clear are you referring to the same script "build-ext3-img"
> script? If so can I get some more information on what exactly it is you are
> trying to fix with it?
>
> I would like to point out that I was also able to bypass the error Sam and
> I mentioned by simply moving my .iso image from the ../binaries/uclibc
> folder and placing it somewhere else. Using the script, it then made use of
> the actual rootfs.i386.ext2 image. Unfortunately I am still getting the
> error that there is no space.
>
> arun
>
> On Fri, Apr 11, 2008 at 12:11 PM, Sam Liddicott <sam@liddicott.com> wrote:
>
> > I've managed to understand lba and chs freakery.
> >
> > The disk image chs mapping that gub ses is not the one used bye the
> > mount the copied the files.
> >
> > I've spent the best part of a day this week playing with lba and chs
> > mappings and think that on Monday I can fix the script.
> >
> > Sam
> >
> >
> > ------------------------------
> > From: Arun Reddy <reddyac@gmail.com>
> > Sent: 11 April 2008 19:51
> > To: Sebastian <bastisoft@arcorde>
> > Cc: Buildroot List <buildroot@uclibc.org>
> > Subject: Re: [Buildroot] Creating a bootable filesystem image?
> >
> > Sebastian and Buildroot members
> >
> > I will try this as soon as I can. Right now I am not near my machine
> > with my build system. If anyone can please try this out for themselves to
> > give further feedback I would greatly appreciate it. This might be something
> > I can submit as a bug if everyone is experiencing it. Thank you and I will
> > let you know about my results as soon as I can
> >
> > Arun
> >
> > On Wed, Apr 9, 2008 at 10:44 AM, Sebastian <bastisoft@arcor.de> wrote:
> >
> > > Hello Arun,
> > >
> > > I tried to create an ext2 file system myself (i486 architecture
> > > without any applications enabled).
> > >
> > > The first two questions I answered with return, the last one with
> > > /home/basti/linux/buildroot/binaries/uclibc/ and then I noticed that the
> > > fdisk command gave the same error message as you wrote.
> > >
> > > But it doesn't create a partition, so I create one myself: (n)ew,
> > > (p)rimary, (1), return, return, (w)rite. Then it tries to install grub which
> > > fails for me, as it can't find /boot/grub/stage1 on the image. If I could
> > > provide these files, it should work, as grub recognizes the partition.
> > >
> > > Maybe you could try to build no ISO image at all, just the ext2 (ext3)
> > > root file system. I have really no idea why it tries to copy your iso file
> > > onto the image, as it is not to be placed there.
> > >
> > > Best regards,
> > > Sebastian
> > >
> > >
> > >        Sebastian,
> > > >
> > > >        Thanks for the information, I do understand it much clearer
> > > >        now I am attempting to run the script and find out whether my
> > > >        input will result in the bootable filesystem I want. When
> > > >        running build-ext-img, I input
> > > >
> > > >        Enter the path to the image:
> > > >
> > > >        I input "/root/buildroot/scripts/" since that is where the
> > > >        filesystem image is located.
> > > >
> > > >        Enter the name of the image file:
> > > >
> > > >        I input "buildroot.img"
> > > >
> > > >        Enter the path to the root filesystem that you want to
> > > > install
> > > >        the image
> > > >
> > > >        I
> > >
> > >
>
> [The entire original message is not included]
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080414/571fcae4/attachment-0001.htm 
