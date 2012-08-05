From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 5 Aug 2012 21:13:23 +0200
Subject: [Buildroot] Added quick and dirty packaging of
	lua-msgpack-native
In-Reply-To: <1344192669-29968-1-git-send-email-wzab01@gmail.com>
References: <1344192669-29968-1-git-send-email-wzab01@gmail.com>
Message-ID: <CAHXCMMJtM4Ng3E-96JnEc0uRSgS3Ad1H23mZsdaAY+YMEJEoog@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Wojciech,

2012/8/5 Wojciech M. Zabolotny <wzab01@gmail.com>:
> I needed to add the fast msgpack implementation of msgpack library for Lua
> I've choosen the lua-msgpack-native implementation available at:
> https://github.com/kengonakajima/lua-msgpack-native
>
> Unfortunately, I couldn't (didn't know how to?) create the package
> description, where the source is downloaded as a single file
> (namely: https://github.com/kengonakajima/lua-msgpack-native/raw/master/mp.c )
> I tried to create the source directory in the package definition like:
> LUA_MSGPACK_NATIVE_SITE = file://$(TOPDIR)/package/lua-msgpack-native/src
> LUA_MSGPACK_NATIVE_METHOD = local
> but it didn't work for me - buildroot still tried to download the tarball.
Actually, by overriding LUA_MSGPACK_NATIVE_METHOD, you are on the right path ;)
Just set:
LUA_MSGPACK_NATIVE_VERSION = <commit>
LUA_MSGPACK_NATIVE_SITE = <git repo url>
LUA_MSGPACK_NATIVE_METHOD = git

Here is an example:
http://git.buildroot.net/buildroot/tree/package/omap-u-boot-utils/omap-u-boot-utils.mk


Cheers,


-- 
Sam
