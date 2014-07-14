From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 14 Jul 2014 18:39:13 +0200
Subject: [Buildroot] [PATCH 1 of 6] pkg-utils: kconfig helpers: add
	basic usage documentation
In-Reply-To: <4a53bf323d8a1808dd1b.1405338625@localhost>
References: <patchbomb.1405338624@localhost>
 <4a53bf323d8a1808dd1b.1405338625@localhost>
Message-ID: <53C407B1.1020103@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 14/07/14 13:50, Thomas De Schampheleire wrote:
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> 
> ---
>  package/pkg-utils.mk |  6 +++---
>  1 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff -r 7c17407eb26e -r 4a53bf323d8a package/pkg-utils.mk
> --- a/package/pkg-utils.mk	Sat Jul 12 14:41:41 2014 -0300
> +++ b/package/pkg-utils.mk	Wed Jul 09 20:27:38 2014 +0200
> @@ -33,17 +33,17 @@
>  # package, and more.
>  #
>  
> -define KCONFIG_ENABLE_OPT
> +define KCONFIG_ENABLE_OPT # (option, file)

 I like this pattern!

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout

>  	$(SED) "/\\<$(1)\\>/d" $(2)
>  	echo "$(1)=y" >> $(2)
>  endef
>  
> -define KCONFIG_SET_OPT
> +define KCONFIG_SET_OPT # (option, value, file)
>  	$(SED) "/\\<$(1)\\>/d" $(3)
>  	echo "$(1)=$(2)" >> $(3)
>  endef
>  
> -define KCONFIG_DISABLE_OPT
> +define KCONFIG_DISABLE_OPT # (option, file)
>  	$(SED) "/\\<$(1)\\>/d" $(2)
>  	echo "# $(1) is not set" >> $(2)
>  endef
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
