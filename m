From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 5 Sep 2019 18:46:44 +0200
Subject: [Buildroot] [PATCH 1/1] package/libcamera: link with atomic
 when needed
In-Reply-To: <c91b710a-60ba-d0f3-0c87-99757d49196a@ideasonboard.com>
References: <20190904184609.18560-1-fontaine.fabrice@gmail.com>
 <c91b710a-60ba-d0f3-0c87-99757d49196a@ideasonboard.com>
Message-ID: <CAPi7W80dGiVQjdzpMybbrHd-FpdwSesJ-3qZHjuf2rTrP2eGZg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Kieran,

Le mer. 4 sept. 2019 ? 21:05, Kieran Bingham
<kieran.bingham@ideasonboard.com> a ?crit :
>
> Hi Fabrice,
>
> Sounds good to me for the moment,
>
> I wonder if we should do anything with this in the upstream package.
I'll send a v2 to add an upstreamable patch instead of updating libcamera.mk.
>
> I'll leave it on my todo list to look at but I'm afraid it won't get a
> very high priority just yet.
>
> I thought I was listed to get build-failure notifications on this
> package, but I didn't get anything to notifiy me about this ?
>
> Oh well. Thanks for tackling it.
>
> On 04/09/2019 19:46, Fabrice Fontaine wrote:
> > Fixes:
> >  - http://autobuild.buildroot.org/results/1f0b8338f5f39aa86b9d432598dae2f53c5f7c84
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>
> Acked-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
>
> We've had quite a lot of updates to libcamera since this package was
> updated. I'll look to getting the version bumped again soon.
>
> > ---
> >  package/libcamera/libcamera.mk | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
> > index 62c48607d4..7a5b30ca49 100644
> > --- a/package/libcamera/libcamera.mk
> > +++ b/package/libcamera/libcamera.mk
> > @@ -15,4 +15,9 @@ LIBCAMERA_LICENSE_FILES = \
> >       licenses/gnu-gpl-2.0.txt \
> >       licenses/gnu-lgpl-2.1.txt
> >
> > +# Uses __atomic_fetch_add_4
> > +ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
> > +LIBCAMERA_LDFLAGS += -latomic
> > +endif
> > +
> >  $(eval $(meson-package))
> >
>
> --
> Regards
> --
> Kieran
Best Regards,

Fabrice
