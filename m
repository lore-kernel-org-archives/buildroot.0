From: Romain Naour <romain.naour@smile.fr>
Date: Mon, 3 Jul 2017 17:34:48 +0200
Subject: [Buildroot] [PATCH] package/lua-stdlib: new package
In-Reply-To: <20170626151941.2637-1-m.niestroj@grinn-global.com>
References: <20170626151941.2637-1-m.niestroj@grinn-global.com>
Message-ID: <930afc4d-3463-9ec6-d23e-840d1b9741df@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Marcin,

Adding Fran?ois in Cc since it's related to lua.

Le 26/06/2017 ? 17:19, Marcin Niestroj a ?crit :
> Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>

Otherwise, looks good for me.

Reviewed-by: Romain Naour <romain.naour@smile.fr>

Best regards,
Romain

> ---
>  DEVELOPERS                         |  1 +
>  package/Config.in                  |  1 +
>  package/lua-stdlib/Config.in       |  9 +++++++++
>  package/lua-stdlib/lua-stdlib.hash |  2 ++
>  package/lua-stdlib/lua-stdlib.mk   | 14 ++++++++++++++
>  5 files changed, 27 insertions(+)
>  create mode 100644 package/lua-stdlib/Config.in
>  create mode 100644 package/lua-stdlib/lua-stdlib.hash
>  create mode 100644 package/lua-stdlib/lua-stdlib.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 9e421f4b41..9ec51261f0 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1075,6 +1075,7 @@ F:	package/argparse/
>  F:	package/dt-utils/
>  F:	package/easydbus/
>  F:	package/lua-flu/
> +F:	package/lua-stdlib/
>  F:	package/luaossl/
>  F:	package/rs485conf/
>  F:	package/turbolua/
> diff --git a/package/Config.in b/package/Config.in
> index f69f67f3e4..259b871b1c 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -574,6 +574,7 @@ menu "Lua libraries/modules"
>  	source "package/lua-msgpack-native/Config.in"
>  	source "package/lua-periphery/Config.in"
>  	source "package/lua-sdl2/Config.in"
> +	source "package/lua-stdlib/Config.in"
>  	source "package/lua-testmore/Config.in"
>  	source "package/luabitop/Config.in"
>  	source "package/luacrypto/Config.in"
> diff --git a/package/lua-stdlib/Config.in b/package/lua-stdlib/Config.in
> new file mode 100644
> index 0000000000..1843826c24
> --- /dev/null
> +++ b/package/lua-stdlib/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_LUA_STDLIB
> +	bool "lua-stdlib"
> +	help
> +	  lua-stdlib is a library of modules for common programming
> +	  tasks, including list, table and functional operations,
> +	  objects, pickling, pretty-printing and command-line option
> +	  parsing.
> +
> +	  https://github.com/lua-stdlib/lua-stdlib/
> diff --git a/package/lua-stdlib/lua-stdlib.hash b/package/lua-stdlib/lua-stdlib.hash
> new file mode 100644
> index 0000000000..56f585db72
> --- /dev/null
> +++ b/package/lua-stdlib/lua-stdlib.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256	5eff1af3a16470297fa5a92c9525ae593644ae9dc0e6215158298711f5d829ee  stdlib-41.2.0-1.src.rock
> diff --git a/package/lua-stdlib/lua-stdlib.mk b/package/lua-stdlib/lua-stdlib.mk
> new file mode 100644
> index 0000000000..f7fb0ff9c5
> --- /dev/null
> +++ b/package/lua-stdlib/lua-stdlib.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# lua-stdlib
> +#
> +################################################################################
> +
> +LUA_STDLIB_VERSION_UPSTREAM = 41.2.0
> +LUA_STDLIB_VERSION = $(LUA_STDLIB_VERSION_UPSTREAM)-1
> +LUA_STDLIB_NAME_UPSTREAM = stdlib
> +LUA_STDLIB_SUBDIR = lua-stdlib-release-v$(LUA_STDLIB_VERSION_UPSTREAM)
> +LUA_STDLIB_LICENSE = MIT
> +LUA_STDLIB_LICENSE_FILES = $(LUA_STDLIB_SUBDIR)/COPYING
> +
> +$(eval $(luarocks-package))
> 
