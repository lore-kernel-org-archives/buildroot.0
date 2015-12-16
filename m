From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 16 Dec 2015 23:23:58 +0100
Subject: [Buildroot] [PATCH 03/13 v2] core/legal-info: use the macro to
 install source archives
In-Reply-To: <6b0e6c050f742b793b551e95b122d791b7477513.1450031251.git.yann.morin.1998@free.fr>
References: <cover.1450031251.git.yann.morin.1998@free.fr>
 <6b0e6c050f742b793b551e95b122d791b7477513.1450031251.git.yann.morin.1998@free.fr>
Message-ID: <5671E47E.2010709@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13-12-15 19:35, Yann E. MORIN wrote:
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Luca Ceresoli <luca@lucaceresoli.net>
> Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
> Tested-by: Luca Ceresoli <luca@lucaceresoli.net>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 There's a small functional change here as well: @ -> $Q

 Regards,
 Arnout

> ---
>  package/pkg-generic.mk | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 357a5c7..e69c970 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -805,9 +805,10 @@ ifeq ($$($(2)_REDISTRIBUTE),YES)
>  ifneq ($$($(2)_ACTUAL_SOURCE_TARBALL),$$($(2)_SOURCE))
>  	$$(call DOWNLOAD,$$($(2)_ACTUAL_SOURCE_SITE)/$$($(2)_ACTUAL_SOURCE_TARBALL))
>  endif
> -# Copy the source tarball (just hardlink if possible)
> -	@cp -l $$(DL_DIR)/$$($(2)_ACTUAL_SOURCE_TARBALL) $$(REDIST_SOURCES_DIR_$$(call UPPERCASE,$(4))) 2>/dev/null || \
> -	    cp $$(DL_DIR)/$$($(2)_ACTUAL_SOURCE_TARBALL) $$(REDIST_SOURCES_DIR_$$(call UPPERCASE,$(4)))
> +# Copy the source tarball
> +	$$(Q)$$(call hardlink-copy,\
> +		     $$(DL_DIR)/$$($(2)_ACTUAL_SOURCE_TARBALL),\
> +		     $$(REDIST_SOURCES_DIR_$$(call UPPERCASE,$(4))))
>  endif # redistribute
>  
>  endif # other packages
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
