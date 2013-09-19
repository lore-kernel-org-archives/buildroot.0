From: Francois Perrad <fperrad@gmail.com>
Date: Thu, 19 Sep 2013 08:31:39 +0200
Subject: [Buildroot] [PATCH 2/2] luaposix: add ncurses dependency
In-Reply-To: <1379572299-8191-1-git-send-email-francois.perrad@gadz.org>
References: <1379572299-8191-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1379572299-8191-2-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

luaposix includes a curses binding which is optional and auto-detected by autotools.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luaposix/luaposix.mk |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/luaposix/luaposix.mk b/package/luaposix/luaposix.mk
index 1d1ee6a..64c4406 100644
--- a/package/luaposix/luaposix.mk
+++ b/package/luaposix/luaposix.mk
@@ -12,4 +12,8 @@ LUAPOSIX_DEPENDENCIES = lua host-lua
 LUAPOSIX_CONF_OPT = --libdir="/usr/lib/lua" --datarootdir="/usr/share/lua"
 LUAPOSIX_AUTORECONF = YES
 
+ifeq ($(BR2_PACKAGE_NCURSES),y)
+    LUAPOSIX_DEPENDENCIES += ncurses
+endif
+
 $(eval $(autotools-package))
-- 
1.7.9.5
