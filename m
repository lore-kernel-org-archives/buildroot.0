From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 21 Oct 2020 22:01:30 +0200
Subject: [Buildroot] [PATCH 1/1] Makefile: exclude DL_DIR from
 savedefconfig
In-Reply-To: <alpine.DEB.2.20.2010211133360.29285@defender.svolli.xa>
References: <alpine.DEB.2.20.2010211133360.29285@defender.svolli.xa>
Message-ID: <20201021200130.GL3466@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sven, All,

On 2020-10-21 12:34 +0200, Sven Oliver Moll spake thusly:
> Running "make savedefconfig" with DL_DIR set also saves that variable,
> which is only useful in local context.
> 
> Signed-off-by: Sven Oliver Moll <buildroot@svol.li>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index 384bfe3fe9..e7b3b7535b 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1027,7 +1027,7 @@ savedefconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
>  	@$(COMMON_CONFIG_ENV) $< \
>  		--savedefconfig=$(if $(DEFCONFIG),$(DEFCONFIG),$(CONFIG_DIR)/defconfig) \
>  		$(CONFIG_CONFIG_IN)
> -	@$(SED) '/BR2_DEFCONFIG=/d' $(if $(DEFCONFIG),$(DEFCONFIG),$(CONFIG_DIR)/defconfig)
> +	@$(SED) '/BR2_DEFCONFIG=/d' -e '/BR2_DL_DIR=/d' $(if $(DEFCONFIG),$(DEFCONFIG),$(CONFIG_DIR)/defconfig)
> 
>  .PHONY: defconfig savedefconfig update-defconfig
> 
> -- 
> 2.20.1
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
