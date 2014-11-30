From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Nov 2014 18:48:04 +0100
Subject: [Buildroot] [PATCHv3 61/74] input-event-daemon: install
 configuration file unconditionally
In-Reply-To: <1417357142-14307-62-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1417357142-14307-62-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20141130174804.GQ4124@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-11-30 15:18 +0100, Thomas Petazzoni spake thusly:
> As discussed, users should use a rootfs overlay or a post-build script
> instead of a custom skeleton to override files installed by Buildroot,
> so there is no point in having conditions when installing init scripts
> or configuration files.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/input-event-daemon/input-event-daemon.mk | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/package/input-event-daemon/input-event-daemon.mk b/package/input-event-daemon/input-event-daemon.mk
> index 0bafdc4..67b8cc4 100644
> --- a/package/input-event-daemon/input-event-daemon.mk
> +++ b/package/input-event-daemon/input-event-daemon.mk
> @@ -18,9 +18,8 @@ endef
>  define INPUT_EVENT_DAEMON_INSTALL_TARGET_CMDS
>  	$(INSTALL) -m 755 -D $(@D)/input-event-daemon \
>  		$(TARGET_DIR)/usr/bin/input-event-daemon
> -	[ -f $(TARGET_DIR)/etc/input-event-daemon.conf ] || \
> -		$(INSTALL) -m 644 -D $(@D)/docs/sample.conf \
> -			$(TARGET_DIR)/etc/input-event-daemon.conf
> +	$(INSTALL) -m 644 -D $(@D)/docs/sample.conf \
> +		$(TARGET_DIR)/etc/input-event-daemon.conf
>  endef
>  
>  define INPUT_EVENT_DAEMON_INSTALL_INIT_SYSV
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
