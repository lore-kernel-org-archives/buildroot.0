From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Nov 2014 15:56:52 +0100
Subject: [Buildroot] [PATCHv3 07/74] portmap: use
 <pkg>_INSTALL_INIT_SYSV mechanism
In-Reply-To: <1417357142-14307-8-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1417357142-14307-8-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20141130145652.GL4124@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-11-30 15:17 +0100, Thomas Petazzoni spake thusly:
> We also switch to using a full destination path as the second argument
> of $(INSTALL).
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/portmap/portmap.mk | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/package/portmap/portmap.mk b/package/portmap/portmap.mk
> index 0189597..dd60809 100644
> --- a/package/portmap/portmap.mk
> +++ b/package/portmap/portmap.mk
> @@ -30,8 +30,10 @@ define PORTMAP_INSTALL_TARGET_CMDS
>  		$(TARGET_DIR)/usr/share/man/man8/pmap_dump.8
>  	$(INSTALL) -D $(@D)/pmap_set.8 \
>  		$(TARGET_DIR)/usr/share/man/man8/pmap_set.8
> -	$(INSTALL) -m 0755 package/portmap/S13portmap \
> -		$(TARGET_DIR)/etc/init.d
> +endef
> +
> +define PORTMAP_INSTALL_INIT_SYSV
> +	$(INSTALL) -m 0755 package/portmap/S13portmap $(TARGET_DIR)/etc/init.d/S13portmap

Missing -D option.

Regards,
Yann E. MORIN.

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
