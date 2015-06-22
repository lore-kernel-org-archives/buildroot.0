From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 22 Jun 2015 21:47:30 +0200
Subject: [Buildroot] [PATCH v2] gst1-plugins-bad: add support for opengl
In-Reply-To: <1432824294-23759-1-git-send-email-benoit@wsystem.com>
 (=?utf-8?Q?=22Beno=C3=AEt=09Th=C3=A9baudeau=22's?= message of "Thu, 28 May
 2015 16:44:54 +0200")
References: <1432824294-23759-1-git-send-email-benoit@wsystem.com>
Message-ID: <87egl3a5kd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Beno?t" == Beno?t Th?baudeau <benoit@wsystem.com> writes:

 > Commit 83e29f2656a237e2c300d523776868837d3bc646 "gst1-plugins-bad: bump
 > version" (from 1.2.4 to 1.4.1) removed the configuration option for the
 > eglglessink plugin as a consequence of its removal in 1.3.1. However,
 > that commit did not add support for glimagesink, the plugin element to
 > be used as a replacement, which broke support for the EGL/GLES video
 > sink feature in Buildroot.

 > This new commit adds support for the OpenGL library and the
 > corresponding gl plugin, including the glimagesink element among others.

 > The plugin needs the library, but the library can also be used
 > separately in order to link custom plugins or applications against it.

 > The library needs at least one OpenGL API, one OpenGL platform and one
 > compatible window system. The implementations of these requirements that
 > Buildroot can currently provide are:
 >  - APIs: OpenGL, OpenGL ES 2.X,
 >  - platforms: GLX, EGL,
 >  - window systems: X11, Wayland, Dispmanx.

 > The wayland configure feature switch is shared between the corresponding
 > OpenGL library window system and the waylandsink plugin.

 > This has been tested with videotestsrc/omxmpeg4videodec/omxh264dec and
 > glimagesink on the Raspberry Pi, using OpenGL ES 2.X, EGL and Dispmanx.

 > Signed-off-by: Beno?t Th?baudeau <benoit@wsystem.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
