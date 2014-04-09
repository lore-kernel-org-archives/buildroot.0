From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 9 Apr 2014 23:38:17 +0200
Subject: [Buildroot] [PATCH] gst-fsl-plugins: Refresh one patch to fix
 build
In-Reply-To: <20140406143751.6d734bcd@skate>
References: <1396604842-20049-1-git-send-email-vincent.stehle@freescale.com>
 <trinity-bbd885d6-7ec2-4851-a0d4-6d961c6437f5-1396640175600@3capp-gmx-bs34>,
 <20140406143751.6d734bcd@skate>
Message-ID: <trinity-3d11ce6e-cdd3-4ebd-98a9-75124c8d964c-1397079497266@3capp-gmx-bs28>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hello Thomas,

> Gesendet: Sonntag, 06. April 2014 um 14:37 Uhr
> Von: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
> An: "Peter Seiderer" <ps.report@gmx.net>
> Cc: "Vincent Stehl?" <vincent.stehle@freescale.com>, buildroot at busybox.net
> Betreff: Re: [Buildroot] [PATCH] gst-fsl-plugins: Refresh one patch to fix build
>
> Dear Peter Seiderer,
> 
> On Fri, 4 Apr 2014 21:36:15 +0200, Peter Seiderer wrote:
> 
> > > - libgstfsl_ at GST_MAJORMINOR@_la_CFLAGS  = $(GST_BASE_CFLAGS) $(IPU_CFLAGS) -I../inc/common
> > >   libgstfsl_ at GST_MAJORMINOR@_la_LDFLAGS = -version-info @GSTMXLIBS_VERSION@
> > > --libgstfsl_ at GST_MAJORMINOR@_la_LIBADD = $(GST_BASE_LIBS) -lgstvideo- at GST_MAJORMINOR@ -lgstinterfaces-$(GST_MAJORMINOR) $(IPU_LIBS)
> > > -+libgstfsl_ at GST_MAJORMINOR@_la_LIBADD = $(GST_BASE_LIBS) -lgstvideo- at GST_MAJORMINOR@ -lgstinterfaces-$(GST_MAJORMINOR) $(IPU_LIBS) $(SHM_LIBS)
> > > +-libgstfsl_ at GST_MAJORMINOR@_la_LIBADD = $(GST_BASE_LIBS) -lgstvideo- at GST_MAJORMINOR@ -lgstinterfaces-$(GST_MAJORMINOR) $(IPU_LIBS) $(RT_LIBS)
> > > ++libgstfsl_ at GST_MAJORMINOR@_la_LIBADD = $(GST_BASE_LIBS) -lgstvideo- at GST_MAJORMINOR@ -lgstinterfaces-$(GST_MAJORMINOR) $(IPU_LIBS) $(RT_LIBS) $(SHM_LIBS)
> > >   
> > 
> > Looks like the latest freescale version of gst-fsl-plugins already adds '-lrt' (as I guess from the name RT_LIBS)?
> > If so the whole patch is obsoleted...
> 
> Then can you send a followup patch that bumps the version of
> gst-fsl-plugins? Vincent patch is still fixing an actual problem with
> the current Buildroot, so it made sense to apply it, until additional
> patches are sent to update gst-fsl-plugins.
> 

....the gst-fsl-plugins version is already bumped since my patch by [1] and [2] (applied by merge [3])
from 3.0.1 to 3.5.7-1.0.0, thats the reason why the patch did not apply any more....

From the new patch context I guess the missing '-lrt' is already fixed in die gst-fsl-plugins 3.5.7-1.0.0 version? But someone else must (better: it would be nice if someone can) check, because my board is still
running with a 3.0.35 linux kernel based board support package. No (easy) chance to run the new (3.5.7
linux kernel based) freescale distribution and check the gst-fsl-plugins for runtime errors.... 

Maybe I can do a compile time check for the '-lrt' link time parameter for the plugins the next
days...

[1] http://git.buildroot.net/buildroot/commit/package/gstreamer/gst-fsl-plugins?id=0fa180aa8a0638c25a851f82658e88fbd954e5cd
[2] http://git.buildroot.net/buildroot/commit/package/gstreamer/gst-fsl-plugins?id=b0b72591d74c1a84b8c1b2e1990a2fe1dfe8c4ab
[3] http://git.buildroot.net/buildroot/commit/package/gstreamer/gst-fsl-plugins?id=b108fdcb83d457e5d43298fb93dbfd805d076f24

Regards,

Peter


> Thanks,
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>
