From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 17 Nov 2012 20:48:28 +0100
Subject: [Buildroot] [PATCH] host-lua: fix bug #5354
In-Reply-To: <1353146744-13529-1-git-send-email-francois.perrad@gadz.org>
 (Francois Perrad's message of "Sat, 17 Nov 2012 11:05:43 +0100")
References: <1353146744-13529-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <87boewt3hv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Francois" == Francois Perrad <fperrad@gmail.com> writes:

 Francois> see https://bugs.busybox.net/show_bug.cgi?id=5354

Thanks, but I don't get the problem in the first place. Lua links
lua/luac using gcc, so why doesn't it pick up the stack protection bits?

 Francois> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
 Francois> ---
 Francois>  package/lua/lua.mk |    2 +-
 Francois>  1 file changed, 1 insertion(+), 1 deletion(-)

 Francois> diff --git a/package/lua/lua.mk b/package/lua/lua.mk
 Francois> index 9e0d387..3ce9867 100644
 Francois> --- a/package/lua/lua.mk
 Francois> +++ b/package/lua/lua.mk
 Francois> @@ -24,7 +24,7 @@ endif
 Francois>  # We never want to have host-readline and host-ncurses as dependencies
 Francois>  # of host-lua.
 Francois>  HOST_LUA_DEPENDENCIES =
 Francois> -HOST_LUA_CFLAGS = -Wall -fPIC -DLUA_USE_DLOPEN -DLUA_USE_POSIX
 Francois> +HOST_LUA_CFLAGS = -Wall -fPIC -fno-stack-protector -DLUA_USE_DLOPEN -DLUA_USE_POSIX
 Francois>  HOST_LUA_MYLIBS = -ldl
 
 Francois>  define LUA_BUILD_CMDS
 Francois> -- 
 Francois> 1.7.9.5

 Francois> _______________________________________________
 Francois> buildroot mailing list
 Francois> buildroot at busybox.net
 Francois> http://lists.busybox.net/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
