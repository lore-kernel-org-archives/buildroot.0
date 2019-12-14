From: Romain Naour <romain.naour@smile.fr>
Date: Sat, 14 Dec 2019 22:55:43 +0100
Subject: [Buildroot] [PATCH 04/12] package/pkg-generic.mk: use
 extractor-pkg-dependency macro
In-Reply-To: <20191210215952.902477-5-thomas.petazzoni@bootlin.com>
References: <20191210215952.902477-1-thomas.petazzoni@bootlin.com>
 <20191210215952.902477-5-thomas.petazzoni@bootlin.com>
Message-ID: <efe749be-c7ea-9d1b-2177-bb30a2527ad0@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 10/12/2019 ? 22:59, Thomas Petazzoni a ?crit?:
> Instead of manually calculating the EXTRACT_DEPENDENCIES value based
> on the archive extension, let's use the newly introduced
> extractor-pkg-dependency macro.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Reviewed-by: Romain Naour <romain.naour@smile.fr>

Best regards,
Romain

> ---
>  package/pkg-generic.mk | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 5ad8f1d894..45a9a133bb 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -644,15 +644,7 @@ $(2)_EXTRACT_DEPENDENCIES += $$(BR2_TAR_HOST_DEPENDENCY)
>  endif
>  
>  ifeq ($$(filter host-tar host-skeleton host-xz host-lzip host-fakedate,$(1)),)
> -ifneq ($$(filter .xz .lzma,$$(suffix $$($(2)_SOURCE))),)
> -$(2)_EXTRACT_DEPENDENCIES += $$(BR2_XZCAT_HOST_DEPENDENCY)
> -endif
> -endif
> -
> -ifeq ($$(filter host-tar host-skeleton host-xz host-lzip host-fakedate,$(1)),)
> -ifneq ($$(filter .lz,$$(suffix $$($(2)_SOURCE))),)
> -$(2)_EXTRACT_DEPENDENCIES += $$(BR2_LZIP_HOST_DEPENDENCY)
> -endif
> +$(2)_EXTRACT_DEPENDENCIES += $$(call extractor-pkg-dependency,$$($(2)_SOURCE))
>  endif
>  
>  ifeq ($$(BR2_CCACHE),y)
> 
