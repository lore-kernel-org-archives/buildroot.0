From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 11 Jul 2015 00:30:12 +0200
Subject: [Buildroot] [PATCH 2/7 v2] libaio: add host variant
In-Reply-To: <1436458921-4199-3-git-send-email-sylvain.raybaud@green-communications.fr>
References: <1436458921-4199-1-git-send-email-sylvain.raybaud@green-communications.fr>
 <1436458921-4199-3-git-send-email-sylvain.raybaud@green-communications.fr>
Message-ID: <20150710223012.GD5469@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sylvain, All,

On 2015-07-09 18:21 +0200, Sylvain Raybaud spake thusly:
> host-libaio is needed to build host-mysql in its mariadb variant which is needed to build the target variant of mariadb.

Commit logs should be limited to ~80 chars. Otherwise:

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> Signed-off-by: Sylvain Raybaud <sylvain.raybaud@green-communications.fr>
> ---
> Changes v1 -> v2:
>   Explain why we need to build host-libaio in commit log (suggested by Yann E. Morin)
> 
>  package/libaio/libaio.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/libaio/libaio.mk b/package/libaio/libaio.mk
> index 53ad7eb..55e2cc7 100644
> --- a/package/libaio/libaio.mk
> +++ b/package/libaio/libaio.mk
> @@ -24,3 +24,4 @@ define LIBAIO_INSTALL_TARGET_CMDS
>  endef
>  
>  $(eval $(generic-package))
> +$(eval $(host-generic-package))
> -- 
> 1.9.1
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
