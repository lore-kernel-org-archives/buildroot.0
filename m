From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 29 Dec 2020 23:56:16 +0100
Subject: [Buildroot] [PATCH] boot/barebox: kconfig needs the toolchain
In-Reply-To: <20201208101107.32758-1-jmaselbas@kalray.eu>
References: <20201208101107.32758-1-jmaselbas@kalray.eu>
Message-ID: <20201229225616.GC1680670@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jules, All,

On 2020-12-08 11:11 +0100, Jules Maselbas via buildroot spake thusly:
> In barebox v2020.09.0, kconfig has been updated to a newer version
> based on Linux 5.9-rc2.  As in linux, kconfig can call the compiler
> to test its capabilities.
> 
> Signed-off-by: Jules Maselbas <jmaselbas@kalray.eu>

Applied to master, thanks!

I've just added a little blurb about custom versions: since we can't
know whether custom version need the toolchain or not, we just make that
unconditional.

Thanks!

Regards,
Yann E. MORIN.

> ---
>  boot/barebox/barebox.mk | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
> index 422f27312d..2e80954741 100644
> --- a/boot/barebox/barebox.mk
> +++ b/boot/barebox/barebox.mk
> @@ -88,6 +88,11 @@ $(1)_KCONFIG_DEPENDENCIES = \
>  	$(BR2_BISON_HOST_DEPENDENCY) \
>  	$(BR2_FLEX_HOST_DEPENDENCY)
>  
> +# Starting with barebox v2020.09.0, the kconfig used calls the
> +# cross-compiler to check its capabilities. So we need the
> +# toolchain before we can call the configurators.
> +$(1)_KCONFIG_DEPENDENCIES += toolchain
> +
>  ifeq ($$(BR2_TARGET_$(1)_BAREBOXENV),y)
>  define $(1)_BUILD_BAREBOXENV_CMDS
>  	$$(TARGET_CC) $$(TARGET_CFLAGS) $$(TARGET_LDFLAGS) -o $$(@D)/bareboxenv \
> -- 
> 2.17.1
> 
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
