From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 26 Jun 2016 20:39:10 +0200
Subject: [Buildroot] [PATCH v3 5/5] package/enlightenment: bump to 0.20.9
In-Reply-To: <1466630866-28779-5-git-send-email-romain.naour@gmail.com>
References: <1466630866-28779-1-git-send-email-romain.naour@gmail.com>
 <1466630866-28779-5-git-send-email-romain.naour@gmail.com>
Message-ID: <dfd39299-57a5-2b62-1f71-5f9fa7326c53@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gustavo,

I tried to build enlightenment 0.20.9 with Wayland support only but there are
several issues which should be fixed with the next version (0.21)

First we need [1] since configure always check for ecore-x (X11).

Then, there is another issue with Wayland EGL cflags not forwarded correctly
(MESA_EGL_NO_X11_HEADERS not set when EGL/eglplatform.h is included)...

sysroot/usr/include/EGL/eglplatform.h:119:22: fatal error: X11/Xlib.h: No such
file or directory

So, I don't think Wayland support is ready for this version. Instead we should
wait for E 0.21 (rc1 currently).

Also, I have another series (needed for Wayland) adding OpenGL/OpenGLES support,
libdrm for DRM, and DRM + GL support. To finish, I need to add systemd support
in EFL and E.
But this bump series must be commited before sending it ;)

Did you already tested Wayland/Weston with systemd?
Have you a working Buildroot configuration?

Thanks,
Best regards,
Romain

[1]
https://git.enlightenment.org/core/enlightenment.git/commit/?id=a5a27dee14839ed38b078126557cf4c20f1e6b98


Le 22/06/2016 ? 23:27, Romain Naour a ?crit :
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
> v2: bump to 0.20.9
> ---
>  package/enlightenment/enlightenment.hash | 4 ++--
>  package/enlightenment/enlightenment.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/enlightenment/enlightenment.hash b/package/enlightenment/enlightenment.hash
> index 66bdb49..fad14b7 100644
> --- a/package/enlightenment/enlightenment.hash
> +++ b/package/enlightenment/enlightenment.hash
> @@ -1,2 +1,2 @@
> -# From https://phab.enlightenment.org/phame/live/3/post/e19_14_release/
> -sha256	8906e762f0d953752bfe002663280a855da9bb74acf613424c517b78a8dde407	enlightenment-0.19.14.tar.xz
> +# From https://www.enlightenment.org/news/e-0.20.9-release
> +sha256	db792ad4d97b2523ff0bfc2c911bb3fea4b1eda60400871f4b78bc3ae2f1d1be 	enlightenment-0.20.9.tar.xz
> diff --git a/package/enlightenment/enlightenment.mk b/package/enlightenment/enlightenment.mk
> index a756361..6fe8f45 100644
> --- a/package/enlightenment/enlightenment.mk
> +++ b/package/enlightenment/enlightenment.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -ENLIGHTENMENT_VERSION = 0.19.14
> +ENLIGHTENMENT_VERSION = 0.20.9
>  ENLIGHTENMENT_SOURCE = enlightenment-$(ENLIGHTENMENT_VERSION).tar.xz
>  ENLIGHTENMENT_SITE = http://download.enlightenment.org/rel/apps/enlightenment
>  ENLIGHTENMENT_LICENSE = BSD-2c
> 
