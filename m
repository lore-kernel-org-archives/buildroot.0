From: Dallas Clement <dallas.a.clement@gmail.com>
Date: Mon, 4 Aug 2014 12:56:40 -0500
Subject: [Buildroot] manipulating raw disk images as non-root user
In-Reply-To: <20140804070558.GK32743@waldemar-brodkorb.de>
References: <CAE9DZUThNrdD2AOHwsJRZG6fJh3=MRGe+Ggnh4ZrRxgXatJvWA@mail.gmail.com>
 <20140804070558.GK32743@waldemar-brodkorb.de>
Message-ID: <CAE9DZUSKbr3gzUW=Oh=f7P9q_Fs=nh7S0OpxyL_tbYV3NfxhAQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Aug 4, 2014 at 2:05 AM, Waldemar Brodkorb <wbx@openadk.org> wrote:

> Hi Dallas,
> Dallas Clement wrote,
>
> > Hi All,
> >
> > I am trying to figure out a way to produce a uSD card image file during
> my
> > build process and do it as a non-root user.  I am hoping to do this from
> a post
> > image script.
> >
> > I can create the image file with dd and partition it with parted as a
> non-root
> > user.  However, I have not figured out how to format, and populate the
> image
> > file.  Tools such as kpartx and losetup seem ideal for this purpose
> except that
> > they must be run as root.
> >
> > Does anyone know of a way to do this using qemu or fuse or related tools?
>
> You could use genext2fs to generate a filesystem as non-root.
>
> Installing a bootloader as non-root would be tricky, but is
> possible, too.
>
> best regards
>  Waldemar
>

Wow!  This is perfect.  I searched all over for a tool like this.  Couldn't
find anything.  Thanks Waldemar!  Do you know of a similar tool to make /
populate fat partitions.  I need to work with both fat and ext2.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140804/42d6a3fe/attachment.html>
