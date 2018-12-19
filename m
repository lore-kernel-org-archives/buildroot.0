From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 19 Dec 2018 22:34:55 +0100
Subject: [Buildroot] [PATCH v2 3/4] openssh: use BR2_SYSTEM_DEFAULT_PATH
 as default PATH
In-Reply-To: <20181219210455.14754-4-mmayer@broadcom.com>
References: <20181219210455.14754-1-mmayer@broadcom.com>
 <20181219210455.14754-4-mmayer@broadcom.com>
Message-ID: <20181219213455.GQ24194@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Markus, All,

On 2018-12-19 13:04 -0800, Markus Mayer spake thusly:
> We use the configuration option $(BR2_SYSTEM_DEFAULT_PATH) to set the
> default PATH in OpenSSH sessions.
> 
> $(BR2_SYSTEM_DEFAULT_PATH) is a Kconfig string. So it is already
> quoted, which is exactly what we want.
> 
> Signed-off-by: Markus Mayer <mmayer@broadcom.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/openssh/openssh.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
> index 07f3e0d663f6..4ee7727fb9e8 100644
> --- a/package/openssh/openssh.mk
> +++ b/package/openssh/openssh.mk
> @@ -11,6 +11,7 @@ OPENSSH_LICENSE_FILES = LICENCE
>  OPENSSH_CONF_ENV = LD="$(TARGET_CC)" LDFLAGS="$(TARGET_CFLAGS)"
>  OPENSSH_CONF_OPTS = \
>  	--sysconfdir=/etc/ssh \
> +	--with-default-path=$(BR2_SYSTEM_DEFAULT_PATH) \
>  	--disable-lastlog \
>  	--disable-utmp \
>  	--disable-utmpx \
> -- 
> 2.17.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
