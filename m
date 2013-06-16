From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 16 Jun 2013 21:52:48 +0200
Subject: [Buildroot] [PATCH 04/12] lbase64: New package
In-Reply-To: <CAB0FRsvjB7MFkQ802sOa3tPxd2xc-rYXveNWRp1zjOKxj8Rwug@mail.gmail.com>
 (=?utf-8?Q?=22Fran=C3=A7ois?= Perrad"'s message of "Mon, 20 May 2013
 18:00:42 +0200")
References: <1369054604-26139-1-git-send-email-shmuelzon@gmail.com>
 <1369054604-26139-4-git-send-email-shmuelzon@gmail.com>
 <CAB0FRsvjB7MFkQ802sOa3tPxd2xc-rYXveNWRp1zjOKxj8Rwug@mail.gmail.com>
Message-ID: <87a9mpvnn3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fran?ois" == Fran?ois Perrad <francois.perrad@gadz.org> writes:

 Fran?ois> 2013/5/20 Assaf Inbal <shmuelzon@gmail.com>

 Fran?ois>     This package adds base64 encode/decode functionality for Lua

 Fran?ois>     Signed-off-by: Assaf Inbal <shmuelzon@gmail.com>
 Fran?ois>     ---
 Fran?ois>     ?package/Config.in ? ? ? ? ?| ?1 +
 Fran?ois>     ?package/lbase64/Config.in ?| ?6 ++++++
 Fran?ois>     ?package/lbase64/lbase64.mk | 30 ++++++++++++++++++++++++++++++
 Fran?ois>     ?3 files changed, 37 insertions(+)
 Fran?ois>     ?create mode 100644 package/lbase64/Config.in
 Fran?ois>     ?create mode 100644 package/lbase64/lbase64.mk

 Fran?ois>     diff --git a/package/Config.in b/package/Config.in
 Fran?ois>     index d980871..0845881 100644
 Fran?ois>     --- a/package/Config.in
 Fran?ois>     +++ b/package/Config.in
 Fran?ois>     @@ -307,6 +307,7 @@ menu "LUA libraries/modules"
 Fran?ois>     ?source "package/cgilua/Config.in"
 Fran?ois>     ?source "package/copas/Config.in"
 Fran?ois>     ?source "package/coxpcall/Config.in"
 Fran?ois>     +source "package/lbase64/Config.in"
 Fran?ois>     ?source "package/luacjson/Config.in"
 Fran?ois>     ?source "package/luaexpat/Config.in"
 Fran?ois>     ?source "package/luafilesystem/Config.in"
 Fran?ois>     diff --git a/package/lbase64/Config.in b/package/lbase64/Config.in
 Fran?ois>     new file mode 100644
 Fran?ois>     index 0000000..bd8503a
 Fran?ois>     --- /dev/null
 Fran?ois>     +++ b/package/lbase64/Config.in
 Fran?ois>     @@ -0,0 +1,6 @@
 Fran?ois>     +config BR2_PACKAGE_LBASE64
 Fran?ois>     + ? ? ? bool "lbase64"
 Fran?ois>     + ? ? ? help
 Fran?ois>     + ? ? ? ? A base64 library for Lua
 Fran?ois>     +
 Fran?ois>     + ? ? ? ? http://luaforge.net/projects/lbase64/
 Fran?ois>     diff --git a/package/lbase64/lbase64.mk b/package/lbase64/lbase64.mk
 Fran?ois>     new file mode 100644
 Fran?ois>     index 0000000..e253f24
 Fran?ois>     --- /dev/null
 Fran?ois>     +++ b/package/lbase64/lbase64.mk
 Fran?ois>     @@ -0,0 +1,30 @@
 Fran?ois>     +#############################################################
 Fran?ois>     +#
 Fran?ois>     +# lbase64
 Fran?ois>     +#
 Fran?ois>     +#############################################################
 Fran?ois>     +
 Fran?ois>     +LBASE64_VERSION =


 Fran?ois> LBASE64_VERSION = 20100323
 Fran?ois> use the same version as in LuaRocks, this is the date in the source lbase64.c
 Fran?ois> ?
 Fran?ois> Fran?ois

 Fran?ois> Note: the module mime in LuaSocket provides the same kind of
 Fran?ois> features.

Assaf, will you send an updated patch taking the review feedback into
consideration?

-- 
Bye, Peter Korsgaard
