From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Nov 2014 18:43:59 +0100
Subject: [Buildroot] [PATCHv3 57/74] rpcbind: install init script
 unconditionally
In-Reply-To: <1417357142-14307-58-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1417357142-14307-58-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20141130174359.GM4124@free.fr>
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
>  package/rpcbind/rpcbind.mk | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/package/rpcbind/rpcbind.mk b/package/rpcbind/rpcbind.mk
> index b7c2261..55de3fc 100644
> --- a/package/rpcbind/rpcbind.mk
> +++ b/package/rpcbind/rpcbind.mk
> @@ -17,9 +17,8 @@ RPCBIND_DEPENDENCIES += libtirpc
>  RPCBIND_CONF_OPTS += --with-rpcuser=root
>  
>  define RPCBIND_INSTALL_INIT_SYSV
> -	[ -f $(TARGET_DIR)/etc/init.d/S30rpcbind ] || \
> -		$(INSTALL) -m 0755 -D package/rpcbind/S30rpcbind \
> -			$(TARGET_DIR)/etc/init.d/S30rpcbind
> +	$(INSTALL) -m 0755 -D package/rpcbind/S30rpcbind \
> +		$(TARGET_DIR)/etc/init.d/S30rpcbind
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
