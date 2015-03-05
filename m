From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 05 Mar 2015 22:53:35 +0100
Subject: [Buildroot] [PATCH 1/2] samba: deprecate package due to EOL
In-Reply-To: <1425588249-20942-1-git-send-email-gustavo@zacarias.com.ar>
References: <1425588249-20942-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <54F8D05F.4050300@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/03/15 21:44, Gustavo Zacarias wrote:
> Samba 3.6.x is now EOL, people should move to samba4.

 What about samba support in mpd and kodi?

 Regards,
 Arnout

> 
> See: https://www.samba.org/samba/history/samba-4.2.0.html
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/samba/Config.in | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/samba/Config.in b/package/samba/Config.in
> index 9d04851..7ff8428 100644
> --- a/package/samba/Config.in
> +++ b/package/samba/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_SAMBA
>  	bool "samba"
> +	depends on BR2_DEPRECATED_SINCE_2015_05
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on BR2_USE_MMU # fork()
>  	depends on !BR2_nios2 # binary too large, relocations don't fit
> @@ -15,6 +16,7 @@ config BR2_PACKAGE_SAMBA
>  		so choose only the components you need.
>  
>  comment "samba needs a toolchain w/ threads"
> +	depends on BR2_DEPRECATED_SINCE_2015_05
>  	depends on BR2_USE_MMU
>  	depends on !BR2_TOOLCHAIN_HAS_THREADS
>  
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
