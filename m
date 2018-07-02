From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 3 Jul 2018 00:06:06 +0200
Subject: [Buildroot] [PATCH v3 13/22] package/x11r7/xserver_xorg-server:
 switch to xorgproto
In-Reply-To: <20180630110853.29339-14-bernd.kuhls@t-online.de>
References: <20180630110853.29339-1-bernd.kuhls@t-online.de>
 <20180630110853.29339-14-bernd.kuhls@t-online.de>
Message-ID: <20180702220606.GS2604@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2018-06-30 13:08 +0200, Bernd Kuhls spake thusly:
> The new package xorgproto will combine and replace all current xproto_*
> packages. For details read
> https://lists.x.org/archives/xorg-announce/2018-February/002835.html
> 
> Removed special handling for various xproto packages because xorgproto
> always installs all available protocols.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[--SNIP--]
> diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
> index d605a2c742..79cf94dfed 100644
> --- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
> +++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
[--SNIP--]
> @@ -188,13 +164,6 @@ else
>  XSERVER_XORG_SERVER_CONF_OPTS += --disable-libunwind
>  endif
>  
> -ifeq ($(BR2_PACKAGE_XPROTO_RECORDPROTO),y)
> -XSERVER_XORG_SERVER_DEPENDENCIES += xproto_recordproto
> -XSERVER_XORG_SERVER_CONF_OPTS += --enable-record
> -else
> -XSERVER_XORG_SERVER_CONF_OPTS += --disable-record
> -endif

Where is --enable-record now gone?

Since xorgproto installs all protocols, we should be in the same
situation as when xproto-record was previously enabled, no?

So, --enable-record should now be always enabled.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
