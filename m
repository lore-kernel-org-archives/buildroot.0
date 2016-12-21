From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 21 Dec 2016 22:18:39 +0100
Subject: [Buildroot] [git commit] lzlib: depends on lua
Message-ID: <20161221211911.53840818C0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c4cb7a46ac5e4fe4cb88836903f2779fa7dc83d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It's missing the dependency on lua, hence when using the upcoming PPS
support its staging directory isn't populated with the required
dependencies resulting in build failure.

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lzlib/lzlib.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lzlib/lzlib.mk b/package/lzlib/lzlib.mk
index 91f380a..f468a1c 100644
--- a/package/lzlib/lzlib.mk
+++ b/package/lzlib/lzlib.mk
@@ -6,7 +6,7 @@
 
 LZLIB_VERSION = 0.4.3
 LZLIB_SITE = $(call github,LuaDist,lzlib,$(LZLIB_VERSION))
-LZLIB_DEPENDENCIES = zlib
+LZLIB_DEPENDENCIES = lua zlib
 LZLIB_LICENSE = MIT
 LZLIB_CONF_OPTS = -DINSTALL_CMOD="/usr/lib/lua/$(LUAINTERPRETER_ABIVER)" \
 	-DINSTALL_LMOD="/usr/share/lua/$(LUAINTERPRETER_ABIVER)"
