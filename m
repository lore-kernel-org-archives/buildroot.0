From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Fri, 3 Jan 2020 17:43:07 +0100
Subject: [Buildroot] [PATCH 10/11] support/scripts/pkg-stats: add
 package count to stats
In-Reply-To: <20200103163503.13e7318e@windsurf>
References: <20200103151849.10956-1-heiko.thiery@gmail.com>
 <20200103151849.10956-11-heiko.thiery@gmail.com>
 <20200103163503.13e7318e@windsurf>
Message-ID: <CAEyMn7aMGcqrUZXD=ES5+KAQzfv6juWB6aNnD2kxiHM+zp-65w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Fr., 3. Jan. 2020 um 16:35 Uhr schrieb Thomas Petazzoni
<thomas.petazzoni@bootlin.com>:
>
> On Fri,  3 Jan 2020 16:18:47 +0100
> Heiko Thiery <heiko.thiery@gmail.com> wrote:
>
> > Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> > ---
> >  support/scripts/pkg-stats | 11 +++++++----
> >  1 file changed, 7 insertions(+), 4 deletions(-)
> >
> > diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
> > index dd3c6566a0..afd9cacafb 100755
> > --- a/support/scripts/pkg-stats
> > +++ b/support/scripts/pkg-stats
> > @@ -457,21 +457,22 @@ def check_package_latest_version(packages):
> >          pkg.rm_version['version'] == pkg.current_version
> >
> >          if pkg.rm_version['status'] == RM_API_STATUS_ERROR:
> > -            pkg.status['version'] = ('warning', 'rm api error')
> > +            pkg.status['version'] = ('warning', 'RM API error')
> >          elif pkg.rm_version['status'] == RM_API_STATUS_NOT_FOUND:
> > -            pkg.status['version'] = ('warning', 'rm package not found')
> > +            pkg.status['version'] = ('warning', 'RM package not found')
> >
> >          if pkg.rm_version['version'] is None:
> >              pkg.status['version'] = ('warning', 'no upstream version available')
> >          elif pkg.rm_version['version'] != pkg.current_version:
> > -            pkg.status['version'] = ('error', 'package needs update')
> > +            pkg.status['version'] = ('error', 'Package needs update')
> >          else:
> > -            pkg.status['version'] = ('ok', 'up-to-date')
> > +            pkg.status['version'] = ('ok', 'update-to-date')
> >      del http_pool
>
> The change up to here is not related to the commit title.

there I made a mistake

> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
