From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 4 Jul 2018 21:57:25 +0200
Subject: [Buildroot] [PATCH 1/1] systemd: Fix polkit build order
In-Reply-To: <20180704150251.1105-1-asgeir@appdynamic.com>
References: <20180704150251.1105-1-asgeir@appdynamic.com>
Message-ID: <20180704195725.GD2595@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Asgeir, All,

On 2018-07-04 15:02 +0000, Asgeir Bjarni Ingvarsson spake thusly:
> We need to install polkit before systemd if we want to enable
> polkit integration, because systemd will not install polkit
> policy files unless it finds polkit-gobject-1.
> 
> Signed-off-by: Asgeir Bjarni Ingvarsson <asgeir@appdynamic.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/systemd/systemd.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index 10e11a9277..04775ee778 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -283,6 +283,7 @@ endif
>  
>  ifeq ($(BR2_PACKAGE_SYSTEMD_POLKIT),y)
>  SYSTEMD_CONF_OPTS += -Dpolkit=true
> +SYSTEMD_DEPENDENCIES += polkit
>  else
>  SYSTEMD_CONF_OPTS += -Dpolkit=false
>  endif
> -- 
> 2.16.4
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
