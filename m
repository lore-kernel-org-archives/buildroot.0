From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 11 Mar 2020 22:13:03 +0100
Subject: [Buildroot] [PATCH 2/3] package/ifupdown-scripts: relocate the
 generation the interfaces file
In-Reply-To: <20200309025003.26466-3-unixmania@gmail.com>
References: <20200309025003.26466-1-unixmania@gmail.com>
 <20200309025003.26466-3-unixmania@gmail.com>
Message-ID: <20200311211303.GA705@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Carlos, All,

On 2020-03-08 23:50 -0300, unixmania at gmail.com spake thusly:
> From: Carlos Santos <unixmania@gmail.com>
> 
> Generate it in the IFUPDOWN_SCRIPTS_INSTALL_INIT_<FOO> hook. This will
> allow creating a file to configure an interface via DHCP for the openrc
> network service, in a forthcoming change.
> 
> Signed-off-by: Carlos Santos <unixmania@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/ifupdown-scripts/ifupdown-scripts.mk | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/package/ifupdown-scripts/ifupdown-scripts.mk b/package/ifupdown-scripts/ifupdown-scripts.mk
> index d387c530f1..16fef783dd 100644
> --- a/package/ifupdown-scripts/ifupdown-scripts.mk
> +++ b/package/ifupdown-scripts/ifupdown-scripts.mk
> @@ -32,13 +32,13 @@ define IFUPDOWN_SCRIPTS_INSTALL_TARGET_CMDS
>  	$(INSTALL) -m 0755 -D $(IFUPDOWN_SCRIPTS_PKGDIR)/nfs_check \
>  		$(TARGET_DIR)/etc/network/nfs_check
>  	$(call SYSTEM_RSYNC,$(IFUPDOWN_SCRIPTS_PKGDIR)/network,$(TARGET_DIR)/etc/network)
> -	$(IFUPDOWN_SCRIPTS_LOCALHOST)
> -	$(IFUPDOWN_SCRIPTS_DHCP)
>  endef
>  
>  define IFUPDOWN_SCRIPTS_INSTALL_INIT_SYSV
>  	$(INSTALL) -D -m 0755 $(IFUPDOWN_SCRIPTS_PKGDIR)/S40network \
>  		$(TARGET_DIR)/etc/init.d/S40network
> +	$(IFUPDOWN_SCRIPTS_LOCALHOST)
> +	$(IFUPDOWN_SCRIPTS_DHCP)
>  endef
>  
>  # ifupdown-scripts can not be selected when systemd-networkd is
> @@ -47,6 +47,8 @@ endef
>  define IFUPDOWN_SCRIPTS_INSTALL_INIT_SYSTEMD
>  	$(INSTALL) -D -m 644 $(IFUPDOWN_SCRIPTS_PKGDIR)/network.service \
>  		$(TARGET_DIR)/etc/systemd/system/network.service
> +	$(IFUPDOWN_SCRIPTS_LOCALHOST)
> +	$(IFUPDOWN_SCRIPTS_DHCP)
>  endef
>  
>  $(eval $(generic-package))
> -- 
> 2.18.2
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
