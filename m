From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 1 Jun 2014 12:20:05 +0200
Subject: [Buildroot] [PATCH 2/2] sunxi-mali: use only -I${includedir} as
 pkg-config Cflags
In-Reply-To: <1401616242-5692-2-git-send-email-syntheticpp@gmx.net>
References: <1401616242-5692-1-git-send-email-syntheticpp@gmx.net>
 <1401616242-5692-2-git-send-email-syntheticpp@gmx.net>
Message-ID: <20140601102004.GB3430@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2014-06-01 11:50 +0200, Peter K?mmel spake thusly:
>     Using only -I${includedir} in common practice.
> 
>     Settings only -I${includedir}/GLES2 breaks Qt5's CMake files,
>     because at configure time CMake only searchs the paths reported
>     by pkg-config, and not even /usr/include is used as default.

Do not indent the commit log, please.

Also, I'd add the same blurb as for ti-gfx. BTW, adding this blurb would
clarify Peter's cncern about the change.

> Signed-off-by: Peter K?mmel <syntheticpp@gmx.net>

With the blurb added:
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/sunxi-mali/egl.pc    |    2 +-
>  package/sunxi-mali/glesv2.pc |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/sunxi-mali/egl.pc b/package/sunxi-mali/egl.pc
> index b062ad1..2823209 100644
> --- a/package/sunxi-mali/egl.pc
> +++ b/package/sunxi-mali/egl.pc
> @@ -8,5 +8,5 @@ Description: ARM Mali implementation of EGL
>  Version: 1.4
>  Requires:
>  Libs: -L${libdir} -lEGL -lGLESv2 -lUMP
> -Cflags: -I${includedir}/EGL/ -I${includedir}
> +Cflags: -I${includedir}
>  
> diff --git a/package/sunxi-mali/glesv2.pc b/package/sunxi-mali/glesv2.pc
> index 9273678..4702d13 100644
> --- a/package/sunxi-mali/glesv2.pc
> +++ b/package/sunxi-mali/glesv2.pc
> @@ -8,5 +8,5 @@ Description: ARM Mali implementation of OpenGL ESv2
>  Version: 2.0
>  Requires:
>  Libs: -L${libdir} -lGLESv2 -lGLESv1_CM -lUMP
> -Cflags: -I${includedir}/GLES2
> +Cflags: -I${includedir}
>  
> -- 
> 1.7.10.4
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
