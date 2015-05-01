From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 01 May 2015 22:44:55 +0200
Subject: [Buildroot] [PATCH 25/30] package/matchbox-common: explicitly
 disable PDA folders when not selected
In-Reply-To: <641cee0951bdc99ad2d26f6a13373ca9c6a3892e.1429725549.git.yann.morin.1998@free.fr>
References: <cover.1429725549.git.yann.morin.1998@free.fr>
 <641cee0951bdc99ad2d26f6a13373ca9c6a3892e.1429725549.git.yann.morin.1998@free.fr>
Message-ID: <5543E5C7.5020605@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22/04/15 20:09, Yann E. MORIN wrote:
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Though for an option that is not related to a dependency I think it's less
important to explicitly disable, it's still nice to do the same thing everywhere.

 Regards,
 Arnout

> ---
>  package/matchbox/matchbox-common/matchbox-common.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/matchbox/matchbox-common/matchbox-common.mk b/package/matchbox/matchbox-common/matchbox-common.mk
> index da6bec7..038dd59 100644
> --- a/package/matchbox/matchbox-common/matchbox-common.mk
> +++ b/package/matchbox/matchbox-common/matchbox-common.mk
> @@ -14,6 +14,8 @@ MATCHBOX_COMMON_DEPENDENCIES = matchbox-lib
>  
>  ifeq ($(strip $(BR2_PACKAGE_MATCHBOX_COMMON_PDA)),y)
>  MATCHBOX_COMMON_CONF_OPTS += --enable-pda-folders
> +else
> +MATCHBOX_COMMON_CONF_OPTS += --disable-pda-folders
>  endif
>  
>  $(eval $(autotools-package))
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
