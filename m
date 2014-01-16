From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Thu, 16 Jan 2014 14:17:06 +0100
Subject: [Buildroot] [RFC,
 PATCH 5/8] package/kexec-lite: Add a package for the kexec-lite
 tools
In-Reply-To: <1389862338.919140.855251422258.5.gpush@pablo>
References: <1389862338.919140.855251422258.5.gpush@pablo>
Message-ID: <52D7DBD2.5020805@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi Jeremy,

> Kexec-lite is a tiny impementation of kexec for devicetree-based
> platforms.
>
> Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
>
> ---
>   package/Config.in                                 |    1
>   package/kexec-lite/Config.in                      |    9 +++
>   package/kexec-lite/kexec-lite-clean-restart.patch |   34 ++++++++++++++

kexec-lite-01-clean-restart.patch


>   package/kexec-lite/kexec-lite.mk                  |   20 ++++++++
>   4 files changed, 64 insertions(+)

[...]

> diff --git a/package/kexec-lite/kexec-lite.mk b/package/kexec-lite/kexec-lite.mk
> new file mode 100644
> index 00000000..4d844f43
> --- /dev/null
> +++ b/package/kexec-lite/kexec-lite.mk
> @@ -0,0 +1,20 @@
> +################################################################################
> +#
> +# kexec

# kexec-lite

Regards,
Jerzy

> +#
> +################################################################################
> +
> +KEXEC_LITE_VERSION = 6c762a7
> +KEXEC_LITE_SITE = git://github.com/antonblanchard/kexec-lite
> +KEXEC_LITE_LICENSE = GPL
> +KEXEC_LITE_DEPENDENCIES = libelf dtc
> +
> +define KEXEC_LITE_BUILD_CMDS
> +	$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) all
> +endef
> +
> +define KEXEC_LITE_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 755 $(@D)/kexec $(TARGET_DIR)/usr/sbin/
> +endef
> +
> +$(eval $(generic-package))
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
