From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Nov 2014 18:46:28 +0100
Subject: [Buildroot] [PATCHv3 59/74] transmission: install init script
 unconditionally
In-Reply-To: <1417357142-14307-60-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1417357142-14307-60-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20141130174628.GO4124@free.fr>
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

Acked-by: ME

Regards,
Yann E. MORIN.

> ---
>  package/transmission/transmission.mk | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/package/transmission/transmission.mk b/package/transmission/transmission.mk
> index 27ad9d9..b8a5c42 100644
> --- a/package/transmission/transmission.mk
> +++ b/package/transmission/transmission.mk
> @@ -37,9 +37,8 @@ ifeq ($(BR2_PACKAGE_TRANSMISSION_DAEMON),y)
>  	TRANSMISSION_CONF_OPTS += --enable-daemon
>  
>  define TRANSMISSION_INSTALL_INIT_SYSV
> -	[ -f $(TARGET_DIR)/etc/init.d/S92transmission ] || \
> -		$(INSTALL) -m 0755 -D package/transmission/S92transmission \
> -			$(TARGET_DIR)/etc/init.d/S92transmission
> +	$(INSTALL) -m 0755 -D package/transmission/S92transmission \
> +		$(TARGET_DIR)/etc/init.d/S92transmission
>  endef
>  
>  else
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
