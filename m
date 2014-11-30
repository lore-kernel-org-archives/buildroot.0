From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Nov 2014 16:11:09 +0100
Subject: [Buildroot] [PATCHv3 14/74] input-event-daemon: use
 <pkg>_INSTALL_INIT_SYSV mechanism
In-Reply-To: <1417357142-14307-15-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1417357142-14307-15-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20141130151109.GS4124@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-11-30 15:18 +0100, Thomas Petazzoni spake thusly:
> Also makes the installation of the init script unconditional.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/input-event-daemon/input-event-daemon.mk | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/package/input-event-daemon/input-event-daemon.mk b/package/input-event-daemon/input-event-daemon.mk
> index 534fe90..0bafdc4 100644
> --- a/package/input-event-daemon/input-event-daemon.mk
> +++ b/package/input-event-daemon/input-event-daemon.mk
> @@ -21,9 +21,11 @@ define INPUT_EVENT_DAEMON_INSTALL_TARGET_CMDS
>  	[ -f $(TARGET_DIR)/etc/input-event-daemon.conf ] || \
>  		$(INSTALL) -m 644 -D $(@D)/docs/sample.conf \
>  			$(TARGET_DIR)/etc/input-event-daemon.conf
> -	[ -f $(TARGET_DIR)/etc/init.d/S99input-event-daemon ] || \
> -		$(INSTALL) -m 0755 -D package/input-event-daemon/S99input-event-daemon \
> -			$(TARGET_DIR)/etc/init.d/S99input-event-daemon
> +endef
> +
> +define INPUT_EVENT_DAEMON_INSTALL_INIT_SYSV
> +	$(INSTALL) -m 0755 -D package/input-event-daemon/S99input-event-daemon \
> +		$(TARGET_DIR)/etc/init.d/S99input-event-daemon
>  endef
>  
>  $(eval $(generic-package))
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
