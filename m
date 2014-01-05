From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 5 Jan 2014 16:36:48 +0100
Subject: [Buildroot] [PATCH 08/10] luasql-sqlite3: renamed like with
	LuaRocks
In-Reply-To: <f3ac9e465370b706b5af4acbb36f6e0291016034.1387744636.git.yann.morin.1998@free.fr>
References: <cover.1387744636.git.yann.morin.1998@free.fr>
 <f3ac9e465370b706b5af4acbb36f6e0291016034.1387744636.git.yann.morin.1998@free.fr>
Message-ID: <20140105153648.GB3430@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fran?ois, All,

On 2013-12-22 21:42 +0100, Yann E. MORIN spake thusly:
> From: Francois Perrad <fperrad@gmail.com>
[--SNIP--]
> diff --git a/package/luasql-sqlite3/Config.in b/package/luasql-sqlite3/Config.in
> new file mode 100644
> index 0000000..3876f3d
> --- /dev/null
> +++ b/package/luasql-sqlite3/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_LUASQL_SQLITE3
> +	bool "luasql-sqlite3"
> +	depends on BR2_PACKAGE_HAS_LUA_INTERPRETER

You forgot either a depends on BR2_PACKAGE_SQLITE, or a select
BR2_PACKAGE_SQLITE...

[--SNIP--]
> diff --git a/package/luasql-sqlite3/luasql-sqlite3.mk b/package/luasql-sqlite3/luasql-sqlite3.mk
> new file mode 100644
> index 0000000..b114f02
> --- /dev/null
> +++ b/package/luasql-sqlite3/luasql-sqlite3.mk
> @@ -0,0 +1,33 @@
> +################################################################################
> +#
> +# luasql-sqlite3
> +#
> +################################################################################
> +
> +LUASQL_SQLITE3_VERSION = v2.3.0
> +LUASQL_SQLITE3_SITE = https://github.com/keplerproject/luasql/tarball/$(LUASQL_SQLITE3_VERSION)
> +LUASQL_SQLITE3_LICENSE = MIT
> +LUASQL_SQLITE3_LICENSE_FILES = README
> +LUASQL_SQLITE3_DEPENDENCIES = luainterpreter sqlite

... because you are using it here as a dependency.

I will fix that here before I repush my branch.

I'm currently rebasing it on top of the current master, and there is a
small merge conflict. I'll repush soon, once I'm done, so you can get it
in a clean state.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
