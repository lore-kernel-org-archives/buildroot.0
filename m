From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Jul 2020 18:55:13 +0200
Subject: [Buildroot] [PATCH 1/1] package/exim: fix CC and LNCC
 initialization
In-Reply-To: <20200719102946.1646674-1-alejandro.gonzalez.correo@gmail.com>
References: <20200719102946.1646674-1-alejandro.gonzalez.correo@gmail.com>
Message-ID: <20200719165513.GX18825@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alejandro, All,

On 2020-07-19 12:29 +0200, Alejandro Gonz?lez spake thusly:
> When using ccache to build the exim package, the
> HOSTCC value contains characters that are incorrectly
> interpreted by exim's Makefile, presumably spaces. This
> breaks the build with "unrecognized option" ccache errors.
> 
> Fix that by wrapping the HOSTCC variable in double quotes,
> as it is done for other variables that follow.
> 
> Signed-off-by: Alejandro Gonz?lez <alejandro.gonzalez.correo@gmail.com>

Applied to master, after tweaking the commit log slightly. Thanks!

Regards,
Yann E. MORIN.

> ---
>  package/exim/exim.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/exim/exim.mk b/package/exim/exim.mk
> index 6643abbf65..19a62f497d 100644
> --- a/package/exim/exim.mk
> +++ b/package/exim/exim.mk
> @@ -123,8 +123,8 @@ endif
>  define EXIM_BUILD_CMDS
>  	$(TARGET_MAKE_ENV) build=br $(MAKE) -C $(@D) makefile
>  	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)/build-br macro_predef \
> -		CC=$(HOSTCC) \
> -		LNCC=$(HOSTCC) \
> +		CC="$(HOSTCC)" \
> +		LNCC="$(HOSTCC)" \
>  		CFLAGS="-std=c99 $(HOST_CFLAGS)" \
>  		LFLAGS="-fPIC $(HOST_LDFLAGS)"
>  	$(TARGET_MAKE_ENV) build=br $(MAKE) -C $(@D) $(EXIM_STATIC_FLAGS) \
> -- 
> 2.27.0
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
