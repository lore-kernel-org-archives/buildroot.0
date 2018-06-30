From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 30 Jun 2018 18:02:05 +0200
Subject: [Buildroot] [PATCH] qt5base: remove unused definition
In-Reply-To: <20180630125713.4302-1-gael.portay@savoirfairelinux.com>
References: <20180630125713.4302-1-gael.portay@savoirfairelinux.com>
Message-ID: <20180630160205.GC2384@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ga?l, All,

On 2018-06-30 08:57 -0400, Ga?l PORTAY spake thusly:
> Since commit 81fb33af2a (qt5base: correct eglfs support in
> qmake.conf.in) the definition QT5BASE_CONFIGURE_QMAKE_CONFIG is left
> unused.
> 
> Remove it since it is not used anymore.
> 
> Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/qt5/qt5base/qt5base.mk | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
> index d5b25abcb8..9eafd593f1 100644
> --- a/package/qt5/qt5base/qt5base.mk
> +++ b/package/qt5/qt5base/qt5base.mk
> @@ -269,7 +269,6 @@ define QT5BASE_CONFIGURE_CMDS
>  	sed 's/@EGLFS_DEVICE@/$(QT5BASE_EGLFS_DEVICE)/g' \
>  		$(QT5BASE_PKGDIR)/qmake.conf.in > \
>  		$(@D)/mkspecs/devices/linux-buildroot-g++/qmake.conf
> -	$(QT5BASE_CONFIGURE_QMAKE_CONFIG)
>  	$(INSTALL) -m 0644 -D $(QT5BASE_PKGDIR)/qplatformdefs.h \
>  		$(@D)/mkspecs/devices/linux-buildroot-g++/qplatformdefs.h
>  	$(QT5BASE_CONFIGURE_CONFIG_FILE)
> -- 
> 2.17.1
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
