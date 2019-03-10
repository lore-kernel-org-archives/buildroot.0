From: Adrian Perez de Castro <aperez@igalia.com>
Date: Sun, 10 Mar 2019 13:25:07 +0200
Subject: [Buildroot] [PATCH 1/1] package/wpewebkit: fix host gcc >= 4.8
 check
In-Reply-To: <20190310031407.1450-1-james.hilliard1@gmail.com>
References: <20190310031407.1450-1-james.hilliard1@gmail.com>
Message-ID: <20190310132507.GB11028@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 10 Mar 2019 11:14:07 +0800, james.hilliard1 at gmail.com wrote:
> From: James Hilliard <james.hilliard1@gmail.com>
> 
> We need host gcc >= 4.8 not host gcc < 4.8.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Reviewed-by: Adrian Perez de Castro <aperez@igalia.com>

> ---
>  package/wpewebkit/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/wpewebkit/Config.in b/package/wpewebkit/Config.in
> index 64e81a95f9..04ebe5452b 100644
> --- a/package/wpewebkit/Config.in
> +++ b/package/wpewebkit/Config.in
> @@ -33,7 +33,7 @@ comment "wpewebkit needs a toolchain w/ C++, wchar, threads, dynamic library, gc
>  	depends on !BR2_BINFMT_FLAT
>  	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR \
>  		|| !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS \
> -		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || BR2_HOST_GCC_AT_LEAST_4_8
> +		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || !BR2_HOST_GCC_AT_LEAST_4_8
>  
>  comment "wpewebkit needs an OpenGL ES w/ EGL backend"
>  	depends on BR2_PACKAGE_WPEWEBKIT_ARCH_SUPPORTS
> -- 
> 2.17.1
> 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190310/a0301e4e/attachment.asc>
