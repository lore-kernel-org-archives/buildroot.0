From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Apr 2014 14:37:51 +0200
Subject: [Buildroot] [PATCH] gst-fsl-plugins: Refresh one patch to fix
 build
In-Reply-To: <trinity-bbd885d6-7ec2-4851-a0d4-6d961c6437f5-1396640175600@3capp-gmx-bs34>
References: <1396604842-20049-1-git-send-email-vincent.stehle@freescale.com>
 <trinity-bbd885d6-7ec2-4851-a0d4-6d961c6437f5-1396640175600@3capp-gmx-bs34>
Message-ID: <20140406143751.6d734bcd@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Seiderer,

On Fri, 4 Apr 2014 21:36:15 +0200, Peter Seiderer wrote:

> > - libgstfsl_ at GST_MAJORMINOR@_la_CFLAGS  = $(GST_BASE_CFLAGS) $(IPU_CFLAGS) -I../inc/common
> >   libgstfsl_ at GST_MAJORMINOR@_la_LDFLAGS = -version-info @GSTMXLIBS_VERSION@
> > --libgstfsl_ at GST_MAJORMINOR@_la_LIBADD = $(GST_BASE_LIBS) -lgstvideo- at GST_MAJORMINOR@ -lgstinterfaces-$(GST_MAJORMINOR) $(IPU_LIBS)
> > -+libgstfsl_ at GST_MAJORMINOR@_la_LIBADD = $(GST_BASE_LIBS) -lgstvideo- at GST_MAJORMINOR@ -lgstinterfaces-$(GST_MAJORMINOR) $(IPU_LIBS) $(SHM_LIBS)
> > +-libgstfsl_ at GST_MAJORMINOR@_la_LIBADD = $(GST_BASE_LIBS) -lgstvideo- at GST_MAJORMINOR@ -lgstinterfaces-$(GST_MAJORMINOR) $(IPU_LIBS) $(RT_LIBS)
> > ++libgstfsl_ at GST_MAJORMINOR@_la_LIBADD = $(GST_BASE_LIBS) -lgstvideo- at GST_MAJORMINOR@ -lgstinterfaces-$(GST_MAJORMINOR) $(IPU_LIBS) $(RT_LIBS) $(SHM_LIBS)
> >   
> 
> Looks like the latest freescale version of gst-fsl-plugins already adds '-lrt' (as I guess from the name RT_LIBS)?
> If so the whole patch is obsoleted...

Then can you send a followup patch that bumps the version of
gst-fsl-plugins? Vincent patch is still fixing an actual problem with
the current Buildroot, so it made sense to apply it, until additional
patches are sent to update gst-fsl-plugins.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
