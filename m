From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 22 Jun 2019 22:29:04 +0200
Subject: [Buildroot] [PATCH v6 2/2] libdrm: change to meson build system
In-Reply-To: <20190423205302.14382-2-ps.report@gmx.net>
References: <20190423205302.14382-1-ps.report@gmx.net>
 <20190423205302.14382-2-ps.report@gmx.net>
Message-ID: <20190622202904.GG13664@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2019-04-23 22:53 +0200, Peter Seiderer spake thusly:
[--SNIP--]
> diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
> index cc7350c10e..77e7ad01bd 100644
> --- a/package/libdrm/libdrm.mk
> +++ b/package/libdrm/libdrm.mk
[--SNIP--]
>  ifeq ($(BR2_PACKAGE_LIBATOMIC_OPS),y)
>  LIBDRM_DEPENDENCIES += libatomic_ops
>  ifeq ($(BR2_sparc_v8)$(BR2_sparc_leon3),y)
> -LIBDRM_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -DAO_NO_SPARC_V9"
> +LIBDRM_MESON_CFLAGS += -DAO_NO_SPARC_V9

As discussed in the thread, the variable was renamed.

I've resent a new iteration of the meson-package part as a standalone
patch:
    https://patchwork.ozlabs.org/patch/1120719/

As such, I've marked this thread as Changes requested.

Care to resend this libdrm bump+conversion once the meson infra part
lands?

Thanks! :-)

Regards,
Yann E. MORIN.

>  endif
>  endif
> 
>  ifeq ($(BR2_PACKAGE_LIBDRM_INTEL),y)
> -LIBDRM_CONF_OPTS += --enable-intel
> +LIBDRM_CONF_OPTS += -Dintel=true
>  LIBDRM_DEPENDENCIES += libpciaccess
>  else
> -LIBDRM_CONF_OPTS += --disable-intel
> +LIBDRM_CONF_OPTS += -Dintel=false
>  endif
> 
>  ifeq ($(BR2_PACKAGE_LIBDRM_RADEON),y)
> -LIBDRM_CONF_OPTS += --enable-radeon
> +LIBDRM_CONF_OPTS += -Dradeon=true
>  else
> -LIBDRM_CONF_OPTS += --disable-radeon
> +LIBDRM_CONF_OPTS += -Dradeon=false
>  endif
> 
>  ifeq ($(BR2_PACKAGE_LIBDRM_AMDGPU),y)
> -LIBDRM_CONF_OPTS += --enable-amdgpu
> +LIBDRM_CONF_OPTS += -Damdgpu=true
>  else
> -LIBDRM_CONF_OPTS += --disable-amdgpu
> +LIBDRM_CONF_OPTS += -Damdgpu=false
>  endif
> 
>  ifeq ($(BR2_PACKAGE_LIBDRM_NOUVEAU),y)
> -LIBDRM_CONF_OPTS += --enable-nouveau
> +LIBDRM_CONF_OPTS += -Dnouveau=true
>  else
> -LIBDRM_CONF_OPTS += --disable-nouveau
> +LIBDRM_CONF_OPTS += -Dnouveau=false
>  endif
> 
>  ifeq ($(BR2_PACKAGE_LIBDRM_VMWGFX),y)
> -LIBDRM_CONF_OPTS += --enable-vmwgfx
> +LIBDRM_CONF_OPTS += -Dvmwgfx=true
>  else
> -LIBDRM_CONF_OPTS += --disable-vmwgfx
> +LIBDRM_CONF_OPTS += -Dvmwgfx=false
>  endif
> 
>  ifeq ($(BR2_PACKAGE_LIBDRM_OMAP),y)
> -LIBDRM_CONF_OPTS += --enable-omap-experimental-api
> +LIBDRM_CONF_OPTS += -Domap=true
>  else
> -LIBDRM_CONF_OPTS += --disable-omap-experimental-api
> +LIBDRM_CONF_OPTS += -Domap=false
>  endif
> 
>  ifeq ($(BR2_PACKAGE_LIBDRM_ETNAVIV),y)
> -LIBDRM_CONF_OPTS += --enable-etnaviv-experimental-api
> +LIBDRM_CONF_OPTS += -Detnaviv=true
>  else
> -LIBDRM_CONF_OPTS += --disable-etnaviv-experimental-api
> +LIBDRM_CONF_OPTS += -Detnaviv=false
>  endif
> 
>  ifeq ($(BR2_PACKAGE_LIBDRM_EXYNOS),y)
> -LIBDRM_CONF_OPTS += --enable-exynos-experimental-api
> +LIBDRM_CONF_OPTS += -Dexynos=true
>  else
> -LIBDRM_CONF_OPTS += --disable-exynos-experimental-api
> +LIBDRM_CONF_OPTS += -Dexynos=false
>  endif
> 
>  ifeq ($(BR2_PACKAGE_LIBDRM_FREEDRENO),y)
> -LIBDRM_CONF_OPTS += --enable-freedreno
> +LIBDRM_CONF_OPTS += -Dfreedreno=true
>  else
> -LIBDRM_CONF_OPTS += --disable-freedreno
> +LIBDRM_CONF_OPTS += -Dfreedreno=false
>  endif
> 
>  ifeq ($(BR2_PACKAGE_LIBDRM_TEGRA),y)
> -LIBDRM_CONF_OPTS += --enable-tegra-experimental-api
> +LIBDRM_CONF_OPTS += -Dtegra=true
>  else
> -LIBDRM_CONF_OPTS += --disable-tegra-experimental-api
> +LIBDRM_CONF_OPTS += -Dtegra=false
>  endif
> 
>  ifeq ($(BR2_PACKAGE_LIBDRM_VC4),y)
> -LIBDRM_CONF_OPTS += --enable-vc4
> +LIBDRM_CONF_OPTS += -Dvc4=true
>  else
> -LIBDRM_CONF_OPTS += --disable-vc4
> +LIBDRM_CONF_OPTS += -Dvc4=false
>  endif
> 
>  ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
> -LIBDRM_CONF_OPTS += --enable-udev
> +LIBDRM_CONF_OPTS += -Dudev=true
>  LIBDRM_DEPENDENCIES += udev
>  else
> -LIBDRM_CONF_OPTS += --disable-udev
> +LIBDRM_CONF_OPTS += -Dudev=false
>  endif
> 
>  ifeq ($(BR2_PACKAGE_VALGRIND),y)
> -LIBDRM_CONF_OPTS += --enable-valgrind
> +LIBDRM_CONF_OPTS += -Dvalgrind=true
>  LIBDRM_DEPENDENCIES += valgrind
>  else
> -LIBDRM_CONF_OPTS += --disable-valgrind
> +LIBDRM_CONF_OPTS += -Dvalgrind=false
>  endif
> 
>  ifeq ($(BR2_PACKAGE_LIBDRM_INSTALL_TESTS),y)
> -LIBDRM_CONF_OPTS += --enable-install-test-programs
> +LIBDRM_CONF_OPTS += -Dinstall-test-programs=true
>  ifeq ($(BR2_PACKAGE_CUNIT),y)
>  LIBDRM_DEPENDENCIES += cunit
>  endif
>  endif
> 
> -$(eval $(autotools-package))
> +$(eval $(meson-package))
> --
> 2.21.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
