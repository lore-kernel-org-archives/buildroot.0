From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Nov 2014 18:30:52 +0100
Subject: [Buildroot] [PATCHv3 52/74] aiccu: install init script and
 config file unconditionally
In-Reply-To: <1417357142-14307-53-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1417357142-14307-53-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20141130173052.GH4124@free.fr>
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
>  package/aiccu/aiccu.mk | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/package/aiccu/aiccu.mk b/package/aiccu/aiccu.mk
> index 4413f86..faa861c 100644
> --- a/package/aiccu/aiccu.mk
> +++ b/package/aiccu/aiccu.mk
> @@ -28,14 +28,12 @@ endef
>  define AICCU_INSTALL_TARGET_CMDS
>  	$(INSTALL) -D -m 0755 $(@D)/unix-console/aiccu \
>  		$(TARGET_DIR)/usr/sbin/aiccu
> -	[ -f $(TARGET_DIR)/etc/aiccu.conf ] || \
> -		$(INSTALL) -D -m 0644 $(@D)/doc/aiccu.conf \
> +	$(INSTALL) -D -m 0644 $(@D)/doc/aiccu.conf \
>  		$(TARGET_DIR)/etc/aiccu.conf
>  endef
>  
>  define AICCU_INSTALL_INIT_SYSV
> -	[ -f $(TARGET_DIR)/etc/init.d/S50aiccu ] || \
> -		$(INSTALL) -D -m 0755 $(@D)/doc/aiccu.init \
> +	$(INSTALL) -D -m 0755 $(@D)/doc/aiccu.init \
>  		$(TARGET_DIR)/etc/init.d/S50aiccu
>  endef
>  
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
