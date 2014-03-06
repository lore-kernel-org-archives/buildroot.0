From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 06 Mar 2014 18:27:41 +0100
Subject: [Buildroot] [PATCH v2 1/4] webkit: fix mmu reverse dependency
 moving it to %_ARCH_SUPPORTS
In-Reply-To: <1394098949-31981-2-git-send-email-fabio.porcedda@gmail.com>
References: <1394098949-31981-1-git-send-email-fabio.porcedda@gmail.com>
 <1394098949-31981-2-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <5318B00D.6050003@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/03/14 10:42, Fabio Porcedda wrote:
> Because mmu dependency was not propagated move it to
> BR2_PACKAGE_WEBKIT_ARCH_SUPPORTS to automatically propagate it.
> It can ben moved to BR2_PACKAGE_WEBKIT_ARCH_SUPPORTS because like
> target architecture dependencies it doesn't modify the comment string.
> 
> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

> ---
>  package/webkit/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/webkit/Config.in b/package/webkit/Config.in
> index 2b0addc..5ba2eb3 100644
> --- a/package/webkit/Config.in
> +++ b/package/webkit/Config.in
> @@ -5,6 +5,7 @@ config BR2_PACKAGE_WEBKIT_ARCH_SUPPORTS
>  		!(BR2_arm7tdmi || BR2_arm720t || BR2_arm920t || BR2_arm922t || BR2_fa526)
>  	default y if BR2_i386 || BR2_mips || BR2_mipsel || \
>  		BR2_sh || BR2_sparc || BR2_x86_64
> +	depends on BR2_USE_MMU # libgail -> pango -> libglib2
>  
>  # disabled on powerpc due to bug https://bugs.webkit.org/show_bug.cgi?id=113638
>  
> @@ -13,7 +14,6 @@ config BR2_PACKAGE_WEBKIT
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_USE_WCHAR # enchant -> libglib2
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # enchant -> libglib2
> -	depends on BR2_USE_MMU # libgail -> pango -> libglib2
>  	depends on BR2_PACKAGE_LIBGTK2
>  	depends on BR2_PACKAGE_WEBKIT_ARCH_SUPPORTS
>  	depends on !BR2_BINFMT_FLAT # icu
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
