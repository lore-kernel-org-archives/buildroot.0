From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 29 Dec 2017 14:55:05 +0100
Subject: [Buildroot] [PATCH] tvheadend: add dependency on udev based
 rootfs creation
In-Reply-To: <20171229130604.9897-1-daggs@gmx.com>
References: <20171229130604.9897-1-daggs@gmx.com>
Message-ID: <20171229135505.GC3176@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dagg, All,

On 2017-12-29 15:06 +0200, Dagg Stompler spake thusly:
> BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV is needed for tvheadend inorder
> for the program to see usb based DVB cards.

But is it required for other types of cards, like PCI ones?

And what about systems using mdev instead? I've had a system sithout
udev at all, and tvheadend was working perfectly fine for me.

Basically, I don't think we want to add this dependency at all, because
it is not required in my experience.

Regards,
Yann E. MORIN.

> Signed-off-by: Dagg Stompler <daggs@gmx.com>
> ---
>  package/tvheadend/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/tvheadend/Config.in b/package/tvheadend/Config.in
> index 44a69a27ba..2a497b481d 100644
> --- a/package/tvheadend/Config.in
> +++ b/package/tvheadend/Config.in
> @@ -9,6 +9,7 @@ config BR2_PACKAGE_TVHEADEND
>  	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
>  	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4
> +	depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV
>  	select BR2_PACKAGE_DTV_SCAN_TABLES
>  	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
>  	select BR2_PACKAGE_OPENSSL
> -- 
> 2.15.1
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
