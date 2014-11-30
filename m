From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Nov 2014 16:28:45 +0100
Subject: [Buildroot] [PATCHv3 17/74] netatalk: use
 <pkg>_INSTALL_INIT_SYSV mechanism
In-Reply-To: <1417357142-14307-18-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1417357142-14307-18-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20141130152845.GV4124@free.fr>
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
>  package/netatalk/netatalk.mk | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/package/netatalk/netatalk.mk b/package/netatalk/netatalk.mk
> index 5ea55c2..6c1b640 100644
> --- a/package/netatalk/netatalk.mk
> +++ b/package/netatalk/netatalk.mk
> @@ -50,12 +50,9 @@ else
>  	NETATALK_CONF_OPTS += --disable-cups
>  endif
>  
> -define NETATALK_INSTALL_EXTRA_FILES
> -	[ -f $(TARGET_DIR)/etc/init.d/S50netatalk ] || \
> -		$(INSTALL) -m 0755 -D package/netatalk/S50netatalk \
> -			$(TARGET_DIR)/etc/init.d/S50netatalk
> +define NETATALK_INSTALL_INIT_SYSV
> +	$(INSTALL) -m 0755 -D package/netatalk/S50netatalk \
> +		$(TARGET_DIR)/etc/init.d/S50netatalk
>  endef
>  
> -NETATALK_POST_INSTALL_TARGET_HOOKS += NETATALK_INSTALL_EXTRA_FILES
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
