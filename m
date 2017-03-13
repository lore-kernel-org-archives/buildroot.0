From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 14 Mar 2017 00:15:46 +0100
Subject: [Buildroot] [PATCH v1 1/2] qt5base: fix eglfs x11 header
	related compile failure
In-Reply-To: <20170310221547.32158-1-ps.report@gmx.net> (Peter Seiderer's
 message of "Fri, 10 Mar 2017 23:15:46 +0100")
References: <20170310221547.32158-1-ps.report@gmx.net>
Message-ID: <87tw6wwyxp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > Add egl config and QT_EGL_NO_X11 define (as all other eglfs project
 > files do) to src/plugins/platforms/eglfs/eglfs-plugin.pro.

 > Fixes ([1]):

 >   In file included from .../host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/EGL/egl.h:39:0,
 >                    from ../../../../include/QtEglSupport/5.8.0/QtEglSupport/private/../../../../../src/platformsupport/eglconvenience/qt_egl_p.h:63,
 >                    from ../../../../include/QtEglSupport/5.8.0/QtEglSupport/private/qt_egl_p.h:1,
 >                    from api/qeglfsglobal_p.h:56,
 >                    from api/qeglfsintegration_p.h:54,
 >                    from qeglfsmain.cpp:41:
 >   .../host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/EGL/eglplatform.h:119:22: fatal error: X11/Xlib.h: No such file or directory
 >   compilation terminated.
 >   Makefile.eglfs-plugin:1024: recipe for target '.obj/qeglfsmain.o' failed
 >   make[2]: *** [.obj/qeglfsmain.o] Error 1
 >   make[2]: Leaving directory '.../qt5base-5.8.0/src/plugins/platforms/eglfs'
 >   Makefile:71: recipe for target 'sub-eglfs-plugin-pro-make_first-ordered' failed
 >   make[1]: *** [sub-eglfs-plugin-pro-make_first-ordered] Error 2

 > [1] http://lists.busybox.net/pipermail/buildroot/2017-March/186158.html

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
