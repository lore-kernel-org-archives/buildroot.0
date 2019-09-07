From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 7 Sep 2019 22:57:01 +0200
Subject: [Buildroot] [PATCH v3 1/1] libuwsc: new package
In-Reply-To: <CAGN0SiENZEjdVzVcST6yKrvWxJXqPwD3JqtVMC=fn7VsCbgK0w@mail.gmail.com>
References: <CAGN0SiENZEjdVzVcST6yKrvWxJXqPwD3JqtVMC=fn7VsCbgK0w@mail.gmail.com>
Message-ID: <bef3f5cb-01d2-eb3e-de48-d74ca3db084a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Zhao,

On 06/09/2019 04:38, ??? wrote:
> +
> +ifneq ($(findstring $(BR2_PACKAGE_LUA_5_1)$(BR2_PACKAGE_LUA_5_3), y),)

 This condition can be simplified to

ifeq ($(BR2_PACKAGE_LUA),y)

 Indeed, when Lua is enabled, it is either 5.1 or 5.3.


 That said, does it really depend on plain Lua, i.e. does it not work with
luajit? If it does work with luajit, the condition should be

ifeq ($(BR2_PACKAGE_HAS_LUAINTERPRETER),y)

> +LIBUWSC_DEPENDENCIES += lua

 ... and this would be

LIBUWSC_DEPENDENCIES += luainterpreter


 Regards,
 Arnout

> +LIBUWSC_CONF_OPTS += -DUWSC_LUA_SUPPORT=ON
> +else
> +LIBUWSC_CONF_OPTS += -DUWSC_LUA_SUPPORT=OFF
> +endif
