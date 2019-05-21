From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 21 May 2019 18:54:47 +0200
Subject: [Buildroot] [PATCH 1/1] package/meson: Fix linking of
 shared/static libs with static libs
In-Reply-To: <20190520204517.52564b80@windsurf.home>
References: <20190514184245.92222-1-aduskett@gmail.com>
 <20190518215637.2ea2ea51@windsurf>
 <20190520202615.37fbd048@gmx.net>
 <20190520204517.52564b80@windsurf.home>
Message-ID: <20190521185447.2de12554@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Mon, 20 May 2019 20:45:17 +0200, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Hello Peter,
>
> Thanks for your feedback!
>
> On Mon, 20 May 2019 20:26:15 +0200
> Peter Seiderer <ps.report@gmx.net> wrote:
>
> > I can confirm the patch fixes the gstreamer static build/static libs
> > problem (see [1])....
> >
> > But as it is a (not yet) upstream committed bugfix, maybe it is better to
> > wait for a upstream committ and/or next meson version bump?
>
> That would of course be the best approach...
>
> > On the other side the gstreamer folks where bored with waiting for the
> > meson fix to be accepted and committed an workaround for the problem
> > already (see [2])...
> >
> > Conclusion: Take the patch in case there is already a buildroot
> > in-tree package which needs the fix (or commit the patch with
> > in series with a in-tree user), otherwise wait for meson
> > upstream...
>
> ... however, if it starts holding off bumping too many packages, I
> guess we'll have to take this patch. Having to add a !BR2_STATIC_LIBS
> dependency to libglib2 would be really horrible, considering the number
> of reverse dependencies that libglib2 has.

As far as I know only gstreamer itself is affected (the only package
linking a static library using an internal static helper library)?
But the first other package affected by this bug justifies the
patch applied ;-)

>
> At least, if the problem is acknowledged upstream, we know it will be
> fixed at some point. Perhaps not with the exact patch we will have, but
> at least it will be fixed, which means we won't have to carry this
> patch forever.

Yes...

Regards,
Peter

>
> Thomas
