From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Dec 2016 12:33:07 +0100
Subject: [Buildroot] [PATCH v2,
 1/1] lxc: enable lua if package is selected
In-Reply-To: <1482059092-79108-1-git-send-email-fabrice.fontaine@orange.com>
References: <1482059092-79108-1-git-send-email-fabrice.fontaine@orange.com>
Message-ID: <20161218123307.5e08bec8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 18 Dec 2016 12:04:52 +0100, Fabrice Fontaine wrote:

> +ifeq ($(BR2_PACKAGE_HAS_LUAINTERPRETER),y)
> +LXC_CONF_OPTS += --enable-lua
> +LXC_DEPENDENCIES += luainterpreter
> +ifeq ($(BR2_PACKAGE_LUAJIT),y)
> +# By default, lxc will only search for lua.pc
> +LXC_CONF_OPTS += --with-lua-pc=$(STAGING_DIR)/usr/lib/pkgconfig/luajit.pc

Passing --with-lua-pc=luajit is sufficient, so I've changed it this
way, and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
