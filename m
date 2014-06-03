From: =?UTF-8?B?UGV0ZXIgS8O8bW1lbA==?= <syntheticpp@gmx.net>
Date: Tue, 03 Jun 2014 06:54:21 +0200
Subject: [Buildroot] [PATCH 2/2] sunxi-mali: use only -I${includedir} as
 pkg-config Cflags
In-Reply-To: <1401617908-6489-2-git-send-email-syntheticpp@gmx.net>
References: <1401617908-6489-1-git-send-email-syntheticpp@gmx.net>
 <1401617908-6489-2-git-send-email-syntheticpp@gmx.net>
Message-ID: <538D54FD.8070900@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Any reason why this is not committed?

On 01.06.2014 12:18, Peter K?mmel wrote:
> Using only -I${includedir} in common practice.
>
> Settings only -I${includedir}/GLES2 breaks Qt5's CMake files,
> because at configure time CMake only searchs the paths reported
> by pkg-config, and not even /usr/include is used as default.
>
> Even though pkg-config strips out standard include path, that's not
> the case with pkgconf (which we are using) in cross-compilation,
> which correctly reports the /usr/include dir prefixed with the
> sysroot.
>
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Signed-off-by: Peter K?mmel <syntheticpp@gmx.net>
> ---
>   package/sunxi-mali/egl.pc    |    2 +-
>   package/sunxi-mali/glesv2.pc |    2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/sunxi-mali/egl.pc b/package/sunxi-mali/egl.pc
> index b062ad1..2823209 100644
> --- a/package/sunxi-mali/egl.pc
> +++ b/package/sunxi-mali/egl.pc
> @@ -8,5 +8,5 @@ Description: ARM Mali implementation of EGL
>   Version: 1.4
>   Requires:
>   Libs: -L${libdir} -lEGL -lGLESv2 -lUMP
> -Cflags: -I${includedir}/EGL/ -I${includedir}
> +Cflags: -I${includedir}
>
> diff --git a/package/sunxi-mali/glesv2.pc b/package/sunxi-mali/glesv2.pc
> index 9273678..4702d13 100644
> --- a/package/sunxi-mali/glesv2.pc
> +++ b/package/sunxi-mali/glesv2.pc
> @@ -8,5 +8,5 @@ Description: ARM Mali implementation of OpenGL ESv2
>   Version: 2.0
>   Requires:
>   Libs: -L${libdir} -lGLESv2 -lGLESv1_CM -lUMP
> -Cflags: -I${includedir}/GLES2
> +Cflags: -I${includedir}
>
>
