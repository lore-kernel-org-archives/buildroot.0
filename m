From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 21 Nov 2012 10:35:21 +0200
Subject: [Buildroot] [PATCH 3/3] xtensa: disable libffi for Xtensa
In-Reply-To: <50ac8f69.6548420a.6f5c.2a1b@mx.google.com>
References: <50ac8f69.6548420a.6f5c.2a1b@mx.google.com>
Message-ID: <20121121083521.GB28785@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Chris,

On Tue, Nov 20, 2012 at 11:01:49AM -0800, Chris Zankel wrote:
> Xtensa currently doesn't support libffi.
> 
> Signed-off-by: Chris Zankel <chris@zankel.net>
> ---
>  package/libffi/Config.in |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/libffi/Config.in b/package/libffi/Config.in
> index 7211f8f..4afb669 100644
> --- a/package/libffi/Config.in
> +++ b/package/libffi/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_LIBFFI
>  	bool "libffi"
> +	depends on !BR2_xtensa
>  	help
>  	  The libffi library provides a portable, high level
>  	  programming interface to various calling conventions. This

You need to recursively propagate this 'depends' to all packages selecting 
BR2_PACKAGE_LIBFFI. This is due to a limitation of kconfig that doesn't check 
whether a package is actually selectable.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
