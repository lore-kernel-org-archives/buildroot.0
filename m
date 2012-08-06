From: =?ISO-8859-1?Q?Fran=E7ois_Perrad?= <francois.perrad@gadz.org>
Date: Mon, 6 Aug 2012 09:31:22 +0200
Subject: [Buildroot] [PATCH] lua-msgpack-native: new package
In-Reply-To: <1344200497-24124-2-git-send-email-wzab01@gmail.com>
References: <1344200497-24124-1-git-send-email-wzab01@gmail.com>
 <1344200497-24124-2-git-send-email-wzab01@gmail.com>
Message-ID: <CAB0FRsuG=xWDKVtk1182H24VmUbq2u44UCKxyH=DEe0Sj1+02Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2012/8/5 Wojciech M. Zabolotny <wzab01@gmail.com>:
> From: "Wojciech M. Zabolotny" <wzab01@gmail.com>
>
> I needed to add the fast msgpack implementation of msgpack library for Lua
> I've choosen the lua-msgpack-native implementation available at:
> https://github.com/kengonakajima/lua-msgpack-native
>
> The original sources come with Makefile creating dependences on another
> software. Therefore I've replaced the original Makefile with
> seriously simplified makefile, sufficient to compile the original
> source mp.c for buildroot.
>

In this case, a Makefile is useless, see below
So, lua-msgpack-native-41cce91ab6-0001.patch is useless
I also add license information.

Fran?ois

#############################################################
#
# lua-msgpack-native
#
#############################################################
LUA_MSGPACK_NATIVE_VERSION = 41cce91ab6
LUA_MSGPACK_NATIVE_SITE = git://github.com/kengonakajima/lua-msgpack-native.git
LUA_MSGPACK_NATIVE_METHOD = git
LUA_MSGPACK_NATIVE_DEPENDENCIES = lua
LUA_MSGPACK_NATIVE_LICENSE = Apache-2.0
LUA_MSGPACK_NATIVE_LICENSE_FILES = LICENSE.txt

define LUA_MSGPACK_NATIVE_BUILD_CMDS
	$(TARGET_CC) $(TARGET_CFLAGS) -fPIC -shared -o $(@D)/msgpack.so $(@D)/mp.c
endef

define LUA_MSGPACK_NATIVE_INSTALL_TARGET_CMDS
	$(INSTALL) -m 755 -D $(@D)/msgpack.so $(TARGET_DIR)/usr/lib/lua/msgpack.so
endef

define LUA_MSGPACK_NATIVE_UNINSTALL_TARGET_CMDS
	rm -f $(TARGET_DIR)/usr/lib/lua/msgpack.so
endef

define LUA_MSGPACK_NATIVE_CLEAN_CMDS
	rm -f $(@D)/msgpack.so
endef

$(eval $(generic-package))

> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
