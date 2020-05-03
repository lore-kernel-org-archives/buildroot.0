From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Sun, 3 May 2020 14:29:35 -0300
Subject: [Buildroot] [PATCH 4/4] package/supertuxkart: remove libglu
 dependency
In-Reply-To: <20200503171227.1411086-4-bernd.kuhls@t-online.de>
References: <20200503171227.1411086-1-bernd.kuhls@t-online.de>
 <20200503171227.1411086-4-bernd.kuhls@t-online.de>
Message-ID: <CAAEAJfDouRP6Ty2D33kqad38OdFfbEkWnKRcax0RY3Ogj5qnCA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 3 May 2020 at 14:12, Bernd Kuhls <bernd.kuhls@t-online.de> wrote:
>
> "The inclusion of GLU is historical. [...] It's not needed for GLEW to
>  build or run, but it's opt-out that reason. I'd recommend using
>  -DGLEW_NO_GLU since GLU is rarely seen in modern codebases nowadays."
> https://github.com/nigels-com/glew/issues/192#issuecomment-411641657
>
> Supertuxkart already uses -DGLEW_NO_GLU:
> https://github.com/supertuxkart/stk-code/blob/master/CMakeLists.txt#L224
>
> This patch only removes the dependency to libglu and depends on the
> previous patch of this series which removes glu from glew.pc.
>

LGTM. If it builds, it ships!

Thanks for the patch.

Ezequiel

> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/supertuxkart/Config.in       | 1 -
>  package/supertuxkart/supertuxkart.mk | 1 -
>  2 files changed, 2 deletions(-)
>
> diff --git a/package/supertuxkart/Config.in b/package/supertuxkart/Config.in
> index fcb27445da..e00d98d2a4 100644
> --- a/package/supertuxkart/Config.in
> +++ b/package/supertuxkart/Config.in
> @@ -16,7 +16,6 @@ config BR2_PACKAGE_SUPERTUXKART
>         select BR2_PACKAGE_LIBCURL
>         select BR2_PACKAGE_LIBFRIBIDI
>         select BR2_PACKAGE_LIBGLEW
> -       select BR2_PACKAGE_LIBGLU
>         select BR2_PACKAGE_LIBOGG
>         select BR2_PACKAGE_LIBPNG
>         select BR2_PACKAGE_LIBSQUISH
> diff --git a/package/supertuxkart/supertuxkart.mk b/package/supertuxkart/supertuxkart.mk
> index 4427ddd1ee..97cd2a40b8 100644
> --- a/package/supertuxkart/supertuxkart.mk
> +++ b/package/supertuxkart/supertuxkart.mk
> @@ -24,7 +24,6 @@ SUPERTUXKART_DEPENDENCIES = \
>         libfribidi \
>         libgl \
>         libglew \
> -       libglu \
>         libogg \
>         libpng \
>         libsquish \
> --
> 2.26.2
>
