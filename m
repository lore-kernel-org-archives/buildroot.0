From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 31 Jul 2014 23:12:23 +0200
Subject: [Buildroot] [PATCH 6 of 6 v2] busybox: only add kconfig targets
 if uclibc is enabled
In-Reply-To: <469e4493e128111baaf2.1406750287@localhost>
References: <patchbomb.1406750281@localhost>
 <469e4493e128111baaf2.1406750287@localhost>
Message-ID: <20140731211223.GN3960@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-07-30 21:58 +0200, Thomas De Schampheleire spake thusly:
> In analogy of linux.mk, only enable its targets, in particular the kconfig
> targets (menuconfig, update-config, ...) when the busybox package is
> actually enabled.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Typo in subject:
    busybox: only add kconfig targets if uclibc is enabled

s/uclibc/busybox/

Otherwise:
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/busybox/busybox.mk |  2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff -r f995a8adfa24 -r 469e4493e128 package/busybox/busybox.mk
> --- a/package/busybox/busybox.mk	Tue Jul 22 20:43:10 2014 +0200
> +++ b/package/busybox/busybox.mk	Wed Jul 23 20:13:38 2014 +0200
> @@ -226,4 +226,6 @@
>  	$(BUSYBOX_INSTALL_WATCHDOG_SCRIPT)
>  endef
>  
> +ifeq ($(BR2_PACKAGE_BUSYBOX),y)
>  $(eval $(kconfig-package))
> +endif
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
