From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 30 Sep 2020 22:52:24 +0200
Subject: [Buildroot] [PATCH 2/2] package/gdb: also disable gprof
In-Reply-To: <20200928201128.78005-2-thomas.petazzoni@bootlin.com>
References: <20200928201128.78005-1-thomas.petazzoni@bootlin.com>
 <20200928201128.78005-2-thomas.petazzoni@bootlin.com>
Message-ID: <20200930205224.GX11621@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2020-09-28 22:11 +0200, Thomas Petazzoni spake thusly:
> When gdb is built from sources fetched from Git, it contains both the
> gdb and the binutils code base. In order to really build only gdb, we
> disable a number of binutils components in the
> GDB_DISABLE_BINUTILS_CONF_OPTS variable: --disable-binutils,
> --disable-ld, --disable-gas, etc. However, gprof was still being
> built, so disable it as well.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/gdb/gdb.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
> index 2e5588bfbc..f31b168bf1 100644
> --- a/package/gdb/gdb.mk
> +++ b/package/gdb/gdb.mk
> @@ -81,7 +81,8 @@ GDB_DISABLE_BINUTILS_CONF_OPTS = \
>  	--disable-binutils \
>  	--disable-install-libbfd \
>  	--disable-ld \
> -	--disable-gas
> +	--disable-gas \
> +	--disable-gprof
>  
>  GDB_CONF_ENV = \
>  	ac_cv_type_uintptr_t=yes \
> -- 
> 2.26.2
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
