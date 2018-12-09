From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 9 Dec 2018 21:24:08 +0100
Subject: [Buildroot] [PATCH v3 1/1] lua: remove 5.2.x version
In-Reply-To: <20181202102506.24699-1-francois.perrad@gadz.org>
References: <20181202102506.24699-1-francois.perrad@gadz.org>
Message-ID: <20181209212408.2a1ecc94@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  2 Dec 2018 11:25:06 +0100, Francois Perrad wrote:
> At this time :
> - Lua 5.3.5 will be the last one of its serie.
> - Lua 5.4 is up coming (lua-5.4.0-work2 is already available).
> - Lua 5.2.4 was released on 2015.
> For various reasons in the Lua ecosystem, the Lua 5.1 will stay.
> On BR, Lua 5.3 is the default version since 2016.02.
> 
> So, the serie which could be removed is the 5.2.x.
> We could wait some days for other user feedback.
> 
> Note: see discussion when 5.3.x was introduced : http://lists.busybox.net/pipermail/buildroot/2015-January/117638.html

I've applied, after fixing one small aspect, see below.


> diff --git a/package/domoticz/Config.in b/package/domoticz/Config.in
> index 4c5338df0..6d0abaddf 100644
> --- a/package/domoticz/Config.in
> +++ b/package/domoticz/Config.in
> @@ -8,7 +8,7 @@ config BR2_PACKAGE_DOMOTICZ
>  	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_USE_WCHAR
> -	depends on BR2_PACKAGE_LUA_5_2 || BR2_PACKAGE_LUA_5_3
> +	depends on BR2_PACKAGE_LUA_5_3
>  	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # exception_ptr
>  	select BR2_PACKAGE_BOOST
>  	select BR2_PACKAGE_BOOST_DATE_TIME
> @@ -35,7 +35,7 @@ comment "domoticz needs lua >= 5.2 and a toolchain w/ C++, gcc >= 4.8, NPTL, wch

You forgot to update this comment: saying lua >= 5.2 no longer makes
sense, so I've updated that to "domoticz needs lua 5.3".

Applied with this change. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
