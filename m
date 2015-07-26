From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 26 Jul 2015 22:08:48 +0200
Subject: [Buildroot] [PATCH 1/4] aiccu: remove redundant --static flag
	to pkg-config
In-Reply-To: <1437937112-13269-1-git-send-email-patrickdepinguin@gmail.com>
References: <1437937112-13269-1-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <20150726200848.GL3770@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-07-26 20:58 +0200, Thomas De Schampheleire spake thusly:
> From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> 
> The pkg-config tool is automatically passing --static when BR2_STATIC_LIBS
> is set (see package/pkgconf/pkgconf.mk), so no need to pass it explicitly
> from package .mk files.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/aiccu/aiccu.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/aiccu/aiccu.mk b/package/aiccu/aiccu.mk
> index fc328fd..60d65dd 100644
> --- a/package/aiccu/aiccu.mk
> +++ b/package/aiccu/aiccu.mk
> @@ -16,7 +16,7 @@ AICCU_LFDLAGS = $(TARGET_LDFLAGS)
>  # aiccu forgets to link with gnutls' dependencies breaking the build when
>  # linking statically
>  ifeq ($(BR2_STATIC_LIBS),y)
> -AICCU_LDFLAGS += `$(PKG_CONFIG_HOST_BINARY) --static --libs gnutls`
> +AICCU_LDFLAGS += `$(PKG_CONFIG_HOST_BINARY) --libs gnutls`
>  endif
>  
>  # dummy RPM_OPT_FLAGS to disable stripping
> -- 
> 1.8.5.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
