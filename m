From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 2 Jan 2015 15:59:04 +0100
Subject: [Buildroot] [PATCH] libevent: add optional dependency on OpenSSL
In-Reply-To: <1420112396-7686-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1420112396-7686-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150102145904.GB4392@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-01-01 12:39 +0100, Thomas Petazzoni spake thusly:
> libevent can optionally use OpenSSL, so add an optional dependency on
> this package to explicit this possibility. This makes sure libevent
> always gets built with OpenSSL support when the OpenSSL package is
> enabled.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/libevent/libevent.mk | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/package/libevent/libevent.mk b/package/libevent/libevent.mk
> index 607b7b2..30fcb5a 100644
> --- a/package/libevent/libevent.mk
> +++ b/package/libevent/libevent.mk
> @@ -22,5 +22,12 @@ ifneq ($(BR2_PACKAGE_PYTHON),y)
>  LIBEVENT_POST_INSTALL_TARGET_HOOKS += LIBEVENT_REMOVE_PYSCRIPT
>  endif
>  
> +ifeq ($(BR2_PACKAGE_OPENSSL),y)
> +LIBEVENT_DEPENDENCIES += openssl
> +LIBEVENT_CONF_OPTS += --enable-openssl
> +else
> +LIBEVENT_CONF_OPTS += --disable-openssl
> +endif
> +
>  $(eval $(autotools-package))
>  $(eval $(host-autotools-package))
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
