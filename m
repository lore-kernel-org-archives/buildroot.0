From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Jul 2016 15:57:17 +0200
Subject: [Buildroot] [PATCH 1/1] grub2: if BR2_STRIP_none is 'y' then
 grub2 will not build
In-Reply-To: <1463861470-16123-1-git-send-email-ckhardin@exablox.com>
References: <1463861470-16123-1-git-send-email-ckhardin@exablox.com>
Message-ID: <20160717135717.GF3614@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Charles, All,

On 2016-05-21 13:11 -0700, Charles Hardin spake thusly:
> grub2 assumes the strip command will generate output and the
> output should always be stripped - so, just use the $(TARGET_CROSS)strip
> to make sure that the build succeeds regards of the buildroot
                                       ^^^^^^^
*regardless

> strip configuration.
> 
> Signed-off-by: Charles Hardin <ckhardin@exablox.com>

Otherwise:

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  boot/grub2/grub2.mk | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
> index 88a46f4..e656265 100644
> --- a/boot/grub2/grub2.mk
> +++ b/boot/grub2/grub2.mk
> @@ -45,6 +45,9 @@ endif
>  # the confusion, it also uses NM, OBJCOPY and STRIP to build the
>  # bootloader itself; none of these are used to build the native
>  # tools.
> +#
> +# NOTE: TARGET_STRIP is overridden by BR2_STRIP_none, so always
> +# use the cross compile variant to ensure grub2 builds
>  
>  GRUB2_CONF_ENV = \
>  	$(HOST_CONFIGURE_OPTS) \
> @@ -55,7 +58,7 @@ GRUB2_CONF_ENV = \
>  	TARGET_LDFLAGS="$(TARGET_LDFLAGS)" \
>  	NM="$(TARGET_NM)" \
>  	OBJCOPY="$(TARGET_OBJCOPY)" \
> -	STRIP="$(TARGET_STRIP)"
> +	STRIP="$(TARGET_CROSS)strip"
>  
>  GRUB2_CONF_OPTS = \
>  	--target=$(GRUB2_TARGET) \
> -- 
> 2.7.4 (Apple Git-66)
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
