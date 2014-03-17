From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 17 Mar 2014 07:32:32 +0100
Subject: [Buildroot] [PATCH] mtools: remove ignored configure options
In-Reply-To: <1394999237-30259-1-git-send-email-fhunleth@troodon-software.com>
References: <1394999237-30259-1-git-send-email-fhunleth@troodon-software.com>
Message-ID: <53269700.40405@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/16/14 20:47, Frank Hunleth wrote:
> The --enable-xdf, --enable-vold, and --enable-new-vold options were
> actually not being passed to ./configure since they were specified on
> the wrong variable (MTOOLS_CONF_OPT vs. HOST_MTOOLS_CONF_OPT) and mtools
> is a host-only package. Fixing the variable name so that the options are
> actually used ends up causing the build to fail due to linker errors.
> Since vold identifiers and OS/2 XDF support are unlikely to be used any
> more, remove them completely.
> 
> Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout

> ---
>  package/mtools/mtools.mk | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/package/mtools/mtools.mk b/package/mtools/mtools.mk
> index 6751059..11517df 100644
> --- a/package/mtools/mtools.mk
> +++ b/package/mtools/mtools.mk
> @@ -10,8 +10,4 @@ MTOOLS_SITE          = $(BR2_GNU_MIRROR)/mtools/
>  MTOOLS_LICENSE       = GPLv3+
>  MTOOLS_LICENSE_FILES = COPYING
>  
> -MTOOLS_CONF_OPT = --enable-xdf        \
> -                  --enable-vold       \
> -                  --enable-new-vold
> -
>  $(eval $(host-autotools-package))
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
