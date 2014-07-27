From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Jul 2014 10:34:16 +0200
Subject: [Buildroot] [git commit] luajit: add host variant
Message-ID: <20140727122850.EC4369D2E7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f3f0dcc909cd4ff3a34e356d2dae80d3df203ad1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

the goal is to use host-luajit with pkg-luarocks
when luajit is on the selected luainterpreter for the target

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/luajit/luajit.mk |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

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
