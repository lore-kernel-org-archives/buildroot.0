From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 30 Jan 2014 08:05:09 +0100
Subject: [Buildroot] [PATCH] Config: default BR2_PACKAGE_OVERRIDE_FILE
 to $(CONFIG_DIR)/local.mk
In-Reply-To: <1391032104-18150-1-git-send-email-yann.morin.1998@free.fr>
References: <1391032104-18150-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <52E9F9A5.9030704@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 29/01/14 22:48, Yann E. MORIN wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> The current default for BR2_PACKAGE_OVERRIDE_FILE points to:
>      $(TOPDIR)/local.mk
>
> This works well for in-tree builds, but is not very useful for
> out-of-tree builds, when the Buildroot source tree may be shared for
> different concurrent builds.
>
> Also, it seems to be more sensible to have local.mk alognside
> the .config file.
>
> Hence, change the default for BR2_PACKAGE_OVERRIDE_FILE to point to:
>      $(CONFIG_DIR)/local.mk
>
> Note that this does not change the current behaviour for in-tree
> builds, since in that case $(CONFIG_DIR) == $(TOPDIR).
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>

  I was doubtful about this one at first, because the output directory is 
something that should be easily thrown away. But then, so is the override 
file - especially now we have BR2_EXTERNAL for overrides that are 
persistent. Therefore:

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


  Regards,
  Arnout

> ---
>   Config.in | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Config.in b/Config.in
> index 7ec7c2a..f8d6e23 100644
> --- a/Config.in
> +++ b/Config.in
> @@ -488,7 +488,7 @@ config BR2_HAVE_DOCUMENTATION
>
>   config BR2_PACKAGE_OVERRIDE_FILE
>   	string "location of a package override file"
> -	default "$(TOPDIR)/local.mk"
> +	default "$(CONFIG_DIR)/local.mk"
>   	help
>   	  A package override file is a short makefile that contains
>   	  variable definitions of the form <pkg>_OVERRIDE_SRCDIR,
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
