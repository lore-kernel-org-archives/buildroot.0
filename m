From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Tue, 14 Apr 2020 11:35:47 +0200
Subject: [Buildroot] [PATCH v5 2/9] package/qoriq-rcw: move rcw into nxp
 and rename it
In-Reply-To: <20200207083857.28058-2-jerry.huang@nxp.com>
References: <20200207083857.28058-1-jerry.huang@nxp.com>
 <20200207083857.28058-2-jerry.huang@nxp.com>
Message-ID: <CAEyMn7bcTuhn_+NkJ_Ja48h32V4nv18_AUQXu+1tu2hJOuqAoA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jerry,

Am Fr., 7. Feb. 2020 um 09:41 Uhr schrieb Changming Huang <jerry.huang@nxp.com>:
>
> Move package/rcw into package/nxp,
> and rename it to qoriq-rcw.
>
> Signed-off-by: Changming Huang <jerry.huang@nxp.com>
> ---
> changes since v4:
> no changes.
>
> changes since v3:
> no changes.
>
> changes since v2:
> 1. change the package name to qoriq-rcw to keep consistent with imx-xxx.
> 2. add the handing in Config.in.legacy
>
> changes since v1:
> 1. new patch.
> 2. move rcw to sub-directory freescale-qoriq.
> 3. rename to fsl-qoriq-rcw.
> ---
>  Config.in.legacy                              | 16 ++++++
>  DEVELOPERS                                    |  2 +-
>  package/Config.in.host                        |  2 +-
>  package/{rcw => nxp/qoriq-rcw}/Config.in.host |  6 +--
>  .../rcw.hash => nxp/qoriq-rcw/qoriq-rcw.hash} |  2 +-
>  package/nxp/qoriq-rcw/qoriq-rcw.mk            | 50 +++++++++++++++++++
>  package/rcw/rcw.mk                            | 50 -------------------
>  7 files changed, 72 insertions(+), 56 deletions(-)
>  rename package/{rcw => nxp/qoriq-rcw}/Config.in.host (88%)
>  rename package/{rcw/rcw.hash => nxp/qoriq-rcw/qoriq-rcw.hash} (82%)
>  create mode 100644 package/nxp/qoriq-rcw/qoriq-rcw.mk
>  delete mode 100644 package/rcw/rcw.mk
>
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 3c6984d886..2473282e9d 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -258,6 +258,22 @@ config BR2_BINUTILS_VERSION_2_30_X
>           current default version (2.31 or later) has been selected
>           instead.
>
> +config BR2_PACKAGE_HOST_RCW
> +       bool "rcw package was removed"
> +       select BR2_LEGACY
> +       help
> +         Because rcw package has been renamed to qoriq-rcw and moved
> +         to "nxp", option BR2_PACKAGE_HOST_RCW is removed, the option
> +         BR2_PACKAGE_HOST_QORIQ_RCW can be used for QorIQ platforms.
> +
> +config BR2_PACKAGE_HOST_RCW
> +       bool "rcw package was removed"
> +       select BR2_LEGACY
> +       help
> +         Because rcw package has been renamed to qoriq-rcw and moved
> +         to "nxp", option BR2_PACKAGE_HOST_RCW is removed, the option
> +         BR2_PACKAGE_HOST_QORIQ_RCW can be used for QorIQ platforms.
> +

here seems to be a mistake ... the BR2_PACKAGE_HOST_RCW section is
there twice :-/

-- 
Heiko
