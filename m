From: Carsten Schoenert <c.schoenert@gmail.com>
Date: Sun, 10 Mar 2013 17:50:37 +0100
Subject: [Buildroot] [PATCH 1/4] directfb: bumping version to 1.6.3
In-Reply-To: <20130310113224.4e3dbb2a@skate>
References: <1362908858-6340-1-git-send-email-c.schoenert@gmail.com>
 <1362908858-6340-2-git-send-email-c.schoenert@gmail.com>
 <20130310113224.4e3dbb2a@skate>
Message-ID: <513CB9DD.2050103@googlemail.com>
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

I have greped which packages depending direct on the directfb package,
this aren't much, I was a little bit surprised and suspected more packages.

> $ git grep -n "depends on BR2_PACKAGE_DIRECTFB"
> package/directfb-examples/Config.in:3:  depends on BR2_PACKAGE_DIRECTFB
> ... # more hits on directfb-exables

I tested the directfb-examples, this package has to be bumped. This I
have successful tested and prepared three patches here.

> package/divine/Config.in:3:       depends on BR2_PACKAGE_DIRECTFB

Already done in one of my previous patches.

> package/efl/libecore/Config.in:15:      depends on BR2_PACKAGE_DIRECTFB

Successful builded.

> package/efl/libevas/Config.in:56:       depends on BR2_PACKAGE_DIRECTFB

Successful builded with most of the options (expect OpenGL related stuff).

> package/lite/Config.in:3:       depends on BR2_PACKAGE_DIRECTFB

Works perfect, the version is still the current version.

> package/qt/Config.gfx.in:23:    depends on BR2_PACKAGE_DIRECTFB

This I will not test, to big the QT beast. :)

> package/sawman/Config.in:3:     depends on BR2_PACKAGE_DIRECTFB

Sawan must also bumped to the current version, locally successful done
and builded. Also prepared a patch.

> package/sdl/Config.in:18:       depends on BR2_PACKAGE_DIRECTFB

SDL works successful with the new directfb version.

In summary it looks good.
So hopefully I will post later a new patch series.

Regards
Carsten
