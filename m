From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 26 Jun 2019 10:50:04 -0600
Subject: [Buildroot] [PATCH 1/1] package/weston-imx: Split weston-imx
 off from weston
In-Reply-To: <20190626162452.GA12049@t450s.lan>
References: <20190625225008.58056-1-james.hilliard1@gmail.com>
 <20190626035847.jcsq7ulueclcmax3@sapphire.tkos.co.il>
 <CADvTj4r9oO=KdternzH6hRnXW7m14KJgzzFYx+65dP=5F8Kvqg@mail.gmail.com>
 <20190626162452.GA12049@t450s.lan>
Message-ID: <CADvTj4qz3yDJ5Rz2LBojVWaaaNneht+-WFtYFhrBsZOsKTQ7AQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jun 26, 2019 at 10:25 AM Gary Bisson <bisson.gary@gmail.com> wrote:
>
> Hi James, Baruch,
>
> On Tue, Jun 25, 2019 at 10:34:34PM -0600, James Hilliard wrote:
> > On Tue, Jun 25, 2019, 9:58 PM Baruch Siach <baruch@tkos.co.il> wrote:
> >
> > > Hi James,
> > >
> > > Adding Garry to Cc.
> > >
> > > On Tue, Jun 25, 2019 at 04:50:08PM -0600, James Hilliard wrote:
> > > > This is in preparation for migration of weston to the meson build system.
> > > > Since weston-imx is based off of a much older version of weston it is
> > > > difficult to maintain as part of the weston package.
> > >
> > > It might be easier to bump weston-imx to rel_imx_4.19.35_1.0.0 which is
> > > based
> > > on upstream version 6.0.0.
> > >
> > From what I could tell the imx features were only set up for autotools for
> > that version as well.
>
> Don't know much about meson to be honest but NXP patches indeed only
> change configure.ac and not meson_options.txt.
>
> If the switch to meson is happening now, yes I guess the NXP fork will
> have to be split.
>
> Also note that any update to the weston-imx version will imply using the
> NXP-forked version of wayland-protocols as well [1] :(
It doesn't look like we've been using the wayland-protocols-imx fork
at all. Shouldn't the
upstream version for wayland-protocols work?
>
> Regards,
> Gary
>
> [1] https://source.codeaurora.org/external/imx/wayland-protocols-imx/log/?h=rel_imx_4.14.98_2.0.0_ga
