From: Dallas Clement <dallas.a.clement@gmail.com>
Date: Mon, 4 Aug 2014 14:22:25 -0500
Subject: [Buildroot] manipulating raw disk images as non-root user
In-Reply-To: <53DFCCAF.2080108@gmail.com>
References: <CAE9DZUThNrdD2AOHwsJRZG6fJh3=MRGe+Ggnh4ZrRxgXatJvWA@mail.gmail.com>
 <20140804070558.GK32743@waldemar-brodkorb.de>
 <CAE9DZUSKbr3gzUW=Oh=f7P9q_Fs=nh7S0OpxyL_tbYV3NfxhAQ@mail.gmail.com>
 <53DFCCAF.2080108@gmail.com>
Message-ID: <CAE9DZUS7r+M0_e5KXNhvhkiEs8b6byLj=OvkPvFqfFnv7V48Vg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Aug 4, 2014 at 1:10 PM, Austin S Hemmelgarn <ahferroin7@gmail.com>
wrote:

> On 2014-08-04 13:56, Dallas Clement wrote:
> >
> > On Mon, Aug 4, 2014 at 2:05 AM, Waldemar Brodkorb <wbx@openadk.org
> > <mailto:wbx@openadk.org>> wrote:
> >
> >     Hi Dallas,
> >     Dallas Clement wrote,
> >
> >     > Hi All,
> >     >
> >     > I am trying to figure out a way to produce a uSD card image file
> >     during my
> >     > build process and do it as a non-root user.  I am hoping to do
> >     this from a post
> >     > image script.
> >     >
> >     > I can create the image file with dd and partition it with parted
> >     as a non-root
> >     > user.  However, I have not figured out how to format, and populate
> >     the image
> >     > file.  Tools such as kpartx and losetup seem ideal for this
> >     purpose except that
> >     > they must be run as root.
> >     >
> >     > Does anyone know of a way to do this using qemu or fuse or related
> >     tools?
> >
> >     You could use genext2fs to generate a filesystem as non-root.
> >
> >     Installing a bootloader as non-root would be tricky, but is
> >     possible, too.
> >
> >     best regards
> >      Waldemar
> >
> >
> > Wow!  This is perfect.  I searched all over for a tool like this.
> > Couldn't find anything.  Thanks Waldemar!  Do you know of a similar tool
> > to make / populate fat partitions.  I need to work with both fat and
> ext2.
>
> you can use any mkfs command as a non-root user, and for FAT you should
> be able to find a fuse driver for manipulating it (or there is always
> mtools).
>
>
>
> Huh? genext2fs has been part of Buildroot since years, and is directly
> usable by asking Buildroot to generate an ext2/3/4 image in "Filesystem
> images".

Ay yi yi.  I guess it never caught my eye.  How shameful.  :/

Regarding mtools, will it allow me to partition an image file, format a
partition as FAT, and copy files to it as non-root?
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140804/517fbef5/attachment.html>
