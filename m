From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 12 Apr 2018 21:21:55 +0200
Subject: [Buildroot] [PATCH v4 2/8] gst-plugins-${base, good, bad,
 ugly}: bump to 1.14.0
In-Reply-To: <CAFSsvmpedras9GU7sLqMn_a=w4vWi1HpcV20=7QyF1pTKAmhCw@mail.gmail.com>
References: <20180322173220.31791-1-aduskett@gmail.com>
 <20180322173220.31791-2-aduskett@gmail.com>
 <20180322235537.261ea603@gmx.net>
 <20180410100736.2e6f8f7b@windsurf>
 <20180410182813.691be3ff@gmx.net>
 <20180410234019.2fc5516d@windsurf>
 <trinity-8ea23f05-4e8a-43dd-81ad-c664a98e1d11-1523429816183@3c-app-gmx-bs59>
 <20180411113556.79d7aa32@windsurf>
 <CAFSsvmpedras9GU7sLqMn_a=w4vWi1HpcV20=7QyF1pTKAmhCw@mail.gmail.com>
Message-ID: <20180412212155.2ef3f288@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Adam, Thomas,

On Thu, 12 Apr 2018 09:41:31 -0400, Adam Duskett <aduskett@gmail.com> wrote:

> All;
> 
> On Wed, Apr 11, 2018 at 5:35 AM, Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
> > Hello,
> >
> > On Wed, 11 Apr 2018 08:56:56 +0200, Peter Seiderer wrote:
> >  
> >> > Not sure to understand what you say here. Do you say: "This option
> >> > already exists in the current version of GStreamer packaged by
> >> > Buildroot, and continues to exist in 1.14.0 and therefore should be
> >> > kept in Buildroot, i.e BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_WAYLAND
> >> > should stay.  
> >>
> >> I think the BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_WAYLAND could/should
> >> move to base, but the waylandsink enabling BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WAYLAND
> >> should stay in bad....(maybe the confusion comes from the double use of
> >> --enable-wayland option in gst1-plugins-bad enabling wayland support in
> >> libGstGl and/or enabling the waylandsink element)...
> >>
> >> From package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk:
> >>
> >> ifneq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_WAYLAND)$(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WAYLAND),)
> >> GST1_PLUGINS_BAD_CONF_OPTS += --enable-wayland
> >> GST1_PLUGINS_BAD_DEPENDENCIES += wayland wayland-protocols
> >> else
> >> GST1_PLUGINS_BAD_CONF_OPTS += --disable-wayland
> >> endif
> >>
> >>
> >> From package/gstreamer1/gst1-plugins-bad/Config.in:
> >>
> >> config BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_WAYLAND
> >>         bool "wayland"
> >>         default y
> >>         depends on BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_EGL
> >>         depends on BR2_PACKAGE_WAYLAND
> >>         select BR2_PACKAGE_WAYLAND_PROTOCOLS
> >>         select BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_HAS_WINDOW
> >> [...]
> >> config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WAYLAND
> >>         bool "wayland"
> >>         default y
> >>         depends on BR2_PACKAGE_WAYLAND
> >>         select BR2_PACKAGE_WAYLAND_PROTOCOLS
> >>         help
> >>           Wayland Video Sink
> >>
> >> I get a running waylandsink with:
> >>
> >> # BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_WAYLAND is not set
> >> BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WAYLAND=y  
> >
> > Still not sure to fully understand what you're proposing. Do you think
> > you could take over this series, make the changes that you think are
> > necessary and resubmit ? This would be useful to help the discussion
> > move forward.
> >
> > Thanks!
> >
> > Thomas
> > --
> > Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> > Embedded Linux and Kernel engineering
> > https://bootlin.com  
> I agre with Thomas here. I would really appreciate either exactly what
> you had in
> mind, or I could add what you want if you send me exactly what you
> were thinking.

Will try to prepare a draft patch version....

Regards,
Peter

> 
> Thanks!
> 
> Adam
