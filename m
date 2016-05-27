From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 27 May 2016 13:05:36 -0300
Subject: [Buildroot] gstreamer-1.0 and egl
In-Reply-To: <63233783-a7e5-8971-7403-4f52cb5af733@gmail.com>
References: <63233783-a7e5-8971-7403-4f52cb5af733@gmail.com>
Message-ID: <57487050.4040309@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 27/05/16 12:49, Marco Trapanese wrote:

> Hello,
>
> I attach the configuration of my (dirty) Buildroot environment for RPi3,
> baseup upon 2016.05-git-01212-gabfaf47.
> In gst-1-plugins-bad I selected opengl (gles2, egl and dispmanx) and
> wayland but the opengl support is still not available:
>
>> checking for GLES2... yes
>> checking for EGL... yes
>> checking EGL/fbdev_window.h usability... no
>> checking EGL/fbdev_window.h presence... no
>> checking for EGL/fbdev_window.h... no
>> checking for bcm_host_init in -lbcm_host... yes
>> checking bcm_host.h usability... yes
>> checking bcm_host.h presence... yes
>> checking for bcm_host.h... yes
>> checking for eglGetProcAddress in -lEGL... yes
>> checking EGL/egl.h usability... yes
>> checking EGL/egl.h presence... yes
>> checking for EGL/egl.h... yes
>> checking for glEnable in -lGLESv2... yes
>> checking GLES2/gl2.h usability... yes
>> checking GLES2/gl2.h presence... yes
>> checking for GLES2/gl2.h... yes
>> checking for WAYLAND_EGL... no
>> checking libdrm/drm_fourcc.h usability... no
>> checking libdrm/drm_fourcc.h presence... no
>> checking for libdrm/drm_fourcc.h... no
>> checking for GST_ALLOCATORS... yes
>> host is arm-buildroot-linux-uclibcgnueabihf
>> configure: WARNING: X or Wayland is required for OpenGL support
>
> it's not enough to select BR2_PACKAGE_WAYLAND=y ?
> I don't find any reference to WAYLAND_EGL
> My goal is to have a suitable videosink without X, in order to use
> gstreamer as backend for Qt5Multimedia.

Hi.
wayland-egl is normally provided by open EGL implementations, such as 
mesa. It's basically small glue code into the EGL surface for wayland.
I'm not aware of closed EGL providers providing it (basically 
wayland-egl.pc and minions).
It may be possible to just hack and use the mesa bits with closed ones 
since it's pretty generic, however i've never pursued this.
Regards.
