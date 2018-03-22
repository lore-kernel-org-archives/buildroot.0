From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 22 Mar 2018 13:30:23 +0100
Subject: [Buildroot] [PATCH v2 2/8] gst-plugins-{base, good, bad,
 ugly}: bump to 1.14
In-Reply-To: <CAFSsvmo9t+B=ardFmaFSuN3+9PohWjiK5Bm-orcLCG8dUJjZgg@mail.gmail.com>
References: <20180321134120.498-1-aduskett@gmail.com>
 <20180321134120.498-2-aduskett@gmail.com>
 <20180321200952.619ca55e@gmx.net>
 <CAFSsvmo9t+B=ardFmaFSuN3+9PohWjiK5Bm-orcLCG8dUJjZgg@mail.gmail.com>
Message-ID: <20180322133023.683b3225@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Adam,


> >>  config BR2_PACKAGE_GST1_PLUGINS_BAD_LIB_OPENGL_WAYLAND
> >>       bool "wayland"
> >>       default y  
> >
> > ...not enough removed, the wayland part also moved to gst1-plugins-base
> > (same for Config.in wayland part)...
> >  
> Not entirely! There is --enable-wayland now in both base AND bad!
> 

So your commit log lies ;-), wayland did not move from bad to base....

> >> Changes:
> >>
> >> Add the following to gst1-plugins-base and remove them from plugins-bad:
> >>  - opengl
> >>  - gles2
> >>  - glx
> >>  - egl
> >>  - x11
> >>  - wayland

I think there is a difference, the bad/wayland option enables extra gstreamer
plugins/elements, the base/wayland opton enables no extra plugins/elements but
enables wayland support in the qt/gtk plugins (did not look further if it
results only in wayland support in some elements or extra elements in the same
plugin library), in case it enables only wayland support, I think no
user visible option is needed (if a user visible option is needed there is
definitely a change in option name and help text needed)

> Adam
> 

Please do not miss the comment/suggestion below:

> >> -config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_AUDIOMIXER
> >> -     bool "audiomixer"
> >> -     help
> >> -       Audio mixer plugin
> >> -  
> >
> > ..forgot to re-add this one to gst1-plugins-base/Config.in....
> >
> > Regards,
> > Peter

Regards,
Peter
