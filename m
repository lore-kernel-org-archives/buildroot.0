From: Patrick Noffke <patrick@noffke.me>
Date: Mon, 23 Jun 2014 14:43:22 -0500
Subject: [Buildroot] Qt 5.3.0 fails to build with eglfs (ti-glx) enabled,
	ARM platform (beaglebone black)
In-Reply-To: <4081522.HPB2TGLcVe@localhost.localdomain>
References: <4081522.HPB2TGLcVe@localhost.localdomain>
Message-ID: <3591081.u5CTo5tRRS@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday, June 23, 2014 02:10:50 PM Patrick Noffke wrote:
> Hello,
> 
> I'm trying to build Qt 5.3.0 within buildroot, using the ti-gfx package and
> starting with the beaglebone black defconfig.
> 
> The build fails when trying to link libQt5Widgets.5.3.0.  This page
> (https://codereview.qt-project.org/#/c/79783/) made me think I might have
> success by enabling neon, which I did by editing the qt5base-0002-mkspecs-
> files.patch file as follows:
> 
> +QMAKE_CFLAGS           += $${BR_COMPILER_CFLAGS} -mfpu=neon -march=armv7-a
> +QMAKE_CXXFLAGS         += $${BR_COMPILER_CXXFLAGS} -mfpu=neon
> -march=armv7-a +CONFIG                 += nostrip neon
> 
> but it fails the same way with or without these changes.
> 
> Has anyone else had this issue or found some way around it?  Portions of my
> build log follow.
> 

I found the problem thanks to this page (http://comments.gmane.org/gmane.linux.embedded.yocto.meta-freescale/8682).  I had to remove libQt5* from output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib.

Hope this helps someone else!

Patrick
