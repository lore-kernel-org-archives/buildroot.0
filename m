From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Dec 2016 10:56:34 +0100
Subject: [Buildroot] [PATCH 1/1] lxc: enable lua if package is selected
In-Reply-To: <1482016189-32585-1-git-send-email-fabrice.fontaine@orange.com>
References: <1482016189-32585-1-git-send-email-fabrice.fontaine@orange.com>
Message-ID: <20161218105634.1e9ada3e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 18 Dec 2016 00:09:49 +0100, Fabrice Fontaine wrote:

> +ifeq ($(BR2_PACKAGE_LUA),y)
> +LXC_CONF_OPTS += --enable-lua
> +LXC_DEPENDENCIES += lua
> +else
> +LXC_CONF_OPTS += --disable-lua
> +endif

Does it work only with classic Lua, or also with LuaJIT? If it works
with LuaJIT, then we should do:

ifeq ($(BR2_PACKAGE_HAS_LUA_INTERPRETER),y)
LXC_CONF_OPTS += --enable-lua
LXC_DEPENDENCIES += luainterpreter
else
LXC_CONF_OPTS += --disable-lua
endif

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
