From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu, 3 Dec 2015 18:16:22 +0100
Subject: [Buildroot] [PATCH 10/51] core/legal-info: install source
 archives in their own sub-dir
In-Reply-To: <2015f01b3ecd96e43165cbb91c96bfd0ebd196ec.1448289515.git.yann.morin.1998@free.fr>
References: <cover.1448289515.git.yann.morin.1998@free.fr>
 <2015f01b3ecd96e43165cbb91c96bfd0ebd196ec.1448289515.git.yann.morin.1998@free.fr>
Message-ID: <566078E6.5080308@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

Yann E. MORIN wrote:
> Currently, we put all source archives side-by-side in the same
> directory.
>
> Since we're about to also save individual patches that were applied
> on those sources, we don't want to make that directory a complete
> mess of unassorted files.
>
> So, we install each source archive in its own sub-directory, where
> we'll later store the patches too. Store that location in a variable,
> so it can be re-used later on (to install patches in a future commit).
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Luca Ceresoli <luca@lucaceresoli.net>
> ---
>   package/pkg-generic.mk | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 98db3ba..bb3a6da 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -482,6 +482,8 @@ endif
>
>   $(2)_REDISTRIBUTE		?= YES
>
> +$(2)_REDIST_SOURCES_DIR = $$(REDIST_SOURCES_DIR_$$(call UPPERCASE,$(4)))/$$($(2)_RAWNAME)-$$($(2)_VERSION)
> +
>   # When a target package is a toolchain dependency set this variable to
>   # 'NO' so the 'toolchain' dependency is not added to prevent a circular
>   # dependency
> @@ -812,7 +814,7 @@ endif
>   # Copy the source tarball
>   	$$(Q)$$(call hardlink-copy,\
>   		     $$(DL_DIR)/$$($(2)_ACTUAL_SOURCE_TARBALL),\
> -		     $$(REDIST_SOURCES_DIR_$$(call UPPERCASE,$(4))))
> +		     $$($(2)_REDIST_SOURCES_DIR))
>   endif # redistribute
>
>   endif # other packages
>

Acked-by: Luca Ceresoli <luca@lucaceresoli.net>
Tested-by: Luca Ceresoli <luca@lucaceresoli.net>

Although this makes little sense without the further patches up to:

   [PATCH 12/51] core/apply-patches: store full path of applied patches

which are under discussion.

-- 
Luca
