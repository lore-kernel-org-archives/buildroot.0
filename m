From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 2 Dec 2015 22:52:56 +0100
Subject: [Buildroot] [PATCH 8/9] wireshark: add optional geoip support
In-Reply-To: <1449089301-29762-8-git-send-email-gustavo@zacarias.com.ar>
References: <1449089301-29762-1-git-send-email-gustavo@zacarias.com.ar>
 <1449089301-29762-8-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20151202215256.GH5773@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2015-12-02 17:48 -0300, Gustavo Zacarias spake thusly:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/wireshark/wireshark.mk | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
> index 0bc7801..534131b 100644
> --- a/package/wireshark/wireshark.mk
> +++ b/package/wireshark/wireshark.mk
> @@ -62,6 +62,13 @@ else
>  WIREHARK_CONF_OPTS += --without-c-ares
>  endif
>  
> +ifeq ($(BR2_PACKAGE_GEOIP),y)
> +WIRESHARK_CONF_OPTS += --with-geoip=$(STAGING_DIR)/usr

Is it needed to specify the path? Can't we just have;
    WIRESHARK_CONF_OPTS += --with-geoip

If the path is needed, then a little blrb in the commit log would be
nice.

And I forgot to add a similar comment for the --with-XXX=yes options.

Regards,
Yann E. MORIN.

> +WIRESHARK_DEPENDENCIES += geoip
> +else
> +WIRESHARK_CONF_OPTS += --without-geoip
> +endif
> +
>  ifeq ($(BR2_PACKAGE_GNUTLS),y)
>  WIRESHARK_CONF_OPTS += --with-gnutls=yes
>  WIRESHARK_DEPENDENCIES += gnutls
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
