From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 5 Dec 2019 13:57:22 +0100
Subject: [Buildroot] [PATCH v2 6/9] package/connman: adapt to preset-all
In-Reply-To: <20191111172443.6874-7-jeremy.rosen@smile.fr>
References: <20191111172443.6874-1-jeremy.rosen@smile.fr>
 <20191111172443.6874-7-jeremy.rosen@smile.fr>
Message-ID: <20191205125722.GG2539@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?r?my, All,

On 2019-11-11 18:24 +0100, J?r?my Rosen spake thusly:
> connman has two services
> * connman.service which is the real daemon
> * connman-wait-online.service which is a sync point for network-online.target
> 
> Only the first one was enabled. This adaptation enables both.
> 
> Not enabling connman-wait-online.service is probably a bug

If that was not installed so far, what would provide for the
network-online.target instead? Or was that target always satisfied?

BTW, you forgot your SoB line too.

Reviewed-by: Yann E. MORIN <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/connman/connman.mk | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/package/connman/connman.mk b/package/connman/connman.mk
> index 839bc7a0e2..d70eb1ac82 100644
> --- a/package/connman/connman.mk
> +++ b/package/connman/connman.mk
> @@ -32,12 +32,6 @@ define CONNMAN_INSTALL_INIT_SYSV
>  	$(INSTALL) -m 0755 -D package/connman/S45connman $(TARGET_DIR)/etc/init.d/S45connman
>  endef
>  
> -define CONNMAN_INSTALL_INIT_SYSTEMD
> -	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
> -	ln -fs ../../../../usr/lib/systemd/system/connman.service \
> -		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/connman.service
> -endef
> -
>  ifeq ($(BR2_PACKAGE_CONNMAN_CLIENT),y)
>  CONNMAN_CONF_OPTS += --enable-client
>  CONNMAN_DEPENDENCIES += readline
> -- 
> 2.24.0.rc1
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
