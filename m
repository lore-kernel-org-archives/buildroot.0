From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 May 2020 09:10:50 +0200
Subject: [Buildroot] [PATCH v3 3/9] package/collectd: depend on
 luainterpreter for lua support
In-Reply-To: <20200525004845.3019642-3-james.hilliard1@gmail.com>
References: <20200525004845.3019642-1-james.hilliard1@gmail.com>
 <20200525004845.3019642-3-james.hilliard1@gmail.com>
Message-ID: <20200525091050.26175643@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 24 May 2020 18:48:39 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

>  config BR2_PACKAGE_COLLECTD_LUA
>  	bool "lua"
> -	select BR2_PACKAGE_LUA
> +	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
>  	help
>  	  Embeds a Lua interpreter into collectd and provides an
>  	  interface to collectd's plugin system.
>  
> +comment "lua needs a Lua interpreter"
> +	depends on !BR2_PACKAGE_HAS_LUAINTERPRETER

I believe this comment is not needed, it is obvious a Lua interpreter
is needed for Lua support.

> -	$(if $(BR2_PACKAGE_COLLECTD_LUA),lua) \
> +	$(if $(BR2_PACKAGE_COLLECTD_LUA),$(if $(BR2_PACKAGE_LUA),lua,luajit)) \

Use the luainterpreter virtual package as a dependency here.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
