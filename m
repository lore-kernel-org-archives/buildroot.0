From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 16 Apr 2020 03:38:01 -0600
Subject: [Buildroot] [PATCH 1/1] package/bitstream: update tarball URL
In-Reply-To: <CADvTj4qzg-o03A=fDoaOO75j5BJOdcPtSU5Oo-Unqwfn1cOciQ@mail.gmail.com>
References: <20200416052508.11828-1-bernd.kuhls@t-online.de>
 <20200416074413.2f833747@windsurf.home>
 <CADvTj4qzg-o03A=fDoaOO75j5BJOdcPtSU5Oo-Unqwfn1cOciQ@mail.gmail.com>
Message-ID: <CADvTj4os_y3ZFEN=qzRmi=F=pf+NoR7GPNKE7gezAsGgDq9GWA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Apr 16, 2020 at 3:26 AM James Hilliard
<james.hilliard1@gmail.com> wrote:
>
> On Wed, Apr 15, 2020 at 11:44 PM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
> >
> > On Thu, 16 Apr 2020 07:25:08 +0200
> > Bernd Kuhls <bernd.kuhls@t-online.de> wrote:
> >
> > > Use direct URL of upstream server instead of using an URL which causes
> > > redirects to, sometimes unreliable, mirror sites.
> > >
> > > Fixes:
> > > http://autobuild.buildroot.net/results/cf1/cf1f80519570fdecacfeb45ac4a3ee9725be4b0f/
> > >
> > > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> > > ---
> > >  package/bitstream/bitstream.mk | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/package/bitstream/bitstream.mk b/package/bitstream/bitstream.mk
> > > index 12124a63d3..617cb96520 100644
> > > --- a/package/bitstream/bitstream.mk
> > > +++ b/package/bitstream/bitstream.mk
> > > @@ -6,7 +6,7 @@
> > >
> > >  BITSTREAM_VERSION = 1.5
> > >  BITSTREAM_SOURCE = bitstream-$(BITSTREAM_VERSION).tar.bz2
> > > -BITSTREAM_SITE = https://get.videolan.org/bitstream/$(BITSTREAM_VERSION)
> > > +BITSTREAM_SITE = http://download.videolan.org/pub/videolan/bitstream/$(BITSTREAM_VERSION)
> >
> > But we're using get.videolan.org in a number of other packages,
> > especially VLC. Isn't that a temporary issue that doesn't require
> > changing the package ? I've reported the issue on the #videolan IRC
> > channel.
> This might be a dns issue as download.videolan.org is failing to resolve on one
> of my systems, although my autobuilder which is failing a bunch can resolve it.
>
> At the moment it probably makes sense to manually upload the package
> to buildroot's
> mirrors so that we don't get so many autobuild failures.
Oh, FYI this is probably resolved now, my autobuilder can now get the file from
get.videolan.org, may have been an internet line issue as I just briefly had the
fiber line internet connection drop out on it for a few minutes and it
works after
the connection came back seemingly.
> >
> > Thomas
> > --
> > Thomas Petazzoni, CTO, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
