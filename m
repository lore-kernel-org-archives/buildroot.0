From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 12 Mar 2016 23:44:35 +0100
Subject: [Buildroot] [PATCH] dnsmasq: re-enable parallel builds
In-Reply-To: <1457718040-5459-1-git-send-email-gustavo@zacarias.com.ar>
References: <1457718040-5459-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160312224435.GG3745@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2016-03-11 14:40 -0300, Gustavo Zacarias spake thusly:
> They don't seem to be causing any issues after many bumps and tests.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/dnsmasq/dnsmasq.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
> index b3e8c4c..7fb1200 100644
> --- a/package/dnsmasq/dnsmasq.mk
> +++ b/package/dnsmasq/dnsmasq.mk
> @@ -90,7 +90,7 @@ define DNSMASQ_BUILD_CMDS
>  	$(DNSMASQ_ENABLE_DBUS)
>  	$(DNSMASQ_ENABLE_LUA)
>  	$(DNSMASQ_ENABLE_CONNTRACK)
> -	$(DNSMASQ_MAKE_ENV) $(MAKE1) -C $(@D) $(DNSMASQ_MAKE_OPTS) all$(DNSMASQ_I18N)
> +	$(DNSMASQ_MAKE_ENV) $(MAKE) -C $(@D) $(DNSMASQ_MAKE_OPTS) all$(DNSMASQ_I18N)
>  endef
>  
>  ifeq ($(BR2_PACKAGE_DBUS),y)
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
