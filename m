From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 28 May 2015 06:41:49 +0300
Subject: [Buildroot] [PATCH 1/3] lua-periphery: bump version to 1.0.5,
 remove dependency on c-periphery
In-Reply-To: <1432769173-30319-1-git-send-email-vsergeev@gmail.com>
References: <1432769173-30319-1-git-send-email-vsergeev@gmail.com>
Message-ID: <20150528034149.GA2260@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vanya,

On Wed, May 27, 2015 at 04:26:11PM -0700, Vanya Sergeev wrote:
> diff --git a/package/lua-periphery/Config.in b/package/lua-periphery/Config.in
> index df0546f..de5a716 100644
> --- a/package/lua-periphery/Config.in
> +++ b/package/lua-periphery/Config.in
> @@ -1,7 +1,6 @@
>  config BR2_PACKAGE_LUA_PERIPHERY
>  	bool "lua-periphery"
>  	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
> -	select BR2_PACKAGE_C_PERIPHERY
>  	help
>  	  A library for GPIO, SPI, I2C, MMIO, and Serial peripheral I/O
>  	  interface access in userspace Linux with Lua.
> diff --git a/package/lua-periphery/lua-periphery.mk b/package/lua-periphery/lua-periphery.mk
> index 99e1dbe..f820408 100644
> --- a/package/lua-periphery/lua-periphery.mk
> +++ b/package/lua-periphery/lua-periphery.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>  
> -LUA_PERIPHERY_VERSION_UPSTREAM = 1.0.4
> -LUA_PERIPHERY_VERSION = $(LUA_PERIPHERY_VERSION_UPSTREAM)-1
> +LUA_PERIPHERY_VERSION_UPSTREAM = 1.0.5
> +LUA_PERIPHERY_VERSION = $(LUA_PERIPHERY_VERSION_UPSTREAM)-2
>  LUA_PERIPHERY_SUBDIR = lua-periphery
>  LUA_PERIPHERY_DEPENDENCIES = c-periphery

Since you removed the c-periphery select above, you should also remove it from 
here.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
