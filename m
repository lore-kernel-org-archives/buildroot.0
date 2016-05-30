From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 30 May 2016 23:38:38 +0200
Subject: [Buildroot] [PATCH 1/1] gcc/libmudflap: also unavailable for
 gcc 6.x
In-Reply-To: <1464462116-28780-1-git-send-email-bernd.kuhls@t-online.de>
References: <1464462116-28780-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <fbf3f11b-79d9-7b4a-f80a-8ecc62a8dd26@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/28/16 21:01, Bernd Kuhls wrote:
> libmudflap was removed in gcc 4.9:
> https://gcc.gnu.org/wiki/Mudflap_Pointer_Debugging
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/gcc/Config.in.host | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
> index 8cf2d56..ee4d0eb 100644
> --- a/package/gcc/Config.in.host
> +++ b/package/gcc/Config.in.host
> @@ -153,6 +153,7 @@ config BR2_GCC_ENABLE_LIBMUDFLAP
>  	depends on !BR2_ARM_INSTRUCTIONS_THUMB && !BR2_powerpc_SPE
>  	depends on !BR2_GCC_VERSION_4_9_X
>  	depends on !BR2_GCC_VERSION_5_X
> +	depends on !BR2_GCC_VERSION_6_X

 Since 4.7 is deprecated and 4.8 will in a year or so, perhaps it's time to
replace this with

	depends on BR2_GCC_VERSION_4_7_X || BR2_GCC_VERSION_4_8_X

 Or even better

	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9

 That said, this patch does the trick and we want this in 2016.05, so

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout

>  	help
>  	  libmudflap is a gcc library used for the mudflap pointer
>  	  debugging functionality. It is only needed if you intend to
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
