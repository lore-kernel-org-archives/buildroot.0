From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 May 2018 14:26:46 +0200
Subject: [Buildroot] [PATCH v1] qt5wayland: fix
 hardwareintegration/client/xcomposite-egl compile
In-Reply-To: <20180519053912.8296-1-ps.report@gmx.net>
References: <20180519053912.8296-1-ps.report@gmx.net>
Message-ID: <20180519142646.7fe46677@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 19 May 2018 07:39:12 +0200, Peter Seiderer wrote:
> Add upstream patch, fixes [1]:
> 
>   ../../../hardwareintegration/client/xcomposite-egl/qwaylandxcompositeeglwindow.cpp: In member function 'void QtWaylandClient::QWaylandXCompositeEGLWindow::createEglSurface()':
>   ../../../hardwareintegration/client/xcomposite-egl/qwaylandxcompositeeglwindow.cpp:124:82: error: invalid conversion from 'Window {aka long unsigned int}' to 'EGLNativeWindowType {aka void*}' [-fpermissive]
>        m_surface = eglCreateWindowSurface(m_glxIntegration->eglDisplay(), m_config, m_xWindow,0);
>                                                                                     ^~~~~~~~~
>   In file included from ../../../hardwareintegration/client/xcomposite-egl/qwaylandxcompositeeglclientbufferintegration.h:57:0,
>                    from ../../../hardwareintegration/client/xcomposite-egl/qwaylandxcompositeeglwindow.h:46,
>                    from ../../../hardwareintegration/client/xcomposite-egl/qwaylandxcompositeeglwindow.cpp:40:
>   .../host/arm-buildroot-linux-musleabihf/sysroot/usr/include/EGL/egl.h:265:31: note:   initializing argument 3 of 'void* eglCreateWindowSurface(EGLDisplay, EGLConfig, EGLNativeWindowType, const EGLint*)'
>  EGLAPI EGLSurface EGLAPIENTRY eglCreateWindowSurface(EGLDisplay dpy, EGLConfig config,
> 
> [1] http://autobuild.buildroot.net/results/9bcc76ed9e23c0d525f20b4da7f3bb5efe3083d4
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  ...0001-Fix-compilation-for-Renesas-R-Car-M3.patch | 44 ++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 package/qt5/qt5wayland/5.10.1/0001-Fix-compilation-for-Renesas-R-Car-M3.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
