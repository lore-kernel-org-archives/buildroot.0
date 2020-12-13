From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Dec 2020 22:48:44 +0100
Subject: [Buildroot] [PATCH 1/1] package/mongoose: add mbedtls support
In-Reply-To: <20201213095215.206459-1-fontaine.fabrice@gmail.com>
References: <20201213095215.206459-1-fontaine.fabrice@gmail.com>
Message-ID: <20201213214844.GM3281876@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-12-13 10:52 +0100, Fabrice Fontaine spake thusly:
> mbedtls is supported since version 6.7 and
> https://github.com/cesanta/mongoose/commit/65e01dbabc1f458af5ad8984f6eb5cb01ebae284
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/mongoose/mongoose.mk | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/package/mongoose/mongoose.mk b/package/mongoose/mongoose.mk
> index 87f56d7894..5faeafb374 100644
> --- a/package/mongoose/mongoose.mk
> +++ b/package/mongoose/mongoose.mk
> @@ -16,7 +16,14 @@ MONGOOSE_CFLAGS = $(TARGET_CFLAGS)
>  
>  ifeq ($(BR2_PACKAGE_OPENSSL),y)
>  MONGOOSE_DEPENDENCIES += openssl
> -MONGOOSE_CFLAGS += -DMG_ENABLE_SSL
> +MONGOOSE_CFLAGS += \
> +	-DMG_ENABLE_SSL \
> +	-DMG_SSL_IF=MG_SSL_IF_OPENSSL
> +else ifeq ($(BR2_PACKAGE_MBEDTLS),y)
> +MONGOOSE_DEPENDENCIES += mbedtls
> +MONGOOSE_CFLAGS += \
> +	-DMG_ENABLE_SSL \
> +	-DMG_SSL_IF=MG_SSL_IF_MBEDTLS
>  endif
>  
>  define MONGOOSE_BUILD_CMDS
> -- 
> 2.29.2
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
