From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 5 Nov 2015 21:29:26 +0100
Subject: [Buildroot] [PATCH v2] toolchain/external:: Fix gdbserver
 install with linaro 2015.08
In-Reply-To: <1446754352.4553.10.camel@rtred1test09.kymeta.local>
References: <1446752721.4553.8.camel@rtred1test09.kymeta.local>
 <20151105195529.GC3781@free.fr>
 <1446754352.4553.10.camel@rtred1test09.kymeta.local>
Message-ID: <20151105202926.GD3781@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Trent, All,

On 2015-11-05 20:12 +0000, Trent Piepho spake thusly:
> It's now in bin/gdbserver from the install dir of the toolchain.

You could have said:

    In the latest Linaro toolchain, the gdbserver has moved (surprise!)
    and is now located side-by-side with the toolchain executables.

    And this path as a new location where to search for a gdbserver.

    Note: wrapping the long line at the same time.

;-)

> Signed-off-by: Trent Piepho <tpiepho@kymetacorp.com>

Otherwise:

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  toolchain/toolchain-external/toolchain-external.mk | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
> index 958ab18..613ce50 100644
> --- a/toolchain/toolchain-external/toolchain-external.mk
> +++ b/toolchain/toolchain-external/toolchain-external.mk
> @@ -645,7 +645,10 @@ define TOOLCHAIN_EXTERNAL_INSTALL_TARGET_LIBS
>  	if test "$(BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY)" = "y"; then \
>  		$(call MESSAGE,"Copying gdbserver") ; \
>  		gdbserver_found=0 ; \
> -		for d in $${ARCH_SYSROOT_DIR}/usr $${ARCH_SYSROOT_DIR}/../debug-root/usr $${ARCH_SYSROOT_DIR}/usr/$${ARCH_LIB_DIR} ; do \
> +		for d in $${ARCH_SYSROOT_DIR}/usr \
> +			 $${ARCH_SYSROOT_DIR}/../debug-root/usr \
> +			 $${ARCH_SYSROOT_DIR}/usr/$${ARCH_LIB_DIR} \
> +			 $(TOOLCHAIN_EXTERNAL_INSTALL_DIR); do \
>  			if test -f $${d}/bin/gdbserver ; then \
>  				install -m 0755 -D $${d}/bin/gdbserver $(TARGET_DIR)/usr/bin/gdbserver ; \
>  				gdbserver_found=1 ; \
> -- 
> 1.8.3.1
> 
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
