From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 29 May 2019 23:42:50 +0200
Subject: [Buildroot] [PATCH 2/2] package/Config.in: fix alphabetical
 order
In-Reply-To: <1559142308-3303-2-git-send-email-jerzy.m.grzegorek@gmail.com>
References: <1559142308-3303-1-git-send-email-jerzy.m.grzegorek@gmail.com>
 <1559142308-3303-2-git-send-email-jerzy.m.grzegorek@gmail.com>
Message-ID: <7db65ef8-8ada-64b7-8587-caaf8aba1357@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Jerzy,

On 29/05/2019 17:05, Jerzy Grzegorek wrote:

> @@ -302,23 +302,23 @@ comment "Graphic libraries"
>  	source "package/ocrad/Config.in"
>  	source "package/psplash/Config.in"
>  	source "package/sdl/Config.in"
> -	source "package/sdl_gfx/Config.in"
> -	source "package/sdl_image/Config.in"
> -	source "package/sdl_mixer/Config.in"
> -	source "package/sdl_net/Config.in"
> -	source "package/sdl_sound/Config.in"
> -	source "package/sdl_ttf/Config.in"
>  	source "package/sdl2/Config.in"
>  	source "package/sdl2_gfx/Config.in"
>  	source "package/sdl2_image/Config.in"
>  	source "package/sdl2_mixer/Config.in"
>  	source "package/sdl2_net/Config.in"
>  	source "package/sdl2_ttf/Config.in"
> +	source "package/sdl_gfx/Config.in"
> +	source "package/sdl_image/Config.in"
> +	source "package/sdl_mixer/Config.in"
> +	source "package/sdl_net/Config.in"
> +	source "package/sdl_sound/Config.in"
> +	source "package/sdl_ttf/Config.in"

 Although I think it's great to check the alphabetical ordering in
check_package, I think that the menus should still follow a logical ordering. It
makes more sense for all sdl packages to come before sdl2, an not:

sdl
sdl2
sdl2_bar
sdl2_foo
sdl_bar
sdl_foo

like you made it now.

 Therefore, I think you should just put exclusion markers on those lines.

>  	source "package/tk/Config.in"
>  
>  comment "Other GUIs"
> -	source "package/qt5/Config.in"
>  	source "package/kf5/Config.in"
> +	source "package/qt5/Config.in"

 Here also: kf5 depends on qt5, so it's very unnatural to swap the order.

>  if BR2_PACKAGE_QT5

 Actually, it would make sense for kf5 to move under this condition, which would
solve the issue :-)

>  comment "QT libraries and helper libraries"
>  	source "package/cutelyst/Config.in"
[snip]
> @@ -1845,8 +1845,8 @@ menu "Networking applications"
>  	source "package/bind/Config.in"
>  	source "package/bird/Config.in"
>  	source "package/bluez-tools/Config.in"
> -	source "package/bluez_utils/Config.in"
>  	source "package/bluez5_utils/Config.in"
> +	source "package/bluez_utils/Config.in"

 And again, putting bluez after bluez5 is weird.


 Also, this patch should be first, the one that updates checkpackagelib second.
This makes it clear that the checkpackagelib update shouldn't be applied until
package/Config.in is fixed.

 Regards,
 Arnout

>  	source "package/bmon/Config.in"
>  	source "package/boa/Config.in"
>  	source "package/boinc/Config.in"
> @@ -1956,13 +1956,13 @@ menu "Networking applications"
>  	source "package/nbd/Config.in"
>  	source "package/ncftp/Config.in"
>  	source "package/ndisc6/Config.in"
> +	source "package/net-tools/Config.in"
>  	source "package/netatalk/Config.in"
>  	source "package/netcat/Config.in"
>  	source "package/netcat-openbsd/Config.in"
>  	source "package/netplug/Config.in"
>  	source "package/netsnmp/Config.in"
>  	source "package/netstat-nat/Config.in"
> -	source "package/net-tools/Config.in"
>  	source "package/network-manager/Config.in"
>  	source "package/nfacct/Config.in"
>  	source "package/nftables/Config.in"
> 
