From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 13 Nov 2019 19:56:44 +0100
Subject: [Buildroot] [PATCH 02/11] package/connman: clarify license of
 client code
In-Reply-To: <20191113151724.12155-3-peter@korsgaard.com>
References: <20191113151724.12155-1-peter@korsgaard.com>
 <20191113151724.12155-3-peter@korsgaard.com>
Message-ID: <20191113185644.GK3419@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2019-11-13 16:17 +0100, Peter Korsgaard spake thusly:
> While the core connman code is licensed under GPL-2.0, the client code is
> GPL-2.0+ for compatibility with readline (which is GPL-3.0+).
> 
> Extend the _LICENSE with this info to clarify that linking against
> readline is OK licensing wise.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.

It's a pity they do not have a license file for it, though...

Regards,
Yann E. MORIN.

> ---
>  package/connman/connman.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/connman/connman.mk b/package/connman/connman.mk
> index 839bc7a0e2..7ca49726dd 100644
> --- a/package/connman/connman.mk
> +++ b/package/connman/connman.mk
> @@ -39,6 +39,7 @@ define CONNMAN_INSTALL_INIT_SYSTEMD
>  endef
>  
>  ifeq ($(BR2_PACKAGE_CONNMAN_CLIENT),y)
> +CONNMAN_LICENSE += , GPL-2.0+ (client)
>  CONNMAN_CONF_OPTS += --enable-client
>  CONNMAN_DEPENDENCIES += readline
>  
> -- 
> 2.20.1
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
