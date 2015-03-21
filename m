From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 21 Mar 2015 18:34:09 +0100
Subject: [Buildroot] [PATCH 4/4] wine: more hostarch
In-Reply-To: <550D907F.5000106@dawncrow.de>
References: <550D907F.5000106@dawncrow.de>
Message-ID: <550DAB91.6080603@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 21/03/15 16:38, Andr? Hentschel wrote:
> The tools from host-wine build on those architectures.
> 
> Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>

 Do you also volunteer to provide an autobuilder on arm and aarch64? :-)

> ---
>  package/wine/Config.in | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/package/wine/Config.in b/package/wine/Config.in
> index 26de143..d1510e1 100644
> --- a/package/wine/Config.in
> +++ b/package/wine/Config.in
> @@ -2,7 +2,9 @@ config BR2_PACKAGE_WINE
>  	bool "wine"
>  	depends on BR2_TOOLCHAIN_USES_GLIBC
>  	# Wine only builds on certain architectures
> -	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
> +	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86" || \
> +	           BR2_HOSTARCH = "powerpc" || BR2_HOSTARCH = "arm" || \

 powerpc but not powerpc64?


 Regards,
 Arnout

> +	           BR2_HOSTARCH = "aarch64"
>  	# Wine has much CPU specific code and mostly makes sense on x86
>  	depends on BR2_i386
>  	help
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
