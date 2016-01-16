From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 16 Jan 2016 02:04:27 +0100
Subject: [Buildroot] [PATCH] luabitop: disabled for Lua 5.3
In-Reply-To: <1452846532-7780-1-git-send-email-francois.perrad@gadz.org>
References: <1452846532-7780-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <5699971B.2030902@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 15-01-16 09:28, Francois Perrad wrote:
> see failure in http://autobuild.buildroot.net/results/6306c929e9ee05cbb33e4eb6b590166c6554ec21/
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout

> ---
>  package/luabitop/Config.in | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/luabitop/Config.in b/package/luabitop/Config.in
> index c5b3f60..26442fc 100644
> --- a/package/luabitop/Config.in
> +++ b/package/luabitop/Config.in
> @@ -1,11 +1,11 @@
>  config BR2_PACKAGE_LUABITOP
>  	bool "luabitop"
> -	depends on !BR2_PACKAGE_LUA_32BITS
> +	depends on !BR2_PACKAGE_LUA_5_3
>  	help
>  	  Lua BitOp is a C extension module for Lua 5.1/5.2 which adds bitwise
>  	  operations on numbers.
>  
>  	  http://bitop.luajit.org
>  
> -comment "luabitop needs a full Lua interpreter"
> -	depends on BR2_PACKAGE_LUA_32BITS
> +comment "luabitop needs a Lua 5.1/5.2 interpreter"
> +	depends on BR2_PACKAGE_LUA_5_3
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
