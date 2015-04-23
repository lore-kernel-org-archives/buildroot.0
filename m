From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 24 Apr 2015 00:01:15 +0200
Subject: [Buildroot] [PATCH 10/30] package/matchbox: remove superfluous
 conditional includes
In-Reply-To: <71ea29cc98ad7d3f0278f14b50837784776b12ca.1429725549.git.yann.morin.1998@free.fr>
References: <cover.1429725549.git.yann.morin.1998@free.fr>
 <71ea29cc98ad7d3f0278f14b50837784776b12ca.1429725549.git.yann.morin.1998@free.fr>
Message-ID: <55396BAB.2020206@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/22/15 20:09, Yann E. MORIN wrote:
> Now that the matchbox package no longer forcibly add entries to the
> PACKAGES list, and entirely relies on having proper packages, we can
> safely include all matchbox sub-packages .mk files, and the pkg-infra
> will take care of building only those that are enabled.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 This could already been done after patches 1 and 2.

 Regards,
 Arnout

> ---
>  package/matchbox/matchbox.mk | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/package/matchbox/matchbox.mk b/package/matchbox/matchbox.mk
> index 17d89d8..ae989b3 100644
> --- a/package/matchbox/matchbox.mk
> +++ b/package/matchbox/matchbox.mk
> @@ -1,3 +1 @@
> -ifeq ($(BR2_PACKAGE_MATCHBOX),y)
>  include $(sort $(wildcard package/matchbox/*/*.mk))
> -endif
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
