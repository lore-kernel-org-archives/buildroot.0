From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 30 Oct 2014 09:20:13 +0100
Subject: [Buildroot] [PATCH] shairport-sync: needs toolchain with NPTL
In-Reply-To: <4f23aeb270143c08f76b81f8ff30c76ea8407a4b.1414589620.git.baruch@tkos.co.il>
References: <4f23aeb270143c08f76b81f8ff30c76ea8407a4b.1414589620.git.baruch@tkos.co.il>
Message-ID: <5451F4BD.4030306@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 29/10/14 14:33, Baruch Siach wrote:
> Also remove the comment attributing threads dependency to alsa-lib, since
> shairport-sync itself uses pthreads.
> 
> Fixes:
> http://autobuild.buildroot.net/results/58e/58eafd2499919a45bfb5a2becc233d3678deedde/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> ---
>  package/shairport-sync/Config.in | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/shairport-sync/Config.in b/package/shairport-sync/Config.in
> index ce3106186fb3..c1d81a7e2a54 100644
> --- a/package/shairport-sync/Config.in
> +++ b/package/shairport-sync/Config.in
> @@ -1,7 +1,7 @@
>  config BR2_PACKAGE_SHAIRPORT_SYNC
>  	bool "shairport-sync"
>  	depends on BR2_USE_MMU # libdaemon
> -	depends on BR2_TOOLCHAIN_HAS_THREADS # alsa_lib
> +	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
>  	select BR2_PACKAGE_ALSA_LIB
>  	select BR2_PACKAGE_ALSA_LIB_MIXER
>  	select BR2_PACKAGE_LIBDAEMON
> @@ -33,6 +33,6 @@ config BR2_PACKAGE_SHAIRPORT_SYNC_LIBSOXR
>  
>  endif
>  
> -comment "shairport-sync needs a toolchain w/ threads"
> +comment "shairport-sync needs a toolchain w/ NPTL"
>  	depends on BR2_USE_MMU
> -	depends on !BR2_TOOLCHAIN_HAS_THREADS
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
