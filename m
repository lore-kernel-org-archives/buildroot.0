From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 6 Dec 2014 11:56:51 +0100
Subject: [Buildroot] [PATCH 2/3] fconfig: remove redundant CFLAGS/LDFLAGS
In-Reply-To: <1417859787-31970-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417859787-31970-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1417859787-31970-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20141206105651.GB3938@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-12-06 10:56 +0100, Thomas Petazzoni spake thusly:
> CFLAGS and LDFLAGS are already passed as part of
> $(TARGET_CONFIGURE_OPTS).
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/fconfig/fconfig.mk | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/package/fconfig/fconfig.mk b/package/fconfig/fconfig.mk
> index 7f7faad..509fc2c 100644
> --- a/package/fconfig/fconfig.mk
> +++ b/package/fconfig/fconfig.mk
> @@ -12,9 +12,7 @@ FCONFIG_LICENSE = GPLv2+
>  FCONFIG_LICENSE_FILES = fconfig.c
>  
>  define FCONFIG_BUILD_CMDS
> -	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
> -		CFLAGS="$(TARGET_CFLAGS)" \
> -		LDFLAGS="$(TARGET_LDFLAGS)"
> +	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
>  endef
>  
>  define FCONFIG_INSTALL_TARGET_CMDS
> -- 
> 2.1.0
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
