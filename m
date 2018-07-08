From: Leon Anavi <leon.anavi@konsulko.com>
Date: Sun, 8 Jul 2018 12:32:52 +0300
Subject: [Buildroot] [PATCH] configs/raspberrypi3_defconfig: fix
 filesystem size
In-Reply-To: <20180708091651.GA2474@scaer>
References: <1530264190-9535-1-git-send-email-leon.anavi@konsulko.com>
 <7061b17f-2365-592c-662b-e383f425e03c@mind.be> <20180708091651.GA2474@scaer>
Message-ID: <CALtQ3O3=qmz3uWXkUs-ev62qXk0c=RQCtFQ=NaK-WFZGduT39Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout, Yann, All,

On Sun, Jul 8, 2018, 12:16 Yann E. MORIN <yann.morin.1998@free.fr> wrote:

> Arnout, All,
>
> On 2018-07-08 00:35 +0200, Arnout Vandecappelle spake thusly:
> > On 29-06-18 11:23, Leon Anavi wrote:
> > > Increase the filesystem size for raspberrypi3 by setting
> > > BR2_TARGET_ROOTFS_EXT2_SIZE to "120M". The filesystem for
> > > raspberrypi3_64 has the same size.
> > >
> > > Fixes:
> > > Copying files into the device: __populate_fs: Could not allocate block
> in ext2 filesystem while writing file "services"
> > > mkfs.ext4: Could not allocate block in ext2 filesystem while
> populating file system
> > >
> > > Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> >
> >  Applied to master, thanks.
>
> Not really, I'm afraid...
>

I am also afraid that I still don't see it in master.

Best regards, Leon


> >  It's a pity we didn't get to the bottom of why this error was not
> happening
> > every time, or why it didn't happen before. But, as mentioned, the fix
> is simple
> > and we were close to the limit.
>
> I did two tests on the same, the first was successfull, the second
> failed. The only difference being that the machine was unloaded for
> the first one, while I was doing something else for the second one...
> Yeah, not very conclusive... :-(
>
> Regards,
> Yann E. MORIN.
>
> >  I've extended the commit log a little bit.
> >
> >  Regards,
> >  Arnout
> >
> > > ---
> > >  configs/raspberrypi3_defconfig | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/configs/raspberrypi3_defconfig
> b/configs/raspberrypi3_defconfig
> > > index 856f321..0ef9afe 100644
> > > --- a/configs/raspberrypi3_defconfig
> > > +++ b/configs/raspberrypi3_defconfig
> > > @@ -28,6 +28,7 @@ BR2_PACKAGE_HOST_MTOOLS=y
> > >  # Filesystem / image
> > >  BR2_TARGET_ROOTFS_EXT2=y
> > >  BR2_TARGET_ROOTFS_EXT2_4=y
> > > +BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
> > >  # BR2_TARGET_ROOTFS_TAR is not set
> > >  BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi3/post-build.sh"
> > >  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi3/post-image.sh"
> > >
> >
> > --
> > Arnout Vandecappelle                          arnout at mind be
> > Senior Embedded Software Architect            +32-16-286500
> > Essensium/Mind                                http://www.mind.be
> > G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> > LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> > GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
>
> --
>
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
>      |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is
> no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
>  conspiracy.  |
>
> '------------------------------^-------^------------------^--------------------'
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180708/d14583ab/attachment.html>
