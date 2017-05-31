From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 May 2017 23:34:02 +0200
Subject: [Buildroot] [PATCH 3/3] lua-sdl2: new package
In-Reply-To: <20170522131307.27529-3-francois.perrad@gadz.org>
References: <20170522131307.27529-1-francois.perrad@gadz.org>
 <20170522131307.27529-3-francois.perrad@gadz.org>
Message-ID: <20170531233402.6ff752f8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 22 May 2017 15:13:07 +0200, Francois Perrad wrote:

> diff --git a/package/lua-sdl2/Config.in b/package/lua-sdl2/Config.in
> new file mode 100644
> index 0000000000..83b84acaa2
> --- /dev/null
> +++ b/package/lua-sdl2/Config.in
> @@ -0,0 +1,12 @@
> +config BR2_PACKAGE_LUA_SDL2
> +	bool "lua-sdl2"
> +	select BR2_PACKAGE_SDL2

Since you're selecting BR2_PACKAGE_SDL2, you should have propagated the
dependencies of BR2_PACKAGE_SDL2, i.e !BR2_STATIC_LIBS.

So I've done this and applied your patch to next. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
