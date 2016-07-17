From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Jul 2016 17:56:46 +0200
Subject: [Buildroot] [PATCH 1/3] package/mesa3d: add optional support
 for libsha1
In-Reply-To: <1468690971-19702-1-git-send-email-bernd.kuhls@t-online.de>
References: <1468690971-19702-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160717155646.GJ3614@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2016-07-16 19:42 +0200, Bernd Kuhls spake thusly:
> mesa3d supports several sha1 implementations:
> https://cgit.freedesktop.org/mesa/mesa/tree/configure.ac?h=12.0#n1167
> 
> This patch adds support for libsha1, inspired by the
> xserver_xorg-server package:
> https://github.com/buildroot/buildroot/blob/master/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk#L247
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

This can go in even if the Vulkan driver does not go in yet.

Regards,
Yann E. MORIN.

> ---
> This patch is needed for the next patch of this series:
> package/mesa3d: add support for Intel Vulkan driver
> 
>  package/mesa3d/mesa3d.mk | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
> index dcd43d5..19dec49 100644
> --- a/package/mesa3d/mesa3d.mk
> +++ b/package/mesa3d/mesa3d.mk
> @@ -36,6 +36,9 @@ MESA3D_CONF_OPTS += --with-sha1=libcrypto
>  else ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
>  MESA3D_DEPENDENCIES += libgcrypt
>  MESA3D_CONF_OPTS += --with-sha1=libgcrypt
> +else ifeq ($(BR2_PACKAGE_LIBSHA1),y)
> +MESA3D_DEPENDENCIES += libsha1
> +MESA3D_CONF_OPTS += --with-sha1=libsha1
>  endif
>  
>  ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
> -- 
> 2.8.1
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
