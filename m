From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Sat, 29 Dec 2018 09:16:09 +0100
Subject: [Buildroot] [PATCH v2 3/3] package/luaposix: bump version to
 34.0.4
In-Reply-To: <1546049245-22865-3-git-send-email-james.hilliard1@gmail.com>
References: <1546049245-22865-1-git-send-email-james.hilliard1@gmail.com>
 <1546049245-22865-3-git-send-email-james.hilliard1@gmail.com>
Message-ID: <CAB0FRsswnf3ry3GN-uss+i7f__dbSjgXdjeWmopu43++XQH6LA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le sam. 29 d?c. 2018 ? 03:07, <james.hilliard1@gmail.com> a ?crit :

> From: James Hilliard <james.hilliard1@gmail.com>
>
> This version has a new dependency on lua-std-normalize.
>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>

Acked-by: Francois Perrad <francois.perrad@gadz.org>


>
> ---
> Changes v1 -> v2:
>   - Use generic package infrastructure instead of luarocks
> ---
>  package/luaposix/Config.in     | 1 +
>  package/luaposix/luaposix.hash | 2 +-
>  package/luaposix/luaposix.mk   | 4 ++--
>  3 files changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/package/luaposix/Config.in b/package/luaposix/Config.in
> index 91abcb9..176c765 100644
> --- a/package/luaposix/Config.in
> +++ b/package/luaposix/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_LUAPOSIX
>         bool "luaposix"
>         depends on BR2_PACKAGE_HAS_LUAINTERPRETER
> +       select BR2_PACKAGE_LUA_STD_NORMALIZE # runtime
>         # "bit32" is included in Lua 5.2+. luajit has an equivalent
>         # "bit" module, but since it has a different name, luaposix
>         # doesn't find it.
> diff --git a/package/luaposix/luaposix.hash
> b/package/luaposix/luaposix.hash
> index b3984c1..a13cb4a 100644
> --- a/package/luaposix/luaposix.hash
> +++ b/package/luaposix/luaposix.hash
> @@ -1,2 +1,2 @@
>  # Locally calculated
> -sha256 ba0bc343783fc33958cd02a68cdbfd65430152d9f297f7ed92678b1a305bd5d7
> luaposix-34.0.1.tar.gz
> +sha256 eb6e7322da3013bdb3d524f68df4f5510a2efd805c06bf7cc27be6611eab7483
> luaposix-34.0.4.tar.gz
> diff --git a/package/luaposix/luaposix.mk b/package/luaposix/luaposix.mk
> index 779e707..f467992 100644
> --- a/package/luaposix/luaposix.mk
> +++ b/package/luaposix/luaposix.mk
> @@ -4,8 +4,8 @@
>  #
>
>  ################################################################################
>
> -LUAPOSIX_VERSION = 34.0.1
> -LUAPOSIX_SITE = $(call
> github,luaposix,luaposix,release-v$(LUAPOSIX_VERSION))
> +LUAPOSIX_VERSION = 34.0.4
> +LUAPOSIX_SITE = $(call github,luaposix,luaposix,v$(LUAPOSIX_VERSION))
>  LUAPOSIX_LICENSE = MIT
>  LUAPOSIX_LICENSE_FILES = LICENSE
>  LUAPOSIX_DEPENDENCIES = luainterpreter host-lua
> --
> 2.7.4
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20181229/1c20aab9/attachment.html>
