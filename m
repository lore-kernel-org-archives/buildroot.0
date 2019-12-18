From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 18 Dec 2019 23:15:04 +0100
Subject: [Buildroot] [PATCH] package/lua-msgpack-native: fix build with
 moonjit
In-Reply-To: <20191210174004.25479-1-francois.perrad@gadz.org>
References: <20191210174004.25479-1-francois.perrad@gadz.org>
Message-ID: <20191218231504.26a30aa2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 10 Dec 2019 18:40:04 +0100
Francois Perrad <fperrad@gmail.com> wrote:

> compatibility with Lua 5.0 was removed in LuaJIT/moonjit 2.1.x
> (Lua 5.1.x and LuaJIT 2.0.x have this compatibility)
> 
> see http://autobuild.buildroot.org/results/4e4/4e428df01def186cb034a1774f6c00e2e7c9468c/build-end.log

This should have been:

Fixes:

  http://autobuild.buildroot.org/results/4e428df01def186cb034a1774f6c00e2e7c9468c/

> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/lua-msgpack-native/lua-msgpack-native.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/lua-msgpack-native/lua-msgpack-native.mk b/package/lua-msgpack-native/lua-msgpack-native.mk
> index acd3a0e1c..b3ca7aef4 100644
> --- a/package/lua-msgpack-native/lua-msgpack-native.mk
> +++ b/package/lua-msgpack-native/lua-msgpack-native.mk
> @@ -11,7 +11,7 @@ LUA_MSGPACK_NATIVE_LICENSE = Apache-2.0
>  LUA_MSGPACK_NATIVE_LICENSE_FILES = LICENSE.txt
>  
>  define LUA_MSGPACK_NATIVE_BUILD_CMDS
> -	$(TARGET_CC) $(TARGET_CFLAGS) -fPIC -shared -o $(@D)/msgpack.so $(@D)/mp.c
> +	$(TARGET_CC) $(TARGET_CFLAGS) -DluaL_reg=luaL_Reg -fPIC -shared -o $(@D)/msgpack.so $(@D)/mp.c

I've added a comment in the .mk file to explain this, as it is a bit
weird, and then I've applied to master.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
