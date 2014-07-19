From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 19 Jul 2014 16:38:55 +0200
Subject: [Buildroot] [lua V4 1/4] luajit: add host variant
In-Reply-To: <1405780738-31323-1-git-send-email-francois.perrad@gadz.org>
References: <1405780738-31323-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1405780738-31323-2-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

the goal is to use host-luajit with pkg-luarocks
when luajit is on the selected luainterpreter for the target

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luajit/luajit.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
index 72240b2..42d6a72 100644
--- a/package/luajit/luajit.mk
+++ b/package/luajit/luajit.mk
@@ -64,4 +64,13 @@ define LUAJIT_INSTALL_TARGET_CMDS
 	$(MAKE) PREFIX="/usr" DESTDIR="$(TARGET_DIR)" LDCONFIG=true -C $(@D) install
 endef
 
+define HOST_LUAJIT_BUILD_CMDS
+	$(MAKE) PREFIX="/usr" BUILDMODE=static -C $(@D) amalg
+endef
+
+define HOST_LUAJIT_INSTALL_CMDS
+	$(MAKE) PREFIX="/usr" DESTDIR="$(HOST_DIR)" -C $(@D) install
+endef
+
 $(eval $(generic-package))
+$(eval $(host-generic-package))
-- 
1.9.1
