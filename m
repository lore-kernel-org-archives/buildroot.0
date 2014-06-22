From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Jun 2014 16:10:48 +0200
Subject: [Buildroot] [PATCH 4 of 5 RFC] busybox: menuconfig: take into
 account initial settings from config file
In-Reply-To: <5dc5438c0108ca503012.1403444743@localhost>
References: <patchbomb.1403444739@localhost>
 <5dc5438c0108ca503012.1403444743@localhost>
Message-ID: <20140622141048.GE3509@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-06-22 15:45 +0200, Thomas De Schampheleire spake thusly:
> When busybox-menuconfig is executed from a clean repo, and a custom
> configuration file was set, then these custom settings are ignored and
> busybox starts from the default configuration.
> 
> This patch adds an explicit copy of the custom config file to the menuconfig
> target to fix 'make clean busybox-menuconfig'.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/busybox/busybox.mk |  1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff -r 6bb6b3f59fd5 -r 5dc5438c0108 package/busybox/busybox.mk
> --- a/package/busybox/busybox.mk	Sun Jun 22 15:29:01 2014 +0200
> +++ b/package/busybox/busybox.mk	Sun Jun 22 15:33:49 2014 +0200
> @@ -232,6 +232,7 @@
>  $(eval $(generic-package))
>  
>  busybox-menuconfig busybox-xconfig busybox-gconfig: busybox-patch
> +	$(BUSYBOX_COPY_CONFIG)
>  	$(BUSYBOX_MAKE_ENV) $(MAKE) $(BUSYBOX_MAKE_OPTS) -C $(BUSYBOX_DIR) \
>  		$(subst busybox-,,$@)
>  	rm -f $(BUSYBOX_DIR)/.stamp_built
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
