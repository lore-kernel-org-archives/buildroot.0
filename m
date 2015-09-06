From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 6 Sep 2015 22:51:36 +0200
Subject: [Buildroot] [PATCH v2 2/3] elf2flt: fix build when LTO is
	enabled
In-Reply-To: <1441554499-23595-1-git-send-email-public.douglas.raillard@gmail.com>
References: <20150906152401.67d5df05@free-electrons.com>
 <1441554499-23595-1-git-send-email-public.douglas.raillard@gmail.com>
Message-ID: <20150906205136.GG3580@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Douglas, All,

On 2015-09-06 17:48 +0200, Douglas RAILLARD spake thusly:
> Signed-off-by: Douglas RAILLARD <public.douglas.raillard@gmail.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/elf2flt/elf2flt.mk | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/package/elf2flt/elf2flt.mk b/package/elf2flt/elf2flt.mk
> index 3fcada4..bec270b 100644
> --- a/package/elf2flt/elf2flt.mk
> +++ b/package/elf2flt/elf2flt.mk
> @@ -21,6 +21,12 @@ HOST_ELF2FLT_CONF_OPTS = \
>  	--with-libiberty=$(HOST_BINUTILS_DIR)/libiberty/libiberty.a \
>  	--target=$(GNU_TARGET_NAME)
>  
> -HOST_ELF2FLT_CONF_ENV = LIBS=-lz
> +HOST_ELF2FLT_LIBS = -lz
> +
> +ifeq ($(BR2_GCC_ENABLE_LTO),y)
> +HOST_ELF2FLT_LIBS += -ldl
> +endif
> +
> +HOST_ELF2FLT_CONF_ENV = LIBS="$(HOST_ELF2FLT_LIBS)"
>  
>  $(eval $(host-autotools-package))
> -- 
> 2.5.1
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
