From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 6 Apr 2020 20:20:17 +0200
Subject: [Buildroot] [PATCH 1/4] package/qemu: disable libssh for the
 host variant
In-Reply-To: <20200406142159.592563-1-romain.naour@gmail.com>
References: <20200406142159.592563-1-romain.naour@gmail.com>
Message-ID: <20200406182017.GQ22325@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2020-04-06 16:21 +0200, Romain Naour spake thusly:
> There is no host-libssh in Buildroot, avoid qemu build system
> to find libssh from the host.
> 
> Under certain circumstances (host distribution, openssl version), the
> qemu-system binary fail to start:
> 
> host/bin/qemu-system-aarch64: symbol lookup error: /lib64/libssh.so.4: undefined symbol: EVP_KDF_ctrl, version OPENSSL_1_1_1b
> 
> $ ldd output/host/bin/qemu-system-aarch64
> 	[...]
> 	libssh.so.4 => /lib64/libssh.so.4
> 
> Explicitely disable libssh for the host variant.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>

All 4 patches applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/qemu/qemu.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
> index b2249ed4ee..3c3b098a5b 100644
> --- a/package/qemu/qemu.mk
> +++ b/package/qemu/qemu.mk
> @@ -303,6 +303,7 @@ define HOST_QEMU_CONFIGURE_CMDS
>  		--extra-cflags="$(HOST_QEMU_CFLAGS)" \
>  		--extra-ldflags="$(HOST_LDFLAGS)" \
>  		--python=$(HOST_DIR)/bin/python3 \
> +		--disable-libssh \
>  		$(HOST_QEMU_OPTS)
>  endef
>  
> -- 
> 2.25.1
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
