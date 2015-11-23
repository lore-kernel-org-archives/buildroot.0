From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 23 Nov 2015 18:18:36 +0100
Subject: [Buildroot] [PATCH 05/51] core/legal-info: use the macro to
 install source archives
In-Reply-To: <f7b80c9adbb10a7c583783eabd188a8f84e37de1.1448289515.git.yann.morin.1998@free.fr>
References: <cover.1448289515.git.yann.morin.1998@free.fr>
 <f7b80c9adbb10a7c583783eabd188a8f84e37de1.1448289515.git.yann.morin.1998@free.fr>
Message-ID: <56534A6C.3080804@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann,

Yann E. MORIN wrote:
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Luca Ceresoli <luca@lucaceresoli.net>
> ---
>   package/pkg-generic.mk | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 357a5c7..e69c970 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -805,9 +805,10 @@ ifeq ($$($(2)_REDISTRIBUTE),YES)
>   ifneq ($$($(2)_ACTUAL_SOURCE_TARBALL),$$($(2)_SOURCE))
>   	$$(call DOWNLOAD,$$($(2)_ACTUAL_SOURCE_SITE)/$$($(2)_ACTUAL_SOURCE_TARBALL))
>   endif
> -# Copy the source tarball (just hardlink if possible)
> -	@cp -l $$(DL_DIR)/$$($(2)_ACTUAL_SOURCE_TARBALL) $$(REDIST_SOURCES_DIR_$$(call UPPERCASE,$(4))) 2>/dev/null || \
> -	    cp $$(DL_DIR)/$$($(2)_ACTUAL_SOURCE_TARBALL) $$(REDIST_SOURCES_DIR_$$(call UPPERCASE,$(4)))
> +# Copy the source tarball
> +	$$(Q)$$(call hardlink-copy,\
> +		     $$(DL_DIR)/$$($(2)_ACTUAL_SOURCE_TARBALL),\
> +		     $$(REDIST_SOURCES_DIR_$$(call UPPERCASE,$(4))))

Doesn't seem to apply on next, where I guess this patch is meant to be
applied.

However I tested it on master and there I can say:

Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
Tested-by: Luca Ceresoli <luca@lucaceresoli.net>

-- 
Luca
