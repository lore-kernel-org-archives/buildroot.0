From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 2 Dec 2015 22:08:51 +0100
Subject: [Buildroot] [PATCH 5/9] wireshark: add optional c-ares support
In-Reply-To: <1449089301-29762-5-git-send-email-gustavo@zacarias.com.ar>
References: <1449089301-29762-1-git-send-email-gustavo@zacarias.com.ar>
 <1449089301-29762-5-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20151202210851.GD5773@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2015-12-02 17:48 -0300, Gustavo Zacarias spake thusly:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/wireshark/wireshark.mk | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
> index d60f3b4..2940d26 100644
> --- a/package/wireshark/wireshark.mk
> +++ b/package/wireshark/wireshark.mk
> @@ -57,6 +57,13 @@ ifeq ($(BR2_PACKAGE_LIBGTK2)$(BR2_PACKAGE_LIBGTK3)$(BR2_PACKAGE_QT5BASE_WIDGETS)
>  WIRESHARK_CONF_OPTS += --disable-wireshark
>  endif
>  
> +ifeq ($(BR2_PACKAGE_C_ARES),y)
> +WIRESHARK_CONF_OPTS += --with-c-ares=$(STAGING_DIR)/usr
> +WIRESHARK_DEPENDENCIES += c-ares
> +else
> +WIREHARK_CONF_OPTS += --without-c-ares
> +endif
> +
>  ifeq ($(BR2_PACKAGE_LIBNL),y)
>  WIRESHARK_CONF_OPTS += --with-libnl
>  WIRESHARK_DEPENDENCIES += libnl
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
