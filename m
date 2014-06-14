From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Jun 2014 00:34:43 +0200
Subject: [Buildroot] Help about gstreamer h264 in buildroot
In-Reply-To: <539CA77B.1050000@gmail.com>
References: <539C13BA.5000106@gmail.com>
 <20140614141451.6780163c@free-electrons.com>
 <539CA77B.1050000@gmail.com>
Message-ID: <20140615003443.1f6c8f98@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Marco Trapanese,

On Sat, 14 Jun 2014 21:50:19 +0200, Marco Trapanese wrote:

> > .obj/qeglfshooks_pi.o: In function 
> > `QEglFSPiHooks::destroyNativeWindow(void*)': 
> > qeglfshooks_pi.cpp:(.text+0x2c): undefined reference to 
> > `vc_dispmanx_update_start' qeglfshooks_pi.cpp:(.text+0x38): undefined 
> > reference to 
> 
> How is it possible?
> Shouldn't the same configuration lead to the same output?

Two possibilities:

 1/ We're not using exactly the same Buildroot version, so that might
    affect the build.

 2/ Sometimes, the host environment has some impact on the build.
    Buildroot tries to avoid this as much as possible, but the
    cross-compilation is never fully guaranteed from being isolated of
    the host machine configuration.

> > That's an issue with the RPi OpenGL implementation, I think we have 
> > had a couple of similar failures in the autobuilders. Maxime, Yann, 
> > any suggestion? Thomas 
> 
> Well, given that this currently doesn't work in buildroot, is there 
> another way to play an mp4/h264 video from Qt5?

I think we should rather fix the problems :)

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
