From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 11 Dec 2018 23:09:15 +0100
Subject: [Buildroot] [PATCH] package/lua-cqueues: needs host-m4
In-Reply-To: <20181211161344.1481-1-thomas.petazzoni@bootlin.com>
References: <20181211161344.1481-1-thomas.petazzoni@bootlin.com>
Message-ID: <831235cd-adea-733c-087f-c7b55b6508be@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 11/12/2018 17:13, Thomas Petazzoni wrote:
> The lua-cqueues build system uses m4 during the build:
> 
> cd /home/test/autobuild/run/instance-1/output/build/lua-cqueues-rel-20161215/src && m4 /home/test/autobuild/run/instance-1/output/build/lua-cqueues-rel-20161215/src/errno.c.m4 >| /home/test/autobuild/run/instance-1/output/build/lua-cqueues-rel-20161215/src/errno.c.tmp
> 
> Therefore, the package should depend on host-m4. This has been
> detected using per-package directory support, but a minimal defconfig
> with just lua and lua-cqueues on a system that doesn't have m4
> installed system-wide also exhibits the issue.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/lua-cqueues/lua-cqueues.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/lua-cqueues/lua-cqueues.mk b/package/lua-cqueues/lua-cqueues.mk
> index 4f4be1e049..4f31c3277f 100644
> --- a/package/lua-cqueues/lua-cqueues.mk
> +++ b/package/lua-cqueues/lua-cqueues.mk
> @@ -8,7 +8,7 @@ LUA_CQUEUES_VERSION = rel-20161215
>  LUA_CQUEUES_SITE = $(call github,wahern,cqueues,$(LUA_CQUEUES_VERSION))
>  LUA_CQUEUES_LICENSE = MIT
>  LUA_CQUEUES_LICENSE_FILES = LICENSE
> -LUA_CQUEUES_DEPENDENCIES = luainterpreter openssl
> +LUA_CQUEUES_DEPENDENCIES = luainterpreter openssl host-m4
>  
>  define LUA_CQUEUES_BUILD_CMDS
>  	$(TARGET_MAKE_ENV) $(MAKE1) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
> 
