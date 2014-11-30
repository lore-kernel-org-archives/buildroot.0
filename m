From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Nov 2014 17:57:32 +0100
Subject: [Buildroot] [PATCHv3 26/74] at: use <pkg>_INSTALL_INIT_SYSV
 mechanism
In-Reply-To: <1417357142-14307-27-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1417357142-14307-27-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20141130165732.GF4124@free.fr>
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
>  package/at/at.mk | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/package/at/at.mk b/package/at/at.mk
> index 851a05b..1504e32 100644
> --- a/package/at/at.mk
> +++ b/package/at/at.mk
> @@ -21,10 +21,8 @@ AT_CONF_OPTS = \
>  	--with-daemon_groupname=root \
>  	SENDMAIL=/usr/sbin/sendmail
>  
> -define AT_INSTALL_INITSCRIPT
> +define AT_INSTALL_INIT_SYSV
>  	$(INSTALL) -m 0755 -D package/at/S99at $(TARGET_DIR)/etc/init.d/S99at
>  endef
>  
> -AT_POST_INSTALL_TARGET_HOOKS += AT_INSTALL_INITSCRIPT
> -
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
