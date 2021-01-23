From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 23 Jan 2021 23:52:42 +0100
Subject: [Buildroot] [PATCH 1/1] package/libtorrent-rasterbar: add CPE
 variables
In-Reply-To: <20210123234522.50b93592@windsurf.home>
References: <20210123221956.237522-1-fontaine.fabrice@gmail.com>
 <20210123234522.50b93592@windsurf.home>
Message-ID: <CAPi7W81MuOdY+yt_cJ0o-4_Dyt4WnNnMW+g0muRzL=xCBQX1-g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le sam. 23 janv. 2021 ? 23:45, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> a ?crit :
>
> On Sat, 23 Jan 2021 23:19:56 +0100
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
> > cpe:2.3:a:libtorrent:libtorrent is a valid CPE identifier for this
> > package:
> >
> >   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alibtorrent%3Alibtorrent
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> >  package/libtorrent-rasterbar/libtorrent-rasterbar.mk | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/package/libtorrent-rasterbar/libtorrent-rasterbar.mk b/package/libtorrent-rasterbar/libtorrent-rasterbar.mk
> > index de8c122520..7f60252e9b 100644
> > --- a/package/libtorrent-rasterbar/libtorrent-rasterbar.mk
> > +++ b/package/libtorrent-rasterbar/libtorrent-rasterbar.mk
> > @@ -9,6 +9,8 @@ LIBTORRENT_RASTERBAR_SITE = \
> >       https://github.com/arvidn/libtorrent/releases/download/v$(LIBTORRENT_RASTERBAR_VERSION)
> >  LIBTORRENT_RASTERBAR_LICENSE = BSD-3-Clause
> >  LIBTORRENT_RASTERBAR_LICENSE_FILES = COPYING
> > +LIBTORRENT_RASTERBAR_CPE_ID_VENDOR = libtorrent
> > +LIBTORRENT_RASTERBAR_CPE_ID_PRODUCT = libtorrent
>
> We also have package/libtorrent/ in Buildroot. How do we know for sure
> that the libtorrent:libtorrent CPE ID applies to
> package/libtorrent-rasterbar/ ? Yes indeed, the latest CPE ID known for
> libtorrent:libtorrent is 1.2.2, which is pretty close to the 1.2.12 we
> have in Buildroot for libtorrent-rasterbar. But other than that ?
Because, the NIST database contains the following information for this
CPE (https://nvd.nist.gov/products/cpe/detail/659515?namingFormat=2.3&orderBy=CPEURI&keyword=cpe%3A2.3%3Aa%3Alibtorrent%3Alibtorrent&status=FINAL):
Product http://libtorrent.org/
Version https://github.com/arvidn/libtorrent

I was not able to find libtorrent (a.k.a.
https://github.com/rakshasa/rtorrent) in the NIST database.
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
Best Regards,

Fabrice
