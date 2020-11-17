From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 17 Nov 2020 22:20:24 +0100
Subject: [Buildroot] [PATCH 0/3] libcamera: Fix and update libcamera
 package
In-Reply-To: <b172f6f0-065b-4eee-0821-b92194fed303@microchip.com>
References: <20200904095148.844292-1-kieran.bingham@ideasonboard.com>
 <b172f6f0-065b-4eee-0821-b92194fed303@microchip.com>
Message-ID: <20201117222024.55b0686f@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Eugen,

On Tue, 17 Nov 2020 17:47:37 +0000, "Eugen.Hristev--- via buildroot" <buildroot@busybox.net> wrote:

> On 04.09.2020 12:51, Kieran Bingham wrote:
> > Prevent compilation of libcamera on m68k architectures as we experience
> > build failures there, and do not currently support that target with
> > libcamera.
> >
> > Then, update the build to require C++17, in anticipation of bumping the
> > version to the latest upstream.
> >
> > Kieran Bingham (3):
> >    package/libcamera: Prevent builds on m68k
> >    package/libcamera: Update requirements for C++17
> >    package/libcamera: bump version to e59713c6
> >
> >   package/libcamera/Config.in      | 8 +++++---
> >   package/libcamera/libcamera.hash | 2 +-
> >   package/libcamera/libcamera.mk   | 2 +-
> >   3 files changed, 7 insertions(+), 5 deletions(-)
> >
> > --
> > 2.25.1
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
> >
>
> Hello Keiran,
>
> Just a small question if I am not bothering too much: Do we have a
> buildroot config option to build the gstreamer plugin for libcamera ? I
> am interested to try it out.

There is no extra libcamera package option to enable the gstreamer plugin,
but in case the prerequisites are met (BR2_PACKAGE_GSTREAMER1 and
BR2_PACKAGE_GST1_PLUGINS_BASE enabled) the plugin should be compiled
and installed, see [1]...

Regards,
Peter

[1] https://git.buildroot.net/buildroot/tree/package/libcamera/libcamera.mk#n62

>
> Thanks !
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
