From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 28 Sep 2020 22:06:16 +0200
Subject: [Buildroot] [PATCH 1/2] package/zstd: avoid compilation during
 host-zstd install step
In-Reply-To: <20200928114228.23637-1-patrickdepinguin@gmail.com>
References: <20200928114228.23637-1-patrickdepinguin@gmail.com>
Message-ID: <20200928200616.GO11621@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2020-09-28 13:42 +0200, Thomas De Schampheleire spake thusly:
> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> 
> The host-zstd-build step was not actually compiling the library:
> 
> make[1]: Entering directory '/buildroot/output/build/host-zstd-1.4.5/lib'
> make[1]: Nothing to be done for 'default'.
> make[1]: Leaving directory '/buildroot/output/build/host-zstd-1.4.5/lib'
> 
> and the actual compilation was part of the install step.
> This is not how other Buildroot packages work.
> 
> Make sure to specify which library targets we want instead. The total amount
> of compiled files does not change with this patch.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/zstd/zstd.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
> index e2ba12b058..35002da332 100644
> --- a/package/zstd/zstd.mk
> +++ b/package/zstd/zstd.mk
> @@ -71,7 +71,7 @@ endef
>  # note: no 'HAVE_...' options for host library build only
>  define HOST_ZSTD_BUILD_CMDS
>  	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) \
> -		-C $(@D)/lib
> +		-C $(@D)/lib libzstd.a libzstd
>  	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) \
>  		-C $(@D) zstd
>  endef
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
