From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 19 Dec 2018 22:38:18 +0100
Subject: [Buildroot] [PATCH v2 4/4] dropbear: use
 BR2_SYSTEM_DEFAULT_PATH as default PATH
In-Reply-To: <20181219210455.14754-5-mmayer@broadcom.com>
References: <20181219210455.14754-1-mmayer@broadcom.com>
 <20181219210455.14754-5-mmayer@broadcom.com>
Message-ID: <20181219213818.GR24194@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Markus, All,

On 2018-12-19 13:04 -0800, Markus Mayer spake thusly:
> We use the configuration option $(BR2_SYSTEM_DEFAULT_PATH) to set the
> default PATH in dropbear sessions.
> 
> $(BR2_SYSTEM_DEFAULT_PATH) is a Kconfig string. So it is already
> quoted, which is exactly what we want.
> 
> Signed-off-by: Markus Mayer <mmayer@broadcom.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/dropbear/dropbear.mk | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
> index 7b1468cfb100..a5a8243bd431 100644
> --- a/package/dropbear/dropbear.mk
> +++ b/package/dropbear/dropbear.mk
> @@ -81,6 +81,12 @@ define DROPBEAR_DISABLE_STANDALONE
>  	echo '#define NON_INETD_MODE 0'                 >> $(@D)/localoptions.h
>  endef
>  
> +define DROPBEAR_CUSTOM_PATH
> +	echo '#define DEFAULT_PATH $(BR2_SYSTEM_DEFAULT_PATH)' >>$(@D)/localoptions.h
> +endef
> +
> +DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_CUSTOM_PATH
> +
>  define DROPBEAR_INSTALL_INIT_SYSTEMD
>  	$(INSTALL) -D -m 644 package/dropbear/dropbear.service \
>  		$(TARGET_DIR)/usr/lib/systemd/system/dropbear.service
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
