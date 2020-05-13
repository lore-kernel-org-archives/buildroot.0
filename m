From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 13 May 2020 21:55:24 +0200
Subject: [Buildroot] [PATCH 1/1] package/binutils: install libopcodes
 for perf
In-Reply-To: <20200513170233.2983421-1-lecopzer@gmail.com>
References: <20200513170233.2983421-1-lecopzer@gmail.com>
Message-ID: <20200513195524.GY12536@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Lecopzer, All,

On 2020-05-14 01:02 +0800, Lecopzer Chen spake thusly:
> After 5.6.x linux-tool perf installed, it can't be executed due
> to lack of libopcodes:
> 
>     perf: ...libopcodes-2.33.1.so: cannot open shared object file
> 
> Signed-off-by: Lecopzer Chen <lecopzer@gmail.com>

Applied to master, with an expanded commit log to reference the origianl
commit adding libopcodes to staging. Thanks!

Regards,
Yann E. MORIN.

> ---
>  package/binutils/binutils.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
> index 876c9c59f8..81308e2e81 100644
> --- a/package/binutils/binutils.mk
> +++ b/package/binutils/binutils.mk
> @@ -112,6 +112,7 @@ endef
>  ifneq ($(BR2_PACKAGE_BINUTILS_TARGET),y)
>  define BINUTILS_INSTALL_TARGET_CMDS
>  	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/bfd DESTDIR=$(TARGET_DIR) install
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/opcodes DESTDIR=$(TARGET_DIR) install
>  	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/libiberty DESTDIR=$(STAGING_DIR) install
>  endef
>  endif
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
