From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Thu, 16 Jan 2014 14:11:36 +0100
Subject: [Buildroot] [RFC,
 PATCH 4/8] package/powerpc-utils: Add powerpc hardware utilities
In-Reply-To: <1389862338.918857.878477328980.4.gpush@pablo>
References: <1389862338.918857.878477328980.4.gpush@pablo>
Message-ID: <52D7DA88.9040409@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi Jeremy,

> This change adds a package definition for the powerpc-utils project,
> containing a set of powerpc-specific hardware management utilities.
>
> We're using a git tag from upstream, which contains a few build-system
> fixes. We also add a patch to use `reboot` instead of `shutdown -r`,
> allowing compatibility with busybox.
>
> Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
>
> ---
>   package/Config.in                                                                             |    1
>   package/powerpc-utils/Config.in                                                               |    5 +
>   package/powerpc-utils/powerpc-utils-scripts-update_flash-Use-reboot-instead-of-shutdown.patch |   42 ++++++++++

powerpc-utils-01-scripts-update_flash-Use-reboot-instead-of-shutdown.patch


>   package/powerpc-utils/powerpc-utils.mk                                                        |   14 +++
>   4 files changed, 62 insertions(+)

[...]

> diff --git a/package/powerpc-utils/powerpc-utils.mk b/package/powerpc-utils/powerpc-utils.mk
> new file mode 100644
> index 00000000..15deb2e9
> --- /dev/null
> +++ b/package/powerpc-utils/powerpc-utils.mk
> @@ -0,0 +1,14 @@
> +#############################################################

80 of # signs

> +#
> +# powerpc-utils
> +#
> +#############################################################

ditto

Regards,
Jerzy

> +
> +POWERPC_UTILS_VERSION = aeb32757
> +POWERPC_UTILS_SITE = git://git.code.sf.net/p/powerpc-utils/powerpc-utils
> +POWERPC_UTILS_AUTORECONF = YES
> +POWERPC_UTILS_DEPENDENCIES = zlib
> +
> +POWERPC_UTILS_CONF_OPT += --without-librtas
> +
> +$(eval $(autotools-package))
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
