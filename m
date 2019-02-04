From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 4 Feb 2019 11:10:42 +0100
Subject: [Buildroot] [PATCH] host-genimage: add host-mtools to
 dependency list
In-Reply-To: <CA+U=DsooYVzQ7SMJ3ACidu4KY0xuHdY=_ZtkgA=NVf0WWpOpeQ@mail.gmail.com>
References: <20190201091304.31051-1-alexandru.ardelean@analog.com>
 <874l9n1zyh.fsf@dell.be.48ers.dk>
 <CA+U=DsooYVzQ7SMJ3ACidu4KY0xuHdY=_ZtkgA=NVf0WWpOpeQ@mail.gmail.com>
Message-ID: <20190204101042.GC17819@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alexandru, All,

On 2019-02-01 15:07 +0200, Alexandru Ardelean spake thusly:
> On Fri, Feb 1, 2019 at 1:59 PM Peter Korsgaard <peter@korsgaard.com> wrote:
> >
> > >>>>> "Alexandru" == Alexandru Ardelean <ardeleanalex@gmail.com> writes:
> >
> >  > From: Alexandru Ardelean <ardeleanalex@gmail.com>
> >  > The mcopy command is needed to generate vfat images.
> >  > If the host system has mtools installed, all is fine, since `genimage`
> >  > would use it.
> >
> >  > But since there is already a `host-mtools` build in the buildroot
> >  > packages, then this can be used instead.
> >
> >  > Signed-off-by: Alexandru Ardelean <ardeleanalex@gmail.com>
> >
> > There are use cases for genimage that does not require mcopy, so this
> > isn't really nice.
> >
> > But it is indeed true that a lot of genimage use cases require
> > host-dosfstools and host-mtools:
> >
> 
> Another idea I was thinking of [in case this one wasn't very popular],
> is to add in Config.in.host a symbol that adds/selects host-mtools if
> enabled.

That would give the same outcome: host-mtools would be buiklt, even in
situations they are nto needed.

> Personally, I don't mind if we leave this as-is and manually select
> host-mtools for genimage.
> 
> For a use-case I encountered, adding host-mtools like this change seemed useful.

A few other tools could be usefull as wel, like host-e2fsprogs or such.

But we do not want to build all of them in all cases, so I side with
Peter here: we have to rely on the user selecting what they need.

So, I've marked this as rejected in patchwork.

Thanks!

Regards,
Yann E. MORIN.

> Thanks
> Alex
> 
> > E.G. from raspberrypi_defconfig:
> >
> > # Required tools to create the SD image
> > BR2_PACKAGE_HOST_DOSFSTOOLS=y
> > BR2_PACKAGE_HOST_GENIMAGE=y
> > BR2_PACKAGE_HOST_MTOOLS=y
> >
> >
> > > ---
> >  >  package/genimage/genimage.mk | 2 +-
> >  >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >  > diff --git a/package/genimage/genimage.mk b/package/genimage/genimage.mk
> >  > index 393c3e9b94..18eea58af2 100644
> >  > --- a/package/genimage/genimage.mk
> >  > +++ b/package/genimage/genimage.mk
> >  > @@ -7,7 +7,7 @@
> >  >  GENIMAGE_VERSION = 10
> >  >  GENIMAGE_SOURCE = genimage-$(GENIMAGE_VERSION).tar.xz
> >  >  GENIMAGE_SITE = https://github.com/pengutronix/genimage/releases/download/v$(GENIMAGE_VERSION)
> >  > -HOST_GENIMAGE_DEPENDENCIES = host-pkgconf host-libconfuse
> >  > +HOST_GENIMAGE_DEPENDENCIES = host-pkgconf host-libconfuse host-mtools
> >  >  GENIMAGE_LICENSE = GPL-2.0
> >  >  GENIMAGE_LICENSE_FILES = COPYING
> >
> >  > --
> >  > 2.17.1
> >
> >  > _______________________________________________
> >  > buildroot mailing list
> >  > buildroot at busybox.net
> >  > http://lists.busybox.net/mailman/listinfo/buildroot
> >
> > --
> > Bye, Peter Korsgaard
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
