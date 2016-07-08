From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <fperrad@gmail.com>
Date: Fri, 8 Jul 2016 11:50:08 +0200
Subject: [Buildroot] [PATCH] tekui: relax dynamic library dependency
In-Reply-To: <1467910890-16574-1-git-send-email-francois.perrad@gadz.org>
References: <1467910890-16574-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <CAGhdn57MXZR2r_9+9-rGwbxHJuKPOhtjZtff8NM5H1yMQfSOcQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Forget this patch.

TekUI requires dynamic library.

Fran?ois

2016-07-07 19:01 GMT+02:00 Francois Perrad <fperrad@gmail.com>:

> tekui doesn't really require these Lua modules.
> These modules are added because they increase the user experience with
> demo/examples.
>
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/tekui/Config.in | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)
>
> diff --git a/package/tekui/Config.in b/package/tekui/Config.in
> index 1203667..5f461ec 100644
> --- a/package/tekui/Config.in
> +++ b/package/tekui/Config.in
> @@ -1,11 +1,10 @@
>  config BR2_PACKAGE_TEKUI
>         bool "tekui"
>         select BR2_PACKAGE_FREETYPE
> -       select BR2_PACKAGE_LUAFILESYSTEM        # runtime only
> -       select BR2_PACKAGE_LUAEXPAT             # runtime only
> -       select BR2_PACKAGE_LUASOCKET            # runtime only
> -       select BR2_PACKAGE_LUAPOSIX             # runtime only
> -       depends on !BR2_STATIC_LIBS
> +       select BR2_PACKAGE_LUAFILESYSTEM if !BR2_STATIC_LIBS    # runtime
> only (demo/examples)
> +       select BR2_PACKAGE_LUAEXPAT if !BR2_STATIC_LIBS         # runtime
> only (demo/examples)
> +       select BR2_PACKAGE_LUASOCKET if !BR2_STATIC_LIBS                #
> runtime only (demo/examples)
> +       select BR2_PACKAGE_LUAPOSIX if !BR2_STATIC_LIBS         # runtime
> only (demo/examples)
>         depends on BR2_PACKAGE_HAS_LUAINTERPRETER
>         depends on BR2_TOOLCHAIN_HAS_THREADS
>         help
> @@ -16,6 +15,5 @@ config BR2_PACKAGE_TEKUI
>
>           http://tekui.neoscientists.org/
>
> -comment "tekui needs a Lua interpreter and a toolchain w/ threads,
> dynamic library"
> -       depends on !BR2_PACKAGE_HAS_LUAINTERPRETER ||
> !BR2_TOOLCHAIN_HAS_THREADS || \
> -               BR2_STATIC_LIBS
> +comment "tekui needs a Lua interpreter and a toolchain w/ threads"
> +       depends on !BR2_PACKAGE_HAS_LUAINTERPRETER ||
> !BR2_TOOLCHAIN_HAS_THREADS
> --
> 2.7.4
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160708/48e6aa8d/attachment.html>
