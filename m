From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 10 Mar 2016 23:52:32 +0100
Subject: [Buildroot] [PATCH] lzlib: fix Lua dependency
In-Reply-To: <1457561898-2054-1-git-send-email-joerg.krause@embedded.rocks>
References: <1457561898-2054-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20160310235232.4367c8dd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Wed,  9 Mar 2016 23:18:18 +0100, J?rg Krause wrote:
> lzlib cannot be build with LuaJIT and requires Lua 5.x.
> 
> Fixes:
> http://autobuild.buildroot.net/results/d71/d71209c3e5235f507afee38b618d5740ef91fdcb/
> http://autobuild.buildroot.net/results/ef8/ef80136ec17ad9b0a5e3121c4b6091b15c3da0d4/
> http://autobuild.buildroot.net/results/5e9/5e9d77e415e8cafb842b84d3d6d91280ae5491e3/
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  package/lzlib/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/lzlib/Config.in b/package/lzlib/Config.in
> index f7fae15..32328c5 100644
> --- a/package/lzlib/Config.in
> +++ b/package/lzlib/Config.in
> @@ -1,7 +1,7 @@
>  config BR2_PACKAGE_LZLIB
>  	bool "lzlib"
>  	select BR2_PACKAGE_ZLIB
> -	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
> +	depends on BR2_PACKAGE_LUA

It is somewhat surprising that a *new* version removes support for
LuaJIT.

But OK, applied. If anybody cares about lzlib in a LuaJIT context, they
can fix this up.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
