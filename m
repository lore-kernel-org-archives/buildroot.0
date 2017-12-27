From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Dec 2017 10:52:55 +0100
Subject: [Buildroot] [PATCH 1/1] package/weston: fix build with OpenGL
 ES disabled
In-Reply-To: <20171202150123.66aabccb@windsurf.lan> (Thomas Petazzoni's
 message of "Sat, 2 Dec 2017 15:01:23 +0100")
References: <20171022180521.25751-1-bernd.kuhls@t-online.de>
 <20171202150123.66aabccb@windsurf.lan>
Message-ID: <877et8ts3s.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 > On Sun, 22 Oct 2017 20:05:21 +0200, Bernd Kuhls wrote:
 >> Building this defconfig
 >> 
 >> BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
 >> BR2_TOOLCHAIN_BUILDROOT_CXX=y
 >> BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
 >> BR2_PACKAGE_MESA3D=y
 >> BR2_PACKAGE_MESA3D_DRI_DRIVER_I965=y
 >> BR2_PACKAGE_MESA3D_OPENGL_EGL=y
 >> BR2_PACKAGE_WESTON=y
 >> BR2_PACKAGE_XORG7=y
 >> 
 >> is broken:
 >> 
 >> CC       clients/weston_simple_dmabuf_drm-simple-dmabuf-drm.o
 >> clients/simple-dmabuf-drm.c: In function 'create_display':
 >> clients/simple-dmabuf-drm.c:758:15: warning: implicit declaration of function 'eglQueryString' [-Wimplicit-function-declaration]
 >> extensions = eglQueryString(EGL_NO_DISPLAY, EGL_EXTENSIONS);
 >> ^~~~~~~~~~~~~~
 >> clients/simple-dmabuf-drm.c:758:30: error: 'EGL_NO_DISPLAY' undeclared (first use in this function)
 >> extensions = eglQueryString(EGL_NO_DISPLAY, EGL_EXTENSIONS);
 >> ^~~~~~~~~~~~~~
 >> clients/simple-dmabuf-drm.c:758:30: note: each undeclared identifier is reported only once for each function it appears in
 >> clients/simple-dmabuf-drm.c:758:46: error: 'EGL_EXTENSIONS' undeclared (first use in this function)
 >> extensions = eglQueryString(EGL_NO_DISPLAY, EGL_EXTENSIONS);
 >> ^~~~~~~~~~~~~~
 >> clients/simple-dmabuf-drm.c:759:21: warning: implicit declaration of function 'weston_check_egl_extension' [-Wimplicit-function-declaration]
 >> if (extensions && !weston_check_egl_extension(extensions,
 >> 
 >> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 >> ---
 >> package/weston/weston.mk | 1 +
 >> 1 file changed, 1 insertion(+)

Committed to 2017.11.x, thanks.

-- 
Bye, Peter Korsgaard
