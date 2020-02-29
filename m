From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 29 Feb 2020 19:25:00 +0100
Subject: [Buildroot] [PATCH] package/openrc: fix post-install-target
 addition
In-Reply-To: <20200229181807.5462-1-unixmania@gmail.com>
References: <20200229181807.5462-1-unixmania@gmail.com>
Message-ID: <20200229182500.GT8743@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Carlos, All,

On 2020-02-29 15:18 -0300, unixmania at gmail.com spake thusly:
> From: Carlos Santos <unixmania@gmail.com>
> 
> OPENRC_POST_TARGET_INSTALL_HOOKS -> OPENRC_POST_INSTALL_TARGET_HOOKS
> 
> Signed-off-by: Carlos Santos <unixmania@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/openrc/openrc.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/openrc/openrc.mk b/package/openrc/openrc.mk
> index 3f6453cef5..289bde4d03 100644
> --- a/package/openrc/openrc.mk
> +++ b/package/openrc/openrc.mk
> @@ -47,7 +47,7 @@ define OPENRC_NO_NET
>  	$(RM) $(TARGET_DIR)/etc/init.d/{network,staticroute,loopback}
>  	$(RM) $(TARGET_DIR)/etc/conf.d/{network,staticroute,loopback}
>  endef
> -OPENRC_POST_TARGET_INSTALL_HOOKS += OPENRC_NO_NET
> +OPENRC_POST_INSTALL_TARGET_HOOKS += OPENRC_NO_NET
>  endif
>  
>  define OPENRC_REMOVE_UNNEEDED
> -- 
> 2.18.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
