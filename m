From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 9 Oct 2018 22:01:23 +0200
Subject: [Buildroot] [PATCH v3 2/3] package/waffle: new package
In-Reply-To: <20180922105626.22626-2-romain.naour@gmail.com>
References: <20180922105626.22626-1-romain.naour@gmail.com>
 <20180922105626.22626-2-romain.naour@gmail.com>
Message-ID: <20181009220123.09e53085@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 22 Sep 2018 12:56:25 +0200, Romain Naour wrote:
> waffle has four "backends", each having their own dependencies.
> At least one "backend" must be enabled, otherwise Waffle will refuse to
> build. The "backends" are:
> 
>  - glx, which needs full OpenGL + x11-xcb
>  - wayland, which needs wayland-client, wayland-egl and EGL
>  - x11-egl, which needs x11-xcb and EGL
>  - gbm, which needs gbm, libudev and EGL
> 
> Backport an upstream patch fixing a build issue with musl toolchains.
> Add a new patch fixing build with Wayand without X11.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
> v3: rework waffle backends dependencies (ThomasP)
> ---
>  DEVELOPERS                                         |  1 +
>  package/Config.in                                  |  1 +
>  ...-threads-Use-PTHREAD_MUTEX_RECURSIVE-by-d.patch | 54 ++++++++++++++++++++++
>  ...rd-cflags-from-.pc-files-to-waffle-cflags.patch | 40 ++++++++++++++++
>  package/waffle/Config.in                           | 48 +++++++++++++++++++
>  package/waffle/waffle.hash                         |  3 ++
>  package/waffle/waffle.mk                           | 48 +++++++++++++++++++
>  7 files changed, 195 insertions(+)
>  create mode 100644 package/waffle/0001-third_party-threads-Use-PTHREAD_MUTEX_RECURSIVE-by-d.patch
>  create mode 100644 package/waffle/0002-cmake-forward-cflags-from-.pc-files-to-waffle-cflags.patch
>  create mode 100644 package/waffle/Config.in
>  create mode 100644 package/waffle/waffle.hash
>  create mode 100644 package/waffle/waffle.mk

I dropped the dependency on libgles, since there is no such build
requirement in waffle. And then applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
