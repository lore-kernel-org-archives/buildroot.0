From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Nov 2014 15:46:04 +0100
Subject: [Buildroot] [PATCHv3 02/74] vsftpd: don't install manpages
In-Reply-To: <1417357142-14307-3-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1417357142-14307-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20141130144604.GG4124@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-11-30 15:17 +0100, Thomas Petazzoni spake thusly:
> Installing manpages to the target is quite useless, since we don't
> support installing documentation on the target.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/vsftpd/vsftpd.mk | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/package/vsftpd/vsftpd.mk b/package/vsftpd/vsftpd.mk
> index 1c468ed..b94328d 100644
> --- a/package/vsftpd/vsftpd.mk
> +++ b/package/vsftpd/vsftpd.mk
> @@ -49,10 +49,6 @@ endef
>  
>  define VSFTPD_INSTALL_TARGET_CMDS
>  	$(INSTALL) -D -m 755 $(@D)/vsftpd $(TARGET_DIR)/usr/sbin/vsftpd
> -	$(INSTALL) -D -m 644 $(@D)/vsftpd.8 \
> -		$(TARGET_DIR)/usr/share/man/man8/vsftpd.8
> -	$(INSTALL) -D -m 644 $(@D)/vsftpd.conf.5 \
> -		$(TARGET_DIR)/usr/share/man/man5/vsftpd.conf.5
>  	test -f $(TARGET_DIR)/etc/vsftpd.conf || \
>  		$(INSTALL) -D -m 644 $(@D)/vsftpd.conf \
>  			$(TARGET_DIR)/etc/vsftpd.conf
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
