From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 5 Dec 2019 14:01:51 +0100
Subject: [Buildroot] [PATCH v2 8/9] package/network-manager: adapt to
 preset-all
In-Reply-To: <20191111172443.6874-9-jeremy.rosen@smile.fr>
References: <20191111172443.6874-1-jeremy.rosen@smile.fr>
 <20191111172443.6874-9-jeremy.rosen@smile.fr>
Message-ID: <20191205130151.GI2539@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?r?my, Nathaniel, All,

On 2019-11-11 18:24 +0100, J?r?my Rosen spake thusly:
> NM has three services
> * NetworkManger.service : the main daemon
> * NetworkManger-dispatcher.service : a daemon handling network callbacks
> * NetworkManager-wait-online.service : sync of other services with network-online
> 
> Only the first two were activated. We now also enable
> wait-online. Not enabling it was probably a bug.
> 
> Note that buildroot adds an alias dbus-org.freedesktop.NetworkManager
> Adding an alias that is not known upstream is not clean,
> but I left it for backward compatibility

Nathaniel, do you remember why you added that alias back in the day?
(yes, it's been 5 years now...)

I was not able to find any conlusive explanations with a cursory
duckduckgo search...

Reviewed-by: Yann E. MORIN <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/network-manager/network-manager.mk | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
> index e913d69927..9ec205cc04 100644
> --- a/package/network-manager/network-manager.mk
> +++ b/package/network-manager/network-manager.mk
> @@ -88,16 +88,9 @@ define NETWORK_MANAGER_INSTALL_INIT_SYSV
>  endef
>  
>  define NETWORK_MANAGER_INSTALL_INIT_SYSTEMD
> -	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
> -
>  	ln -sf /usr/lib/systemd/system/NetworkManager.service \
>  		$(TARGET_DIR)/etc/systemd/system/dbus-org.freedesktop.NetworkManager.service
>  
> -	ln -sf /usr/lib/systemd/system/NetworkManager.service \
> -		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/NetworkManager.service
> -
> -	ln -sf /usr/lib/systemd/system/NetworkManager-dispatcher.service \
> -		$(TARGET_DIR)/etc/systemd/system/dbus-org.freedesktop.nm-dispatcher.service
>  endef
>  
>  $(eval $(autotools-package))
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
