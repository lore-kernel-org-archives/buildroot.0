From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Wed, 21 Dec 2016 17:22:44 -0300
Subject: [Buildroot] [PATCH] lzlib: depends on lua
Message-ID: <20161221202244.7197-1-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

It's missing the dependency on lua, hence when using the upcoming PPS
support its staging directory isn't populated with the required
dependencies resulting in build failure.

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
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
-- 
2.10.2
