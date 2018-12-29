From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Sat, 29 Dec 2018 09:16:47 +0100
Subject: [Buildroot] [PATCH v2 2/3] package/lua-std-normalize: new
 package
In-Reply-To: <1546049245-22865-2-git-send-email-james.hilliard1@gmail.com>
References: <1546049245-22865-1-git-send-email-james.hilliard1@gmail.com>
 <1546049245-22865-2-git-send-email-james.hilliard1@gmail.com>
Message-ID: <CAB0FRsuVevSbUYjX9h9p6rEqa9jm98GT4a0wqRDGpXJO8eGjLw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le sam. 29 d?c. 2018 ? 03:07, <james.hilliard1@gmail.com> a ?crit :

> From: James Hilliard <james.hilliard1@gmail.com>
>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>

Acked-by: Francois Perrad <francois.perrad@gadz.org>


> ---
> Changes v1 -> v2:
>   - rename lua-normalize to lua-std-normalize
> ---
>  package/Config.in                                |  1 +
>  package/lua-std-normalize/Config.in              | 13 +++++++++++++
>  package/lua-std-normalize/lua-std-normalize.hash |  2 ++
>  package/lua-std-normalize/lua-std-normalize.mk   | 14 ++++++++++++++
>  4 files changed, 30 insertions(+)
>  create mode 100644 package/lua-std-normalize/Config.in
>  create mode 100644 package/lua-std-normalize/lua-std-normalize.hash
>  create mode 100644 package/lua-std-normalize/lua-std-normalize.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index f33aaf9..eaf3c04 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -625,6 +625,7 @@ menu "Lua libraries/modules"
>         source "package/lua-periphery/Config.in"
>         source "package/lua-sdl2/Config.in"
>         source "package/lua-std-debug/Config.in"
> +       source "package/lua-std-normalize/Config.in"
>         source "package/lua-stdlib/Config.in"
>         source "package/lua-testmore/Config.in"
>         source "package/lua-utf8/Config.in"
> diff --git a/package/lua-std-normalize/Config.in
> b/package/lua-std-normalize/Config.in
> new file mode 100644
> index 0000000..b959836
> --- /dev/null
> +++ b/package/lua-std-normalize/Config.in
> @@ -0,0 +1,13 @@
> +config BR2_PACKAGE_LUA_STD_NORMALIZE
> +       bool "lua-std-normalize"
> +       depends on BR2_PACKAGE_HAS_LUAINTERPRETER
> +       select BR2_PACKAGE_LUA_STD_DEBUG # runtime
> +       help
> +         This module can inject deterministic versions of core Lua
> +         functions that do not behave identically across all supported Lua
> +         implementations into your module's lexical environment.   Each
> +         function is as thin and fast a version as is possible in each Lua
> +         implementation, evaluating to the Lua C implementation with no
> +         overhead when semantics allow.
> +
> +         https://lua-stdlib.github.io/normalize
> diff --git a/package/lua-std-normalize/lua-std-normalize.hash
> b/package/lua-std-normalize/lua-std-normalize.hash
> new file mode 100644
> index 0000000..831528d
> --- /dev/null
> +++ b/package/lua-std-normalize/lua-std-normalize.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256 50baac6fbcbc6bbe72b63ce0871ec36176d75c04dccc6e368590ba6ef107c67a
> std.normalize-2.0.2-1.src.rock
> diff --git a/package/lua-std-normalize/lua-std-normalize.mk
> b/package/lua-std-normalize/lua-std-normalize.mk
> new file mode 100644
> index 0000000..efbf48b
> --- /dev/null
> +++ b/package/lua-std-normalize/lua-std-normalize.mk
> @@ -0,0 +1,14 @@
>
> +################################################################################
> +#
> +# lua-std-normalize
> +#
>
> +################################################################################
> +
> +LUA_STD_NORMALIZE_VERSION_UPSTREAM = 2.0.2
> +LUA_STD_NORMALIZE_VERSION = $(LUA_STD_NORMALIZE_VERSION_UPSTREAM)-1
> +LUA_STD_NORMALIZE_NAME_UPSTREAM = std.normalize
> +LUA_STD_NORMALIZE_SUBDIR = normalize-$(LUA_STD_NORMALIZE_VERSION_UPSTREAM)
> +LUA_STD_NORMALIZE_LICENSE = MIT
> +LUA_STD_NORMALIZE_LICENSE_FILES = LICENSE.md
> +
> +$(eval $(luarocks-package))
> --
> 2.7.4
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20181229/d7dd2cc3/attachment.html>
