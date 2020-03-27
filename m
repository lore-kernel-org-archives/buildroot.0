From: David PIERRET <david.pierret@smile.fr>
Date: Fri, 27 Mar 2020 11:53:49 +0100
Subject: [Buildroot] [PATCH v3 06/10] package/ripgrep: depends on
 host-rustc
In-Reply-To: <20200207180829.165689-7-arnout@mind.be>
References: <20200207180829.165689-1-arnout@mind.be>
 <20200207180829.165689-7-arnout@mind.be>
Message-ID: <CADyEP=RcQfucKeBMOSQP=kNmzKCd+9yDN6kE1MnEBwT-m_Sgng@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
Working on a new package using rust, this patch suite have resolved my
issue with rust version successfully.

Regards
David

On Fri, Feb 7, 2020 at 7:10 PM Arnout Vandecappelle (Essensium/Mind)
<arnout@mind.be> wrote:
>
> From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
>
> As all providers of rustc also install cargo, there is no need to depend
> on the standalone cargo package anymore. Instead add host-rustc to the
> dependency list.
>
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> Signed-off-by: Patrick Havelange <patrick.havelange@essensium.com>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: David Pierret <david.pierret@smile.fr>
Tested-by: David Pierret <david.pierret@smile.fr>
> ---
>  package/ripgrep/Config.in  | 2 +-
>  package/ripgrep/ripgrep.mk | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/ripgrep/Config.in b/package/ripgrep/Config.in
> index 5446ad046c..0ea2902b34 100644
> --- a/package/ripgrep/Config.in
> +++ b/package/ripgrep/Config.in
> @@ -1,7 +1,7 @@
>  config BR2_PACKAGE_RIPGREP
>         bool "ripgrep"
>         depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
> -       select BR2_PACKAGE_HOST_CARGO
> +       select BR2_PACKAGE_HOST_RUSTC
>         help
>           ripgrep is a line-oriented search tool that
>           recursively searches your current directory
> diff --git a/package/ripgrep/ripgrep.mk b/package/ripgrep/ripgrep.mk
> index 0bb7017a96..832c076f26 100644
> --- a/package/ripgrep/ripgrep.mk
> +++ b/package/ripgrep/ripgrep.mk
> @@ -9,7 +9,7 @@ RIPGREP_SITE = $(call github,burntsushi,ripgrep,$(RIPGREP_VERSION))
>  RIPGREP_LICENSE = MIT
>  RIPGREP_LICENSE_FILES = LICENSE-MIT
>
> -RIPGREP_DEPENDENCIES = host-cargo
> +RIPGREP_DEPENDENCIES = host-rustc
>  RIPGREP_CARGO_ENV = CARGO_HOME=$(HOST_DIR)/share/cargo
>  RIPGREP_CARGO_MODE = $(if $(BR2_ENABLE_DEBUG),debug,release)
>
> --
> 2.24.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
