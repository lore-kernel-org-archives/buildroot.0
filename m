From: Marco Trapanese <marcotrapanese@gmail.com>
Date: Sat, 21 Jun 2014 13:04:14 +0200
Subject: [Buildroot] Help about gstreamer h264 in buildroot
In-Reply-To: <20140614141451.6780163c@free-electrons.com>
References: <539C13BA.5000106@gmail.com>
 <20140614141451.6780163c@free-electrons.com>
Message-ID: <53A566AE.7020800@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Il 14/06/2014 14:14, Thomas Petazzoni ha scritto:
> I tried building your configuration, and here it fails with a different
> issue:
>
> .obj/qeglfshooks_pi.o: In function `QEglFSPiHooks::destroyNativeWindow(void*)':
> qeglfshooks_pi.cpp:(.text+0x2c): undefined reference to `vc_dispmanx_update_start'
> qeglfshooks_pi.cpp:(.text+0x38): undefined reference to `vc_dispmanx_element_remove'
> qeglfshooks_pi.cpp:(.text+0x40): undefined reference to `vc_dispmanx_update_submit_sync'
> .obj/qeglfshooks_pi.o: In function `QEglFSPiHooks::platformDestroy()':
> qeglfshooks_pi.cpp:(.text+0x90): undefined reference to `vc_dispmanx_display_close'
> .obj/qeglfshooks_pi.o: In function `QEglFSPiHooks::platformDisplay() const':
> qeglfshooks_pi.cpp:(.text+0xa0): undefined reference to `vc_dispmanx_display_open'
> .obj/qeglfshooks_pi.o: In function `QEglFSPiHooks::createNativeWindow(QPlatformWindow*, QSize const&, QSurfaceFormat const&)':
> qeglfshooks_pi.cpp:(.text+0x10c): undefined reference to `vc_dispmanx_update_start'
> qeglfshooks_pi.cpp:(.text+0x15c): undefined reference to `vc_dispmanx_element_add'
> qeglfshooks_pi.cpp:(.text+0x168): undefined reference to `vc_dispmanx_update_submit_sync'
> collect2: error: ld returned 1 exit status
>
> That's an issue with the RPi OpenGL implementation, I think we have had
> a couple of similar failures in the autobuilders. Maxime, Yann, any
> suggestion?



Hi Thomas, after fixing the gst-ffmpeg issue thanks to Arnout 
Vandecappelle, I'm still trying to compile buildroot and now I'm facing 
the problem you reported above.

Do you confirm this doesn't work?

I'm very confused how to skip around all those bugs in order to have a 
functional buildroot environment.

Marco
