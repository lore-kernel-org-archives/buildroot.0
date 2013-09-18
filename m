From: Fatih =?UTF-8?Q?A=C5=9F=C4=B1c=C4=B1?= <fatih.asici@gmail.com>
Date: Wed, 18 Sep 2013 11:36:54 +0300
Subject: [Buildroot] [PATCH] gpu-viv-bin-mx6q: add pkgconfig files for
 EGL and OpenGLESv2
In-Reply-To: <52395192.4070908@mind.be>
References: <1379416810.13187.1.camel@viko> <52395192.4070908@mind.be>
Message-ID: <1379493414.9971.6.camel@viko>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 2013-09-18 at 09:09 +0200, Arnout Vandecappelle wrote:
> On 17/09/13 13:20, Fatih A??c? wrote:
> > Signed-off-by: Fatih A??c? <fatih.asici@gmail.com>
> > ---
> >   .../gpu-viv-bin-mx6q-add-pkgconfig-files.patch     |   30 ++++++++++++++++++++
> >   1 file changed, 30 insertions(+)
> >   create mode 100644 package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q-add-pkgconfig-files.patch
> >
> > diff --git a/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q-add-pkgconfig-files.patch b/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q-add-pkgconfig-files.patch
> > new file mode 100644
> > index 0000000..8ed4ffe
> > --- /dev/null
> > +++ b/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q-add-pkgconfig-files.patch
> 
>   Personally, I would prefer to have these as plain files in the package 
> directory and copy them to staging in the INSTALL_STAGING_CMDS. But I 
> guess that's a matter of taste.
> 

OK. It will be easier with plain files.

>   If you do keep it as a patch, make sure it gets a number.
> 
> > @@ -0,0 +1,30 @@
> > +Add .pc files for the OpenGLESv2 and EGL libraries
> > +
> > +Signed-off-by: Fatih A??c? <fatih.asici@gmail.com>
> > +
> > +--- /dev/null
> > ++++ b/usr/lib/pkgconfig/egl.pc
> > +@@ -0,0 +1,10 @@
> > ++prefix=/usr
> > ++exec_prefix=${prefix}
> > ++libdir=${exec_prefix}/lib
> > ++includedir=${prefix}/include
> > ++
> > ++Name: egl
> > ++Description: Freescale gpu-viv-bin-mx6q implementation of EGL
> > ++Version: 1.0
> > ++Libs: -L${libdir} -lEGL
> 
>   I haven't double-checked, but I think that -lEGL requires -lGAL as well.

You are right.

> > ++Cflags: -I${includedir}/ -DEGL_API_FB=1
> > +--- /dev/null
> > ++++ b/usr/lib/pkgconfig/glesv2.pc
> > +@@ -0,0 +1,10 @@
> > ++prefix=/usr
> > ++exec_prefix=${prefix}
> > ++libdir=${exec_prefix}/lib
> > ++includedir=${prefix}/include
> > ++
> > ++Name: glesv2
> > ++Description: Freescale gpu-viv-bin-mx6q implementation of OpenGL ESv2
> > ++Version: 2.0
> > ++Libs: -L${libdir} -lGAL -lEGL -lGLESv2
> > ++Cflags: -I${includedir}/ -DEGL_API_FB=1
> >
> 
>   What about OpenVG?

I will add vg.pc within the next version of patch.

>   Regards,
>   Arnout

Thanks,
Fatih
