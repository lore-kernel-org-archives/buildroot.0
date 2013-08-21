From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 21 Aug 2013 22:51:49 +0200
Subject: [Buildroot] [PATCH 3/3] module-init-tools: remove package
In-Reply-To: <1376996742-4638-4-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1376996742-4638-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1376996742-4638-4-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <52152865.9030307@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20/08/13 13:05, Thomas Petazzoni wrote:
> This commit removes the module-init-tools package and adds the
> relevant Config.in.legacy entries to ease the migration for users.
>
> Signed-off-by: Thomas Petazzoni<thomas.petazzoni@free-electrons.com>
> ---
>   Config.in.legacy                                   | 11 +++++
>   package/Config.in                                  |  3 --
>   package/module-init-tools/Config.in                |  9 -----
>   ...nit-tools-3.15-add-manpages-config-option.patch | 47 ----------------------
>   package/module-init-tools/module-init-tools.mk     | 28 -------------
>   5 files changed, 11 insertions(+), 87 deletions(-)
>   delete mode 100644 package/module-init-tools/Config.in
>   delete mode 100644 package/module-init-tools/module-init-tools-3.15-add-manpages-config-option.patch
>   delete mode 100644 package/module-init-tools/module-init-tools.mk
>
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 763f16c..ac6f088 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -45,6 +45,17 @@ comment "build, or run, in unpredictable ways.               "
>   endif
>
>   ###############################################################################
> +comment "Legacy options removed in 2013.11"
> +
> +config BR2_PACKAGE_MODULE_INIT_TOOLS
> +	bool "module-init-tools replaced by kmod"
> +	select BR2_PACKAGE_KMOD
> +	select BR2_PACKAGE_KMOD_TOOLS

  Up to now, we've always selected BR2_LEGACY even if it is just a symbol 
rename.

> +	help
> +	  The 'module-init-tools' package has been removed, since it
> +	  has been depracated upstream and replaced by 'kmod'.

  deprecated

  Regards,
  Arnout

> +
> +###############################################################################
>   comment "Legacy options removed in 2013.08"
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
