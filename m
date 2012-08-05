From: Wojciech M. Zabolotny <wzab01@gmail.com>
Date: Sun,  5 Aug 2012 20:51:08 +0200
Subject: [Buildroot] Added quick and dirty packaging of lua-msgpack-native
Message-ID: <1344192669-29968-1-git-send-email-wzab01@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I needed to add the fast msgpack implementation of msgpack library for Lua
I've choosen the lua-msgpack-native implementation available at:
https://github.com/kengonakajima/lua-msgpack-native

Unfortunately, I couldn't (didn't know how to?) create the package
description, where the source is downloaded as a single file
(namely: https://github.com/kengonakajima/lua-msgpack-native/raw/master/mp.c )
I tried to create the source directory in the package definition like:
LUA_MSGPACK_NATIVE_SITE = file://$(TOPDIR)/package/lua-msgpack-native/src
LUA_MSGPACK_NATIVE_METHOD = local
but it didn't work for me - buildroot still tried to download the tarball.

Finally I've given up and created tarball of the source directory.
This tarball is of course included in the patch.

The package was tested on a x86_64 architecture.
