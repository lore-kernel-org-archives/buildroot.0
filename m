From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Tue, 9 May 2017 10:32:37 +0200
Subject: [Buildroot] [PATCH] lua: use target LDFLAGS
In-Reply-To: <6d72098cd529e9364107dd2727d22eda57635c80.1494253706.git.baruch@tkos.co.il>
References: <6d72098cd529e9364107dd2727d22eda57635c80.1494253706.git.baruch@tkos.co.il>
Message-ID: <CAB0FRssrh=QwPNUX13tEVebTLm0JGsiMC+52O5CdEC5SQLmzmA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2017-05-08 16:28 GMT+02:00 Baruch Siach <baruch@tkos.co.il>:
> This adds '-static' to the link command when BR2_STATIC_LIBS=y, making the lua
> binary really static.
>
> Cc: Francois Perrad <francois.perrad@gadz.org>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Acked-by: Francois Perrad <francois.perrad@gadz.org>

> ---
>  package/lua/lua.mk | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/package/lua/lua.mk b/package/lua/lua.mk
> index 5ef61e039e36..bc0a9d456b9c 100644
> --- a/package/lua/lua.mk
> +++ b/package/lua/lua.mk
> @@ -70,6 +70,7 @@ define LUA_BUILD_CMDS
>         CC="$(TARGET_CC)" RANLIB="$(TARGET_RANLIB)" \
>         CFLAGS="$(TARGET_CFLAGS) $(LUA_CFLAGS)" \
>         MYLIBS="$(LUA_MYLIBS)" AR="$(TARGET_CROSS)ar rcu" \
> +       MYLDFLAGS="$(TARGET_LDFLAGS)" \
>         BUILDMODE=$(LUA_BUILDMODE) \
>         PKG_VERSION=$(LUA_VERSION) -C $(@D)/src all
>  endef
> --
> 2.11.0
>
