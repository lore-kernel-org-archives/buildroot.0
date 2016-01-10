From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 10 Jan 2016 18:02:57 +0100
Subject: [Buildroot] [PATCH] linux: handle read-only dts files
In-Reply-To: <1439338309-19690-1-git-send-email-hollis_blanchard@mentor.com>
References: <1439338309-19690-1-git-send-email-hollis_blanchard@mentor.com>
Message-ID: <20160110170257.GG3460@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hollis, All,

On 2015-08-11 17:11 -0700, Hollis Blanchard spake thusly:
> Some fine version control systems make all files read-only. The custom DTS file
> may therefore be read-only, and that permission is preserved when copying into
> the Linux build directory. A subsequent rebuild tries to 'cp' again, which
> fails with a "Permission denied" error unless the -f option is used.
> 
> Signed-off-by: Hollis Blanchard <hollis_blanchard@mentor.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  linux/linux.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/linux/linux.mk b/linux/linux.mk
> index 375a9e1..a4c4733 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -270,7 +270,7 @@ endif
>  # configuration has changed.
>  define LINUX_BUILD_CMDS
>  	$(if $(BR2_LINUX_KERNEL_USE_CUSTOM_DTS),
> -		cp $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH)) $(KERNEL_ARCH_PATH)/boot/dts/)
> +		cp -f $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH)) $(KERNEL_ARCH_PATH)/boot/dts/)
>  	$(LINUX_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(LINUX_TARGET_NAME)
>  	@if grep -q "CONFIG_MODULES=y" $(@D)/.config; then 	\
>  		$(LINUX_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) modules ;	\
> -- 
> 2.3.2
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
