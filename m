From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 24 Feb 2014 20:44:45 +0100
Subject: [Buildroot] [PATCH 01/24] lua: remove LUA_INSTALLED_FILES
In-Reply-To: <1393227301-14874-2-git-send-email-francois.perrad@gadz.org>
References: <1393227301-14874-1-git-send-email-francois.perrad@gadz.org>
 <1393227301-14874-2-git-send-email-francois.perrad@gadz.org>
Message-ID: <530BA12D.8040207@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 24/02/14 08:34, Francois Perrad wrote:
> useless since previous commit (remove uninstall commands)
> see http://git.buildroot.net/buildroot/commit/package/lua/lua.mk?id=eb7bd9ef617e5ddc8241981e7896d5b3f30ed9ee

 This should be

Useless since the uninstall commands were removed in eb7bd9ef

> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


> ---
>  package/lua/lua.mk |   11 -----------
>  1 file changed, 11 deletions(-)
> 
> diff --git a/package/lua/lua.mk b/package/lua/lua.mk
> index 2c867f6..a20531c 100644
> --- a/package/lua/lua.mk
> +++ b/package/lua/lua.mk
> @@ -104,16 +104,5 @@ define HOST_LUA_INSTALL_CMDS
>  	$(INSTALL) -m 0644 -D $(@D)/src/lauxlib.h $(HOST_DIR)/usr/include/lauxlib.h
>  endef
>  
> -LUA_INSTALLED_FILES = \
> -	/usr/include/lua.h \
> -	/usr/include/luaconf.h \
> -	/usr/include/lualib.h \
> -	/usr/include/lauxlib.h \
> -	/usr/lib/pkgconfig/lua.pc \
> -	/usr/bin/lua \
> -	/usr/bin/luac \
> -	/usr/lib/liblua.a \
> -	/usr/lib/liblua.so*
> -
>  $(eval $(generic-package))
>  $(eval $(host-generic-package))
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
