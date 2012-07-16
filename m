From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 Jul 2012 17:46:22 +0200
Subject: [Buildroot] [PATCH 4/5] lua : refactor with POST_PATH_HOOKS
In-Reply-To: <1342446352-31231-4-git-send-email-francois.perrad@gadz.org>
References: <1342446352-31231-1-git-send-email-francois.perrad@gadz.org>
 <1342446352-31231-4-git-send-email-francois.perrad@gadz.org>
Message-ID: <20120716174622.6ea0ffea@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 16 Jul 2012 15:45:51 +0200,
Francois Perrad <fperrad@gmail.com> a ?crit :

> +define LUA_PREFIX_FIX_PKG_CONFIG
> +	$(SED) 's/\/usr\/local/\/usr/' $(@D)/etc/lua.pc
> +endef
> +LUA_POST_PATCH_HOOKS += LUA_PREFIX_FIX_PKG_CONFIG
> +HOST_LUA_POST_PATCH_HOOKS += LUA_PREFIX_FIX_PKG_CONFIG
> +
> +define LUA_OPTIM_FIX_MAKEFILE
> +	$(SED) 's/-O2//' $(@D)/src/Makefile
> +endef
> +LUA_POST_PATCH_HOOKS += LUA_OPTIM_FIX_MAKEFILE
> +HOST_LUA_POST_PATCH_HOOKS += LUA_OPTIM_FIX_MAKEFILE

It sounds odd to me to have a patch to fix the /usr prefix in
src/luaconf.h on one side, and on the other side, fix other problems by
using sed in the .mk file. Either one or the other, but not both in the
same package.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
