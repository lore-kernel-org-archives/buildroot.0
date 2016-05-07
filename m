From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 7 May 2016 09:14:56 +0200
Subject: [Buildroot] [PATCH v3 3/3] swupdate: bump to version 2016.04
In-Reply-To: <1462187815-2414-3-git-send-email-joerg.krause@embedded.rocks>
References: <1462187815-2414-1-git-send-email-joerg.krause@embedded.rocks>
 <1462187815-2414-3-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20160507091456.1d990bc3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  2 May 2016 13:16:55 +0200, J?rg Krause wrote:

> -ifeq ($(BR2_PACKAGE_LUA_5_2),y)
> +ifeq ($(BR2_PACKAGE_LUA),y)
>  SWUPDATE_DEPENDENCIES += lua

pkg-config is used by the swupdate to find the Lua linker/compiler
flags. It seems to default to values that happen to work, but with some
error messages:

>>> swupdate 2016.04 Building
[...]
scripts/kconfig/conf  --silentoldconfig Kconfig
Package lua was not found in the pkg-config search path.
Perhaps you should add the directory containing `lua.pc'
to the PKG_CONFIG_PATH environment variable
No package 'lua' found
Package lua was not found in the pkg-config search path.
Perhaps you should add the directory containing `lua.pc'
to the PKG_CONFIG_PATH environment variable
No package 'lua' found

So I've added host-pkgconf in the dependencies here.

And then I've applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
