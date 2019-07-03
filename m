From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 3 Jul 2019 23:34:40 +0200
Subject: [Buildroot] [PATCH] boot/barebox: needs host-{flex,bison}
In-Reply-To: <20190702201341.8230-1-m.niestroj@grinn-global.com>
References: <20190702201341.8230-1-m.niestroj@grinn-global.com>
Message-ID: <24b07d4b-3635-34e1-8e3a-fd98981de943@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 02/07/2019 22:13, Marcin Niestroj wrote:
> Barebox starting from 2019.02 no longer ships flex/bison generated
> parser. Add conditional kconfig dependencies, same as we did for kernel
> and uboot.
> 
> Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  boot/barebox/barebox.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
> index 9e8a9f67b5..52178d89c8 100644
> --- a/boot/barebox/barebox.mk
> +++ b/boot/barebox/barebox.mk
> @@ -76,6 +76,10 @@ $(1)_KCONFIG_FRAGMENT_FILES = $$(call qstrip,$$(BR2_TARGET_$(1)_CONFIG_FRAGMENT_
>  $(1)_KCONFIG_EDITORS = menuconfig xconfig gconfig nconfig
>  $(1)_KCONFIG_OPTS = $$($(1)_MAKE_FLAGS)
>  
> +$(1)_KCONFIG_DEPENDENCIES = \
> +	$(BR2_BISON_HOST_DEPENDENCY) \
> +	$(BR2_FLEX_HOST_DEPENDENCY)
> +
>  ifeq ($$(BR2_TARGET_$(1)_BAREBOXENV),y)
>  define $(1)_BUILD_BAREBOXENV_CMDS
>  	$$(TARGET_CC) $$(TARGET_CFLAGS) $$(TARGET_LDFLAGS) -o $$(@D)/bareboxenv \
> 
