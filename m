From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Nov 2014 16:46:33 +0100
Subject: [Buildroot] [PATCHv3 25/74] tinyhttpd: use
 <pkg>_INSTALL_INIT_SYSV mechanism
In-Reply-To: <1417357142-14307-26-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1417357142-14307-26-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20141130154633.GD4124@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-11-30 15:18 +0100, Thomas Petazzoni spake thusly:
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/tinyhttpd/tinyhttpd.mk | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/package/tinyhttpd/tinyhttpd.mk b/package/tinyhttpd/tinyhttpd.mk
> index ec47fd9..0934b71 100644
> --- a/package/tinyhttpd/tinyhttpd.mk
> +++ b/package/tinyhttpd/tinyhttpd.mk
> @@ -16,9 +16,12 @@ endef
>  
>  define TINYHTTPD_INSTALL_TARGET_CMDS
>  	$(INSTALL) -m 0755 -D $(@D)/httpd $(TARGET_DIR)/usr/sbin/tinyhttpd
> +	mkdir -p $(TARGET_DIR)/var/www
> +endef
> +
> +define TINYHTTPD_INSTALL_INIT_SYSV
>  	$(INSTALL) -m 0755 -D package/tinyhttpd/S85tinyhttpd \
>  		$(TARGET_DIR)/etc/init.d/S85tinyhttpd
> -	mkdir -p $(TARGET_DIR)/var/www
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
