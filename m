From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Nov 2014 15:48:48 +0100
Subject: [Buildroot] [PATCHv3 05/74] thttpd: use the
 <pkg>_INSTALL_INIT_SYSV mechanism
In-Reply-To: <1417357142-14307-6-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1417357142-14307-6-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20141130144848.GJ4124@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-11-30 15:17 +0100, Thomas Petazzoni spake thusly:
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/thttpd/thttpd.mk | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/package/thttpd/thttpd.mk b/package/thttpd/thttpd.mk
> index 70a90fd..1a028c8 100644
> --- a/package/thttpd/thttpd.mk
> +++ b/package/thttpd/thttpd.mk
> @@ -31,8 +31,6 @@ define THTTPD_INSTALL_TARGET_CMDS
>  	$(INSTALL) -D -m 0755 $(@D)/scripts/thttpd_wrapper $(TARGET_DIR)/usr/sbin/thttpd_wrapper
>  	$(SED) 's:/usr/local/sbin:/usr/sbin:g' -e \
>  		's:/usr/local/www:/var/www:g' $(TARGET_DIR)/usr/sbin/thttpd_wrapper
> -	$(INSTALL) -D -m 0755 $(@D)/scripts/thttpd.sh $(TARGET_DIR)/etc/init.d/S90thttpd
> -	$(SED) 's:/usr/local/sbin:/usr/sbin:g' $(TARGET_DIR)/etc/init.d/S90thttpd
>  	$(INSTALL) -d $(TARGET_DIR)/var/www/data
>  	$(INSTALL) -d $(TARGET_DIR)/var/www/logs
>  	echo "dir=/var/www/data" > $(TARGET_DIR)/var/www/thttpd_config
> @@ -41,4 +39,9 @@ define THTTPD_INSTALL_TARGET_CMDS
>  	echo "pidfile=/var/run/thttpd.pid" >> $(TARGET_DIR)/var/www/thttpd_config
>  endef
>  
> +define THTTPD_INSTALL_INIT_SYSV
> +	$(INSTALL) -D -m 0755 $(@D)/scripts/thttpd.sh $(TARGET_DIR)/etc/init.d/S90thttpd
> +	$(SED) 's:/usr/local/sbin:/usr/sbin:g' $(TARGET_DIR)/etc/init.d/S90thttpd
> +endef
> +
>  $(eval $(autotools-package))
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
