From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Sat, 29 Dec 2018 09:15:30 +0100
Subject: [Buildroot] [PATCH v2 1/3] package/lua-std-debug: new package
In-Reply-To: <1546049245-22865-1-git-send-email-james.hilliard1@gmail.com>
References: <1546049245-22865-1-git-send-email-james.hilliard1@gmail.com>
Message-ID: <CAB0FRsswkyiMicaDU-H3KwbwqQnmtpWEypji2=miugWj4SG0EQ@mail.gmail.com>
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
>   - rename lua-debug to lua-std-debug
> ---
>  package/Config.in                        |  1 +
>  package/lua-std-debug/Config.in          |  7 +++++++
>  package/lua-std-debug/lua-std-debug.hash |  2 ++
>  package/lua-std-debug/lua-std-debug.mk   | 16 ++++++++++++++++
>  4 files changed, 26 insertions(+)
>  create mode 100644 package/lua-std-debug/Config.in
>  create mode 100644 package/lua-std-debug/lua-std-debug.hash
>  create mode 100644 package/lua-std-debug/lua-std-debug.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index c3e0691..f33aaf9 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -624,6 +624,7 @@ menu "Lua libraries/modules"
>         source "package/lua-msgpack-native/Config.in"
>         source "package/lua-periphery/Config.in"
>         source "package/lua-sdl2/Config.in"
> +       source "package/lua-std-debug/Config.in"
>         source "package/lua-stdlib/Config.in"
>         source "package/lua-testmore/Config.in"
>         source "package/lua-utf8/Config.in"
> diff --git a/package/lua-std-debug/Config.in
> b/package/lua-std-debug/Config.in
> new file mode 100644
> index 0000000..3774292
> --- /dev/null
> +++ b/package/lua-std-debug/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_LUA_STD_DEBUG
> +       bool "lua-std-debug"
> +       depends on BR2_PACKAGE_HAS_LUAINTERPRETER
> +       help
> +         Manage an overall debug state, and associated hint substates.
> +
> +         http://lua-stdlib.github.io/_debug
> diff --git a/package/lua-std-debug/lua-std-debug.hash
> b/package/lua-std-debug/lua-std-debug.hash
> new file mode 100644
> index 0000000..2c48711
> --- /dev/null
> +++ b/package/lua-std-debug/lua-std-debug.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256 7f6b84283d4b78dafee17e7765dd5f1f8e75c3314169977f4dda0e7873616ce2
> std._debug-1.0.1-1.src.rock
> diff --git a/package/lua-std-debug/lua-std-debug.mk
> b/package/lua-std-debug/lua-std-debug.mk
> new file mode 100644
> index 0000000..b9e6312
> --- /dev/null
> +++ b/package/lua-std-debug/lua-std-debug.mk
> @@ -0,0 +1,16 @@
>
> +################################################################################
> +#
> +# lua-std-debug
> +#
>
> +################################################################################
> +
> +LUA_STD_DEBUG_VERSION_UPSTREAM = 1.0.1
> +LUA_STD_DEBUG_VERSION = $(LUA_STD_DEBUG_VERSION_UPSTREAM)-1
> +LUA_STD_DEBUG_NAME_UPSTREAM = std._debug
> +LUA_STD_DEBUG_SUBDIR = _debug-$(LUA_STD_DEBUG_VERSION_UPSTREAM)
> +LUA_STD_DEBUG_ROCKSPEC =
> $(LUA_STD_DEBUG_NAME_UPSTREAM)-$(LUA_STD_DEBUG_VERSION).rockspec
> +LUA_STD_DEBUG_SOURCE =
> $(LUA_STD_DEBUG_NAME_UPSTREAM)-$(LUA_STD_DEBUG_VERSION).src.rock
> +LUA_STD_DEBUG_LICENSE = MIT
> +LUA_STD_DEBUG_LICENSE_FILES = LICENSE.md
> +
> +$(eval $(luarocks-package))
> --
> 2.7.4
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20181229/d1714a74/attachment.html>
