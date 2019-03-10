From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Sun, 10 Mar 2019 11:24:41 +0100
Subject: [Buildroot] [PATCH 1/1] package/wpewebkit: fix host gcc >= 4.8
 check
In-Reply-To: <20190310031407.1450-1-james.hilliard1@gmail.com>
References: <20190310031407.1450-1-james.hilliard1@gmail.com>
Message-ID: <CAB0FRsvMRUWP6M0izqSWOQT0HRcO+VS2ZGf=j8KOkuNKPqkr7w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le dim. 10 mars 2019 ? 04:14, <james.hilliard1@gmail.com> a ?crit :

> From: James Hilliard <james.hilliard1@gmail.com>
>
> We need host gcc >= 4.8 not host gcc < 4.8.
>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>

Acked-by: Francois Perrad <francois.perrad@gadz.org>

---
>  package/wpewebkit/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/wpewebkit/Config.in b/package/wpewebkit/Config.in
> index 64e81a95f9..04ebe5452b 100644
> --- a/package/wpewebkit/Config.in
> +++ b/package/wpewebkit/Config.in
> @@ -33,7 +33,7 @@ comment "wpewebkit needs a toolchain w/ C++, wchar,
> threads, dynamic library, gc
>         depends on !BR2_BINFMT_FLAT
>         depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR \
>                 || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS \
> -               || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 ||
> BR2_HOST_GCC_AT_LEAST_4_8
> +               || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 ||
> !BR2_HOST_GCC_AT_LEAST_4_8
>
>  comment "wpewebkit needs an OpenGL ES w/ EGL backend"
>         depends on BR2_PACKAGE_WPEWEBKIT_ARCH_SUPPORTS
> --
> 2.17.1
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190310/506e8824/attachment.html>
