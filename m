From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 20 Mar 2015 23:07:00 +0100
Subject: [Buildroot] [PATCH v4 3/3] linux: install dtc only in case
 package host dtc is not selected
In-Reply-To: <1421793790-32237-3-git-send-email-ps.report@gmx.net>
References: <1421793790-32237-1-git-send-email-ps.report@gmx.net>
 <1421793790-32237-3-git-send-email-ps.report@gmx.net>
Message-ID: <20150320220700.GB3979@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

Sorry for the delay...

On 2015-01-20 23:43 +0100, Peter Seiderer spake thusly:
> Suggested by Matthew Weber (see [1]) to avoid double installation
> of host dtc.
> 
> [1] http://lists.busybox.net/pipermail/buildroot/2015-January/117121.html
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  linux/linux.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/linux/linux.mk b/linux/linux.mk
> index 29f59e8..d598b44 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -292,13 +292,14 @@ endef
>  endif
>  
>  
> +ifeq ($BR2_PACKAGE_HOST_DTC,)

We usually put variables between parenthesis:

    ifeq ($(BR2_PACKAGE_HOST_DTC),)

Also, this should have been squashed into the first patch.

Otherwise, looks good:

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

>  define LINUX_INSTALL_HOST_TOOLS
>  	# Installing dtc (device tree compiler) as host tool, if selected
>  	if grep -q "CONFIG_DTC=y" $(@D)/.config; then 	\
>  		$(INSTALL) -D -m 0755 $(@D)/scripts/dtc/dtc $(HOST_DIR)/usr/bin/dtc ;	\
>  	fi
>  endef
> -
> +endif
>  
>  define LINUX_INSTALL_IMAGES_CMDS
>  	cp $(LINUX_IMAGE_PATH) $(BINARIES_DIR)
> -- 
> 2.1.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
