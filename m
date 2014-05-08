From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Thu, 8 May 2014 10:25:29 +0200
Subject: [Buildroot] [PATCH v5 00/32] xbmc: bump version to 13.0-Gotham
In-Reply-To: <1399493406-7247-1-git-send-email-bernd.kuhls@t-online.de>
References: <1399493406-7247-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <CAGduivxVEQFqDVX9uH-cM=GyW26okJrcr84_phGzEgkcnH2NcA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd, all,

Thanks a lot for this.

A note though, XBMC Gotham doesn't actually work well with the
RaspberryPi when built with Buildroot, they are a few quirks that need
to be ironed out.
I will send two patches for libcec in order to fix a few of them.

But there are still one issue that is troubling me, there's an assert
from the rpi-userland code that fires when XBMC tries to display some
thumbnails, or when you go into Settings, the assert speak for itself:
assertion failure:[...]/rpi-userland-a59842a068cbd19e262701f30014499e9070fbf6/interface/khronos/egl/egl_client_surface.c:331:egl_surface_create():width
> 0 && height > 0

And Yann has a weird error that I don't have that the TexturePacker
doesn't seem to build correctly it's textures.xbt (which is the binary
blob packing all the GUI elements).

On Wed, May 7, 2014 at 10:09 PM, Bernd Kuhls <bernd.kuhls@t-online.de> wrote:
> Hi,
>
> the patch series combines my latest patches to bump xbmc.
> It also adds uClibc support to xbmc, a mesa3d version bump
> and several new packages to support the new xbmc release
> along with libva to get the best out of Intel systems.
>
> Regards, Bernd
>
>
> Bernd Kuhls (32):
>   xproto_dri3proto: New package
>   mesa3d: Bump version to 10.2-rc1
>   mesa3d: use --enable-shared-glapi also for Gallium drivers
>   mesa3d: Fix gbm related compile error
>   mesa3d: Depend on xorg meta package instead of xserver_xorg-server
>   mesa3d: Remove dependency for the libxml2 module of host-python
>   mesa3d: Add patch note about upstream bug
>   mesa3d: Add dri3 support
>   mesa3d: dri2 does not need udev support
>   libva: new package
>   libva-intel-driver: new package
>   ffmpeg: Add libva support
>   libglu: new package
>   libglew: new package
>   sdl: Add new dependency libglu for opengl support
>   xdriver_xf86-video-intel: Bump version to 2.99.911
>   rtmpdump: Add KSV patch
>   xbmc: bump version to 13.0
>   xbmc-pvr-addons: Version bump to xbmc Gotham-compatible addon
>   xbmc-addon-xvdr: Version bump to xbmc Gotham-compatible addon
>   xbmc: Add host-gettext dependency
>   xbmc: Allow compilation with uClibc
>   xbmc: fix arm/uclibc compilation
>   xbmc: Add X.org/OpenGL support
>   xbmc: Add VA-API support
>   xbmc: Add alsa support
>   xbmc: Add lame support
>   xbmc: Disable broken rsxs screensaver
>   xbmc: Add option for Goom screensaver
>   xbmc: add nasm/yasm dependency
>   xbmc: Fix ffmpeg cross compile
>   xbmc: Fix TexturePacker compile
>
>  package/libdrm/Config.in                           |    1 -
>  .../xlib_libXpm/xlib_libXpm-0001-detect-fork.patch |   66 --------------------
>  package/x11r7/xlib_libXpm/xlib_libXpm.mk           |    1 -
>  3 files changed, 68 deletions(-)
>  delete mode 100644 package/x11r7/xlib_libXpm/xlib_libXpm-0001-detect-fork.patch
>
> --
> 1.7.10.4
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
