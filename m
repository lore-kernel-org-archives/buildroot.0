From: =?UTF-8?Q?K=C3=A1roly_Kasza?= <kaszak@gmail.com>
Date: Wed, 22 Oct 2014 17:09:22 +0200
Subject: [Buildroot] [PATCH 1/1] package/cdrkit: standardize site URL
In-Reply-To: <20141022152231.1ecdf27a@free-electrons.com>
References: <1413983659-3496-1-git-send-email-kaszak@gmail.com>
 <20141022152231.1ecdf27a@free-electrons.com>
Message-ID: <CABbD_XA+wDX7V9r0AfHdQyUmgnruUUNCbih_P4i5Fe-psvKbnA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

I tried to standardize this package, but what you are telling makes sense.
If you and Yann both agree to use snapshot.debian.org instead, than reject
this patch
and I will send a patchset, that completely removes BR2_DEBIAN_MIRROR from
Buildroot,
and changes all occurrences to snapshot.debian.org, is that OK with you?

Best regards,
Karoly

On Wed, Oct 22, 2014 at 3:22 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Dear Karoly Kasza,
>
> On Wed, 22 Oct 2014 15:14:19 +0200, Karoly Kasza wrote:
> > Standardize download site URL using the Debian mirror.
> >
> > Signed-off-by: Karoly Kasza <kaszak@gmail.com>
> > ---
> >  package/cdrkit/cdrkit.mk |    2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/package/cdrkit/cdrkit.mk b/package/cdrkit/cdrkit.mk
> > index 3f2b429..e1392b6 100644
> > --- a/package/cdrkit/cdrkit.mk
> > +++ b/package/cdrkit/cdrkit.mk
> > @@ -6,7 +6,7 @@
> >
> >  CDRKIT_VERSION = 1.1.11
> >  CDRKIT_SOURCE = cdrkit_$(CDRKIT_VERSION).orig.tar.gz
> > -CDRKIT_SITE =
> http://snapshot.debian.org/archive/debian/20101018T151929Z/pool/main/c/cdrkit/
> > +CDRKIT_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/c/cdrkit
> >  CDRKIT_DEPENDENCIES = libcap bzip2 zlib
> >  CDRKIT_LICENSE = GPLv2
> >  CDRKIT_LICENSE_FILES = COPYING
>
> Yeah, well, actually, I believe using snapshot.debian.org is a better
> idea, since it guarantees that files won't be moved. While using
> $(BR2_DEBIAN_MIRROR) means that we point to locations where tarballs
> will disappear at some point. At least, we've seen that in the past.
>
> So maybe we should rather get rid of BR2_DEBIAN_MIRROR and make sure
> all packages downloading their source from Debian use
> snapshot.debian.org instead.
>
> Thoughts?
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>



-- 

?dv,
KK
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141022/691db296/attachment.html>
