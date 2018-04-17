From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 17 Apr 2018 19:25:03 +0200
Subject: [Buildroot] [PATCH 1/1] mpd: add mms support
In-Reply-To: <20180409111515.7669d88c@windsurf>
References: <20180407115230.22559-1-fontaine.fabrice@gmail.com>
 <20180409111515.7669d88c@windsurf>
Message-ID: <CAPi7W83n1qEf_maHrOaT-Ljv0w0ErOmHvAZmFU4UVgoJQLz6HA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

2018-04-09 11:15 GMT+02:00 Thomas Petazzoni <thomas.petazzoni@bootlin.com>:

> Hello,
>
> On Sat,  7 Apr 2018 13:52:30 +0200, Fabrice Fontaine wrote:
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> >  package/mpd/Config.in | 6 ++++++
> >  package/mpd/mpd.mk    | 7 +++++++
> >  2 files changed, 13 insertions(+)
> >
> > diff --git a/package/mpd/Config.in b/package/mpd/Config.in
> > index 6c7468e173..831e4ab0d7 100644
> > --- a/package/mpd/Config.in
> > +++ b/package/mpd/Config.in
> > @@ -180,6 +180,12 @@ config BR2_PACKAGE_MPD_CURL
> >       help
> >         Enable curl streaming (http) support.
> >
> > +config BR2_PACKAGE_MPD_LIBMMS
> > +     bool "mms"
> > +     select BR2_PACKAGE_LIBMMS
> > +     help
> > +       Enable MMS support.
>
> Shouldn't we propagate the dependencies of the libmms package ?
>
> I suppose most (all ?) of them are already covered by the
> BR2_PACKAGE_MPD option, but shouldn't we propagate them anyway, in case
> we change the dependencies of BR2_PACKAGE_MPD in the future ?
>
> Do we a clear policy on this ?
>
All libmms dependencies are already covered by mpd package.
It don't know if we have a clear policy for all packages.
However, for samba support, BR2_USE_MMU, BR2_USE_WCHAR and
BR2_TOOLCHAIN_HAS_THREADS_NPTL have not been propagated to mpd.
Same thing for jack support and BR2_USE_MMU / BR2_TOOLCHAIN_HAS_THREADS.

>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

Best Regards,

Fabrice
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180417/695ce1ae/attachment.html>
