From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 7 Jul 2020 15:37:32 +0200
Subject: [Buildroot] [PATCH v1 3/3] package/qemu: add usb-redir support
In-Reply-To: <20200629205002.8087-3-jared.bents@rockwellcollins.com>
References: <20200629205002.8087-1-jared.bents@rockwellcollins.com>
 <20200629205002.8087-3-jared.bents@rockwellcollins.com>
Message-ID: <6596181c-8368-b586-e258-d1eb37fce9f1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 29/06/2020 ? 22:50, Jared Bents a ?crit?:
> update to add usb-redir support to qemu if usbredir is enabled
> 
> Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>

Reviewed-by: Romain Naour <romain.naour@gmail.com>

Best regards,
Romain

> ---
>  package/qemu/qemu.mk | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
> index 520547e94e..3ed5565221 100644
> --- a/package/qemu/qemu.mk
> +++ b/package/qemu/qemu.mk
> @@ -126,6 +126,13 @@ else
>  QEMU_OPTS += --disable-spice
>  endif
>  
> +ifeq ($(BR2_PACKAGE_USBREDIR),y)
> +QEMU_OPTS += --enable-usb-redir
> +QEMU_DEPENDENCIES += usbredir
> +else
> +QEMU_OPTS += --disable-usb-redir
> +endif
> +
>  # Override CPP, as it expects to be able to call it like it'd
>  # call the compiler.
>  define QEMU_CONFIGURE_CMDS
> @@ -158,7 +165,6 @@ define QEMU_CONFIGURE_CMDS
>  			--disable-docs \
>  			--disable-rbd \
>  			--disable-libiscsi \
> -			--disable-usb-redir \
>  			--disable-strip \
>  			--disable-sparse \
>  			--disable-mpath \
> 
