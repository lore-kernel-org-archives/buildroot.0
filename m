From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 11 Apr 2017 16:23:21 +0200
Subject: [Buildroot] [PATCH v4 2/2] xenomai: Add config for
 enabling/disabling SMP
In-Reply-To: <20170410172603.6427-2-sikor6@gmail.com>
References: <20170410172603.6427-1-sikor6@gmail.com>
 <20170410172603.6427-2-sikor6@gmail.com>
Message-ID: <CAAXf6LV5JG6g6YgwF8AXbUe1zkK=VbbZx8d8TAtHJyDQ10xNcQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Apr 10, 2017 at 7:26 PM, Pawel Sikora <sikor6@gmail.com> wrote:
> Add a config option for enabling/disabling SMP
> in Xenomai userspace in version 3.x
>
> Enabled by default.
>
> Signed-off-by: Pawel Sikora <sikor6@gmail.com>
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
> Changes v3 -> v4:
>   - No changes, just merging in series with 'core Cobalt/Mercury' patch
>
>  package/xenomai/Config.in  | 17 +++++++++++++++++
>  package/xenomai/xenomai.mk |  6 ++++++
>  2 files changed, 23 insertions(+)
>
> diff --git a/package/xenomai/Config.in b/package/xenomai/Config.in
> index 324f5025a..efb504b35 100644
> --- a/package/xenomai/Config.in
> +++ b/package/xenomai/Config.in
> @@ -78,6 +78,23 @@ config BR2_PACKAGE_XENOMAI_COBALT
>           in the Linux Kernel Extensions menu.
>  endchoice
>
> +config BR2_PACKAGE_XENOMAI_ENABLE_SMP
> +       bool "Enable SMP"

nit: I would make it "Enable SMP support"

> +       default y
> +       help
> +         This option enables SMP support in Xenomai userspace.
> +
> +         If this option is turned on while no SMP support is enabled
> +         in the kernel, things will still work. However, if SMP is
> +         enabled in the kernel but this option is not turned on,
> +         Xenomai applications will complain with 'feature mismatch:
> +         missing="smp/nosmp'.

and here I would put the error message on a separate line to increase
readability.

Obviously both of these are real nits, that perhaps could be fixed up
when applying.

Reviewed-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
