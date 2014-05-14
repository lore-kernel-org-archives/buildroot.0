From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 15 May 2014 00:15:37 +0200
Subject: [Buildroot] [PATCH] package/cairo: uses fork(),
	so requires an MMU
In-Reply-To: <1400104601-31625-1-git-send-email-yann.morin.1998@free.fr>
References: <1400104601-31625-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20140514221537.GC3495@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2014-05-14 23:56 +0200, Yann E. MORIN spake thusly:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> Fixes:
>     http://autobuild.buildroot.net/results/038/038371cc8548b3d39d8174289bedc9aae4076303/

Also fixes:
    http://autobuild.buildroot.net/results/d93/d9374c1bd08eae5db60e6939ce5e9e4c8ff8cbd5/
    http://autobuild.buildroot.net/results/574/5746e7e3b2bc36f31dee1acf71e59dc4d6c90af2/
    http://autobuild.buildroot.net/results/b66/b66d7125ea7e10313221462097ae6c22ede963e5/
    [...]

> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/cairo/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/cairo/Config.in b/package/cairo/Config.in
> index 0c87a29..2742855 100644
> --- a/package/cairo/Config.in
> +++ b/package/cairo/Config.in
> @@ -4,6 +4,7 @@ config BR2_PACKAGE_CAIRO
>  	select BR2_PACKAGE_FONTCONFIG
>  	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7
>  	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_XORG7
> +	depends on BR2_USE_MMU # fork()
>  	help
>  	  Cairo is a 2D graphics library with support for multiple
>  	  output devices. Currently supported output targets include
> -- 
> 1.8.3.2
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
