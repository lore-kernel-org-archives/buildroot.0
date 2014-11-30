From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Nov 2014 16:41:31 +0100
Subject: [Buildroot] [PATCHv3 23/74] tftpd: use <pkg>_INSTALL_INIT_SYSV
 mechanism
In-Reply-To: <1417357142-14307-24-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1417357142-14307-24-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20141130154131.GB4124@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-11-30 15:18 +0100, Thomas Petazzoni spake thusly:
> Also make sure we use a full path for the destination of the
> $(INSTALL) command.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/tftpd/tftpd.mk | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/package/tftpd/tftpd.mk b/package/tftpd/tftpd.mk
> index 816a25e..2f746d0 100644
> --- a/package/tftpd/tftpd.mk
> +++ b/package/tftpd/tftpd.mk
> @@ -21,7 +21,10 @@ endif
>  define TFTPD_INSTALL_TARGET_CMDS
>  	$(INSTALL) -D $(@D)/tftp/tftp $(TARGET_DIR)/usr/bin/tftp
>  	$(INSTALL) -D $(@D)/tftpd/tftpd $(TARGET_DIR)/usr/sbin/tftpd
> -	$(INSTALL) -D package/tftpd/S80tftpd-hpa $(TARGET_DIR)/etc/init.d/
> +endef
> +
> +define TFTPD_INSTALL_INIT_SYSV
> +	$(INSTALL) -D package/tftpd/S80tftpd-hpa $(TARGET_DIR)/etc/init.d/S80tftpd-hpa

Missing the access rights -m 0755.

Regards,
Yann E. MORIN.

>  endef
>  
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
