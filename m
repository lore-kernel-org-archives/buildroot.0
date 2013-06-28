From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 28 Jun 2013 16:15:33 +0200
Subject: [Buildroot] Issue with Qt5 and PowerVR drivers
In-Reply-To: <321768C95D21724485BCE784F1BE98473EB5E16F@DBDE04.ent.ti.com>
References: <20130628143717.3e16fd9c@skate>
 <321768C95D21724485BCE784F1BE98473EB5E16F@DBDE04.ent.ti.com>
Message-ID: <20130628161533.2dea9fdf@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Prabu,

Thanks for your reply!

On Fri, 28 Jun 2013 14:03:05 +0000, Sundareson, Prabindh wrote:

> Very glad to see the video. What version of Qt5 was used ?

The 5.0.2 version, since 5.1 is still alpha (or beta?), we haven't
integrated it in Buildroot yet.

> Qt5 is quite different from Qt4, and the default eglfs port with the
> TI nullws package is a full-screen implementation, fully rendered
> with OpenGL ES2 (ie, the full screen image is a quad texture, and
> cursor is laid as a texture on top of it).

Hum, what is nullws ?

> However an application is free to generate other sized widgets and
> display them (but there are some issues as I mentioned in the Qt bug
> on eglfs). With other platform (non eglfs) implementations, and with
> a window manager in place, you can get desktop windows. The goal with
> Qt5 is to really get a touchscreen based single-screen device going
> with eglfs. If a real desktop implementation is required, better to
> go with the wayland platform plugin.

I'm not interested by multiple applications, only one application has
to run full-screen, but I'd like to see all the widgets drawn by this
application, which is not the case here.

> /etc/powervr.ini  is still used (that is referred by the GL driver
> internally).  PVR2D based powervr plugin is not used in Qt5 as it
> directly uses OpenGL ES2.  But as mentioned above, that is not the
> reason why you get a full screen view.

Yes, I still have a /etc/powervr.ini, except that it points to the
default pvr2d implementation from the PowerVR drivers (i.e
libpvrPVR2D_FRONTWSEGL.so) instead of pointing to the Qt4 specific QWS
library.

> The eglErrors in the context shown below are pending in my list of
> TODOs, and are really indicative of some of the major issues in the
> current rendering framework in Qt5 relating to eglfs. It is going to
> take some effort to push all the patches upstream.

Ok. But things are still not clear for me: is what I am seeing the
expected result with Qt5 as of today, or should I be able to see the
widgets around the OpenGL Qt logo and bubbles?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
