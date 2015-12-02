From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 2 Dec 2015 22:43:35 +0100
Subject: [Buildroot] [PATCH 7/9] wireshark: add optional gnutls support
In-Reply-To: <1449089301-29762-7-git-send-email-gustavo@zacarias.com.ar>
References: <1449089301-29762-1-git-send-email-gustavo@zacarias.com.ar>
 <1449089301-29762-7-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20151202214334.GG5773@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2015-12-02 17:48 -0300, Gustavo Zacarias spake thusly:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/wireshark/wireshark.mk | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
> index cc9fb41..0bc7801 100644
> --- a/package/wireshark/wireshark.mk
> +++ b/package/wireshark/wireshark.mk
> @@ -22,7 +22,6 @@ WIRESHARK_CONF_OPTS = \
>  	--without-krb5 \
>  	--disable-usr-local \
>  	--enable-static=no \
> -	--with-gnutls=no \
>  	--with-libsmi=no \
>  	--with-lua=no \
>  	--includedir=$(STAGING_DIR)/usr/include
> @@ -63,6 +62,13 @@ else
>  WIREHARK_CONF_OPTS += --without-c-ares
>  endif
>  
> +ifeq ($(BR2_PACKAGE_GNUTLS),y)
> +WIRESHARK_CONF_OPTS += --with-gnutls=yes
> +WIRESHARK_DEPENDENCIES += gnutls
> +else
> +WIRESHARK_CONF_OPTS += --with-gnutls=no
> +endif
> +
>  ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
>  WIRESHARK_CONF_ENV = LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config
>  WIRESHARK_CONF_OPTS += --with-gcrypt=yes
> -- 
> 2.4.10
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
