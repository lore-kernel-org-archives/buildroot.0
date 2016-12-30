From: Gustavo Sverzut Barbieri <barbieri@profusion.mobi>
Date: Fri, 30 Dec 2016 15:51:55 -0200
Subject: [Buildroot] [PATCH 1/2] package/efl: use "depends on" instead
 of "select" BR2_PACKAGE_EFL_WAYLAND
In-Reply-To: <20161230162250.2735-1-romain.naour@gmail.com>
References: <20161230162250.2735-1-romain.naour@gmail.com>
Message-ID: <CAPdpN3DXC8Q7H+AtD9jy2D-PvJV7tDpV+EOwCaLZ=2kHM+dApg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Dec 30, 2016 at 2:22 PM, Romain Naour <romain.naour@gmail.com> wrote:
> The efl Wayland support shouldn't selecte Wayland package itself.
> It must be an user decision, so use "depends on" instead.
>
> Signed-off-by: Romain Naour <romain.naour@gmail.com>

Reviewed-by: Gustavo Sverzut Barbieri <barbieri@profusion.mobi>

> ---
>  package/efl/Config.in | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/package/efl/Config.in b/package/efl/Config.in
> index c51fc56..f6ec579 100644
> --- a/package/efl/Config.in
> +++ b/package/efl/Config.in
> @@ -157,13 +157,14 @@ config BR2_PACKAGE_EFL_X_XLIB
>
>  config BR2_PACKAGE_EFL_WAYLAND
>         bool "Wayland support"
> +       depends on BR2_PACKAGE_WAYLAND
>         depends on BR2_TOOLCHAIN_HAS_THREADS # Evas DRM Engine -> libdrm
>         depends on BR2_PACKAGE_MESA3D_OPENGL_EGL # Evas DRM Engine
>         depends on BR2_PACKAGE_EFL_OPENGLES # OpenGL ES with EGL support only
>         select BR2_PACKAGE_EFL_DRM
> -       select BR2_PACKAGE_WAYLAND
>
>  comment "Wayland support needs OpenGL ES w/ EGL, threads"
> +       depends on BR2_PACKAGE_WAYLAND
>         depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_PACKAGE_MESA3D_OPENGL_EGL \
>                 || !BR2_PACKAGE_EFL_OPENGLES
>
> --
> 2.9.3
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 
Gustavo Sverzut Barbieri
http://profusion.mobi embedded systems
--------------------------------------
MSN, GTalk, FaceTime: barbieri at gmail.com
Skype: gsbarbieri
Mobile: +55 (16) 99354-9890
