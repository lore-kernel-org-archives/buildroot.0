From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Aug 2017 14:15:53 +0200
Subject: [Buildroot] [PATCH] lua: refactor with a common template
 lua.pc.in
In-Reply-To: <20170820083856.13579-1-francois.perrad@gadz.org>
References: <20170820083856.13579-1-francois.perrad@gadz.org>
Message-ID: <20170820141553.0d626cd1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 20 Aug 2017 10:38:56 +0200, Francois Perrad wrote:

> +define LUA_CONFIGURE_CMDS
> +	sed -e "s/@VERSION@/$(LUA_VERSION)/;s/@ABI@/$(LUAINTERPRETER_ABIVER)/;s/@MYLIBS@/$(LUA_MYLIBS)/" \
> +		package/lua/lua.pc.in > $(@D)/lua.pc
> +endef
> +
> +define HOST_LUA_CONFIGURE_CMDS
> +	sed -e "s/@VERSION@/$(LUA_VERSION)/;s/@ABI@/$(LUAINTERPRETER_ABIVER)/;s/@MYLIBS@/$(HOST_LUA_MYLIBS)/" \
> +		package/lua/lua.pc.in > $(@D)/lua.pc
> +endef

I still disagree, and still believe that it should be done as part of
the <pkg>_BUILD_CMDS step.

Also, could you clarify if you intend this patch to be merged in the
master branch or in the next branch.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
