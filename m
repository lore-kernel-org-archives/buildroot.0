From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 07 Jul 2014 08:14:40 +0200
Subject: [Buildroot] [PATCH] libnl: Move the pthread dependency menu
	comment
In-Reply-To: <1404594482-17618-1-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1404594482-17618-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Message-ID: <53BA3AD0.9040306@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/07/14 23:08, Ezequiel Garcia wrote:
> In order for this comment to be properly displayer, it must be moved to be
> at the end of the file.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout

> ---
>  package/libnl/Config.in | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/package/libnl/Config.in b/package/libnl/Config.in
> index 1173278..74a2e79 100644
> --- a/package/libnl/Config.in
> +++ b/package/libnl/Config.in
> @@ -6,9 +6,6 @@ config BR2_PACKAGE_LIBNL
>  
>  	  http://people.suug.ch/~tgr/libnl/
>  
> -comment "libnl needs a toolchain w/ threads"
> -	depends on !BR2_TOOLCHAIN_HAS_THREADS
> -
>  if BR2_PACKAGE_LIBNL
>  
>  config BR2_PACKAGE_LIBNL_TOOLS
> @@ -20,5 +17,7 @@ config BR2_PACKAGE_LIBNL_TOOLS
>  
>  comment "libnl tools need a toolchain w/ dynamic library"
>  	depends on BR2_PREFER_STATIC_LIB
> -
>  endif
> +
> +comment "libnl needs a toolchain w/ threads"
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
