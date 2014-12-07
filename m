From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 7 Dec 2014 21:28:15 +0100
Subject: [Buildroot] [PATCH v2] rp-pppoe: install helper scripts
In-Reply-To: <1417848158-5198-1-git-send-email-bluemrp9@gmail.com>
References: <1417848158-5198-1-git-send-email-bluemrp9@gmail.com>
Message-ID: <20141207202815.GC3902@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ryan, All,

On 2014-12-05 22:42 -0800, Ryan Coe spake thusly:
> Signed-off-by: Ryan Coe <bluemrp9@gmail.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> Changes v1 -> v2:
>   - add missing pppoe-status script to install list
>  package/rp-pppoe/rp-pppoe.mk | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/package/rp-pppoe/rp-pppoe.mk b/package/rp-pppoe/rp-pppoe.mk
> index 70b4437..5cb4960 100644
> --- a/package/rp-pppoe/rp-pppoe.mk
> +++ b/package/rp-pppoe/rp-pppoe.mk
> @@ -11,6 +11,8 @@ RP_PPPOE_LICENSE_FILES = doc/LICENSE
>  RP_PPPOE_DEPENDENCIES = pppd
>  RP_PPPOE_SUBDIR = src
>  RP_PPPOE_TARGET_FILES = pppoe pppoe-server pppoe-relay pppoe-sniff
> +RP_PPPOE_TARGET_SCRIPTS = pppoe-connect pppoe-init pppoe-setup pppoe-start \
> +	pppoe-status pppoe-stop
>  RP_PPPOE_MAKE_OPTS = PLUGIN_DIR=/usr/lib/pppd/$(PPPD_VERSION)
>  RP_PPPOE_CONF_OPTS = --disable-debugging
>  RP_PPPOE_CONF_ENV = \
> @@ -23,6 +25,9 @@ define RP_PPPOE_INSTALL_TARGET_CMDS
>  	for ff in $(RP_PPPOE_TARGET_FILES); do \
>  		$(INSTALL) -m 0755 $(@D)/src/$$ff $(TARGET_DIR)/usr/sbin/$$ff || exit 1; \
>  	done
> +	for ff in $(RP_PPPOE_TARGET_SCRIPTS); do \
> +		$(INSTALL) -m 0755 $(@D)/scripts/$$ff $(TARGET_DIR)/usr/sbin/$$ff || exit 1; \
> +	done
>  endef
>  
>  $(eval $(autotools-package))
> -- 
> 2.2.0
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
