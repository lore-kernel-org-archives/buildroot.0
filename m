From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 17 Jan 2018 19:16:37 +0100
Subject: [Buildroot] [PATCH] toolchain/toolchain-external: libatomic
 should also be copied for musl toolchains
In-Reply-To: <20180116224808.1630-1-thomas.petazzoni@free-electrons.com>
References: <20180116224808.1630-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20180117181637.GA11009@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2018-01-16 23:48 +0100, Thomas Petazzoni spake thusly:
> libatomic, like libgcc_s, is provided by gcc, so there is no reason to
> copy it over only for the glibc and uclibc cases, it should also be
> copied for the musl case. Without this, a program linked with
> libatomic on a musl system will fail to run due to the missing
> library.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  toolchain/toolchain-external/pkg-toolchain-external.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
> index b9ad1720a1..3bf9fac412 100644
> --- a/toolchain/toolchain-external/pkg-toolchain-external.mk
> +++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
> @@ -108,10 +108,10 @@ endif
>  # Definitions of the list of libraries that should be copied to the target.
>  #
>  
> -TOOLCHAIN_EXTERNAL_LIBS += ld*.so* libgcc_s.so.*
> +TOOLCHAIN_EXTERNAL_LIBS += ld*.so* libgcc_s.so.* libatomic.so.*
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_GLIBC)$(BR2_TOOLCHAIN_EXTERNAL_UCLIBC),y)
> -TOOLCHAIN_EXTERNAL_LIBS += libatomic.so.* libc.so.* libcrypt.so.* libdl.so.* libm.so.* libnsl.so.* libresolv.so.* librt.so.* libutil.so.*
> +TOOLCHAIN_EXTERNAL_LIBS += libc.so.* libcrypt.so.* libdl.so.* libm.so.* libnsl.so.* libresolv.so.* librt.so.* libutil.so.*
>  ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
>  TOOLCHAIN_EXTERNAL_LIBS += libpthread.so.*
>  ifneq ($(BR2_PACKAGE_GDB)$(BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY),)
> -- 
> 2.14.3
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
