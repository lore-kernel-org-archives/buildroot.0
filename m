From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 29 Jul 2020 13:40:07 -0600
Subject: [Buildroot] [PATCH v3 04/10] package/lua-messagepack: add
 support of Lua 5.4
In-Reply-To: <20200728132147.3155274-5-francois.perrad@gadz.org>
References: <20200728132147.3155274-1-francois.perrad@gadz.org>
 <20200728132147.3155274-5-francois.perrad@gadz.org>
Message-ID: <CADvTj4qaGTMxQOmikuRZcTMUnweBDQLpE5PheTztWw++OkhXoQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jul 29, 2020 at 12:35 PM Francois Perrad <fperrad@gmail.com> wrote:
>
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/lua-messagepack/lua-messagepack.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/lua-messagepack/lua-messagepack.mk b/package/lua-messagepack/lua-messagepack.mk
> index f393a8d02..33d460b4f 100644
> --- a/package/lua-messagepack/lua-messagepack.mk
> +++ b/package/lua-messagepack/lua-messagepack.mk
> @@ -6,7 +6,7 @@
>
>  LUA_MESSAGEPACK_VERSION_UPSTREAM = 0.5.2
>  LUA_MESSAGEPACK_VERSION = $(LUA_MESSAGEPACK_VERSION_UPSTREAM)-1
> -ifeq ($(BR2_PACKAGE_LUA_5_3),y)
> +ifeq ($(BR2_PACKAGE_LUA_5_3)$(BR2_PACKAGE_LUA_5_4),y)
Might make sense to add/use some helpers for these use cases like:
BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_AT_LEAST_5_3
>  LUA_MESSAGEPACK_NAME_UPSTREAM = lua-MessagePack-lua53
>  else
>  LUA_MESSAGEPACK_NAME_UPSTREAM = lua-MessagePack
> --
> 2.25.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
