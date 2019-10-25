From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 25 Oct 2019 15:51:31 +0200
Subject: [Buildroot] [PATCH 1/1] toolchain: install libssp.so from
 external toolchain
In-Reply-To: <20190920085623.8160-1-nolange79@gmail.com>
References: <20190920085623.8160-1-nolange79@gmail.com>
Message-ID: <20191025135131.GA10575@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Norbert, All,

On 2019-09-20 10:56 +0200, Norbert Lange spake thusly:
> Signed-off-by: Norbert Lange <nolange79@gmail.com>

This would have warranted a more detaield commit log.

But anyway, Yann had already submitted a similar patch series, which had
already received comments:
    https://patchwork.ozlabs.org/patch/1156470/

So I restarted from there, and respin another fixed up series:
    https://patchwork.ozlabs.org/patch/1184179/

As such, I've marked your patch as superseded.

Regards,
Yann E. MORIN.

>  toolchain/toolchain-external/pkg-toolchain-external.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
> index c3ddff263f..286913995a 100644
> --- a/toolchain/toolchain-external/pkg-toolchain-external.mk
> +++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
> @@ -112,7 +112,7 @@ endif
>  # Definitions of the list of libraries that should be copied to the target.
>  #
>  
> -TOOLCHAIN_EXTERNAL_LIBS += ld*.so* libgcc_s.so.* libatomic.so.*
> +TOOLCHAIN_EXTERNAL_LIBS += ld*.so* libgcc_s.so.* libatomic.so.* libssp.so.*
>  
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_GLIBC)$(BR2_TOOLCHAIN_EXTERNAL_UCLIBC),y)
>  TOOLCHAIN_EXTERNAL_LIBS += libc.so.* libcrypt.so.* libdl.so.* libm.so.* libnsl.so.* libresolv.so.* librt.so.* libutil.so.*
> -- 
> 2.23.0
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
