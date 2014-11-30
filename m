From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Nov 2014 19:07:27 +0100
Subject: [Buildroot] [PATCHv3 68/74] sysklogd: install configuration
 file unconditionally
In-Reply-To: <1417357142-14307-69-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1417357142-14307-69-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20141130180727.GX4124@free.fr>
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
>  package/sysklogd/sysklogd.mk | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/package/sysklogd/sysklogd.mk b/package/sysklogd/sysklogd.mk
> index 2b60b45..1e8652d 100644
> --- a/package/sysklogd/sysklogd.mk
> +++ b/package/sysklogd/sysklogd.mk
> @@ -21,10 +21,8 @@ endef
>  define SYSKLOGD_INSTALL_TARGET_CMDS
>  	$(INSTALL) -D -m 0500 $(@D)/syslogd $(TARGET_DIR)/sbin/syslogd
>  	$(INSTALL) -D -m 0500 $(@D)/klogd $(TARGET_DIR)/sbin/klogd
> -	if [ ! -f $(TARGET_DIR)/etc/syslog.conf ]; then \
> -		$(INSTALL) -D -m 0644 package/sysklogd/syslog.conf \
> -			$(TARGET_DIR)/etc/syslog.conf; \
> -	fi
> +	$(INSTALL) -D -m 0644 package/sysklogd/syslog.conf \
> +		$(TARGET_DIR)/etc/syslog.conf; \
>  endef
>  
>  define SYSKLOGD_INSTALL_INIT_SYSV
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
