From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 01 May 2015 22:01:06 +0200
Subject: [Buildroot] [PATCH 14/30] package/matchbox-common: fix
	dependencies
In-Reply-To: <61941d53366c32c1c804fbc705d310367fe1cc77.1429725549.git.yann.morin.1998@free.fr>
References: <cover.1429725549.git.yann.morin.1998@free.fr>
 <61941d53366c32c1c804fbc705d310367fe1cc77.1429725549.git.yann.morin.1998@free.fr>
Message-ID: <5543DB82.7030104@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22/04/15 20:09, Yann E. MORIN wrote:
> matchbox-common can be used by both matchbox-desktop and matchbox-panel,
> so it needs to depend on either, not both.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> ---
>  package/matchbox/matchbox-common/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/matchbox/matchbox-common/Config.in b/package/matchbox/matchbox-common/Config.in
> index f1c4ce3..6ec4697 100644
> --- a/package/matchbox/matchbox-common/Config.in
> +++ b/package/matchbox/matchbox-common/Config.in
> @@ -1,6 +1,6 @@
>  config BR2_PACKAGE_MATCHBOX_COMMON
>  	bool "matchbox-common"
> -	depends on BR2_PACKAGE_MATCHBOX_PANEL && BR2_PACKAGE_MATCHBOX_DESKTOP
> +	depends on BR2_PACKAGE_MATCHBOX_PANEL || BR2_PACKAGE_MATCHBOX_DESKTOP
>  	help
>  	  Common desktop folders and matchbox-session script.
>  
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
