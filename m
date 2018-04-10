From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 10 Apr 2018 23:40:19 +0200
Subject: [Buildroot] [PATCH v4 2/8] gst-plugins-${base, good, bad,
 ugly}: bump to 1.14.0
In-Reply-To: <20180410182813.691be3ff@gmx.net>
References: <20180322173220.31791-1-aduskett@gmail.com>
 <20180322173220.31791-2-aduskett@gmail.com>
 <20180322235537.261ea603@gmx.net>
 <20180410100736.2e6f8f7b@windsurf>
 <20180410182813.691be3ff@gmx.net>
Message-ID: <20180410234019.2fc5516d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

Thanks for your feedback!

On Tue, 10 Apr 2018 18:28:13 +0200, Peter Seiderer wrote:

> > Indeed, the gst1-plugins-bad package still has a
> > --enable-wayland/--disable-wayland option:
> > 
> > output/build/gst1-plugins-bad-1.14.0 $ ./configure --help | grep wayland
> >   --disable-wayland            disable wayland sink: wayland  
> 
> This is the 'old' one in gstreamer and buildroot and should be kept (NOT moved from bad to base)....

Not sure to understand what you say here. Do you say: "This option
already exists in the current version of GStreamer packaged by
Buildroot, and continues to exist in 1.14.0 and therefore should be
kept in Buildroot, i.e BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_WAYLAND
should stay.

Is that what you meant ?

> > And in base:
> > 
> > output/build/gst1-plugins-base-1.14.0 $ ./configure --help | grep wayland
> >   --enable-wayland        Enable Wayland support (requires EGL) [default=auto]  
> 
> This is the 'new' one in gstreamer, yet without handling in buildroot, enables
> wayland support in libgstgl (which is used by some plugins, but I believe not
> by the waylandsink plugin from bad)...

For this one, do you think we need an explicit
BR2_PACKAGE_GST1_PLUGINS_BASE_WAYLAND option, or should we just pass
--enable-wayland as soon as Wayland+EGL are available, in
gst1-plugins-base.mk ?


> > In gst1-plugins-base, the --enable-wayland option requires EGL support,
> > and will enable some wayland related code in gst-libs/gl/. Peter, do
> > you understand what this does, compared to the wayland sink provided in
> > gst1-plugins-bad ?  
> 
> Yes, your short analysis is right (and sorry, I can add no more details what
> is enabled/disabled in the resulting libgstgl library)....

You *can* add more details, or you *can't* ? :-)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
