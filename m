From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 5 Feb 2014 19:22:46 +0100
Subject: [Buildroot] [PATCH] filter BR2_DEFCONFIG out of defconfig files
In-Reply-To: <1391523148-30887-1-git-send-email-jeremy.rosen@openwide.fr>
References: <1391523148-30887-1-git-send-email-jeremy.rosen@openwide.fr>
Message-ID: <20140205182246.GA19446@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?r?my, All,

On 2014-02-04 15:12 +0100, J?r?my Rosen spake thusly:
> When it is set, BR2_DEFCONFIG is saved like any config variable.
> However, at this point it is a completely expanded, absolute path
> It is not a good idea to save absolute paths in defconfig files
> moreover it makes little sense to save the defconfig location
> within the defconfig
> 
> Signed-off-by: J?r?my Rosen <jeremy.rosen@openwide.fr>
> ---
>  Makefile | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Makefile b/Makefile
> index 4a675d4..f63a058 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -772,6 +772,7 @@ savedefconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
>  	@$(COMMON_CONFIG_ENV) $< \
>  		--savedefconfig=$(if $(DEFCONFIG),$(DEFCONFIG),$(CONFIG_DIR)/defconfig) \
>  		$(CONFIG_CONFIG_IN)
> +	sed -i '/^BR2_DEFCONFIG=/d' $(DEFCONFIG)

Should be:
    $(SED) '/blabla/'

$(SED) already contains -i

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
