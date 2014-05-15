From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 15 May 2014 09:40:45 +0200
Subject: [Buildroot] [PATCH 3/3] packages: make providers declare what
	they provide
In-Reply-To: <40eb8c9da48a46856d0acb7576d35d621a9efc9c.1400101273.git.yann.morin.1998@free.fr>
References: <cover.1400101273.git.yann.morin.1998@free.fr>
 <40eb8c9da48a46856d0acb7576d35d621a9efc9c.1400101273.git.yann.morin.1998@free.fr>
Message-ID: <20140515094045.148d404e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Wed, 14 May 2014 23:11:35 +0200, Yann E. MORIN wrote:

>  # DirectFB is not supported (wrong version)
>  ifeq ($(BR2_PACKAGE_XORG7),y)
>  GPU_VIV_BIN_MX6Q_DEPENDENCIES = xlib_libXdamage xlib_libXext
> diff --git a/package/lua/lua.mk b/package/lua/lua.mk
> index bc8799a..4f940ab 100644
> --- a/package/lua/lua.mk
> +++ b/package/lua/lua.mk
> @@ -14,6 +14,8 @@ LUA_INSTALL_STAGING = YES
>  LUA_LICENSE = MIT
>  LUA_LICENSE_FILES = COPYRIGHT
>  
> +LUA_PROVIDES = lua

This should be:

LUA_PROVIDES = luainterpreter

> +LUAJIT_PROVIDES = lua

Same here.

I was surprised by "LUA_PROVIDES = lua". How can a real package provide
itself as a provider for itself as a virtual package ? :-)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
