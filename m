From: Carsten Schoenert <c.schoenert@gmail.com>
Date: Sun, 10 Mar 2013 13:34:58 +0100
Subject: [Buildroot] [PATCH 1/4] directfb: bumping version to 1.6.3
In-Reply-To: <20130310113224.4e3dbb2a@skate>
References: <1362908858-6340-1-git-send-email-c.schoenert@gmail.com>
 <1362908858-6340-2-git-send-email-c.schoenert@gmail.com>
 <20130310113224.4e3dbb2a@skate>
Message-ID: <513C7DF2.9090005@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Am 10.03.2013 11:32, schrieb Thomas Petazzoni:
> This looks good. However, we have a number of packages that depend or
> can use DirectFB: cairo, directfb-examples, libecore, libevas, libgtk2,
> links, lite, gst-plugins-bad, opencv, qt, sawman, sdl, webkit. Did you
> test if those still build after this DirectFB bump? I have no idea if
> the DirectFB bump from 1.4.x to 1.6.x is a major bump (like with API
> breakage) or a minor bump. Depending on that, some testing of the
> packages using DirectFB would be needed, or not.

Ah yes, good point! I'll pick up some of these packages an will do some
tests.
But I have to look once again to the config of directfb itself, I think
there will have changed some configure options between this different
versions of directfb. This point comes right now in mind.

> Note that we don't necessarily require all those packages to continue
> to build with DirectFB 1.6.x: if those packages haven't adapted to the
> new DirectFB versions, then it's an upstream problem. However, if some
> of those packages don't build, it would be good to update their
> Config.in to ensure that the DirectFB variant is no longer offered/used.

Indeed, there will hopefully be not to much packages affected. It
depends a little bit on the test locally or done by the autobuilders.

> Also, do just a reasonable amount of testing: our autobuilders will
> anyway do a global testing of many combinations. But it's good to at
> least check a few packages. If they work fine with the DirectFB bump,
> then it's a good indication that the DirectFB bump probably didn't
> introduce too much API breakage.

That's good, I can here just check the build with my arm toolchain. ;)

O.k. now I need some time to readjust the patchset, thanks for your
suggestions!

Regards
Carsten
