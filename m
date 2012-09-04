From: Francois Perrad <fperrad@gmail.com>
Date: Tue,  4 Sep 2012 08:58:39 +0200
Subject: [Buildroot] [PATCH 3/5] luajit: allow building for the host
In-Reply-To: <1346741921-28968-1-git-send-email-francois.perrad@gadz.org>
References: <1346741921-28968-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1346741921-28968-3-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luajit/luajit.mk |   10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
index 913bc0c..e82df64 100644
--- a/package/luajit/luajit.mk
+++ b/package/luajit/luajit.mk
@@ -50,6 +50,11 @@ define LUAJIT_BUILD_CMDS
 		-C $(@D) amalg
 endef
 
+define HOST_LUAJIT_BUILD_CMDS
+	$(MAKE) PREFIX="/usr" \
+		-C $(@D) amalg
+endef
+
 define LUAJIT_INSTALL_STAGING_CMDS
 	$(MAKE) PREFIX="/usr" DESTDIR="$(STAGING_DIR)" -C $(@D) install
 endef
@@ -58,8 +63,13 @@ define LUAJIT_INSTALL_TARGET_CMDS
 	$(MAKE) PREFIX="/usr" DESTDIR="$(TARGET_DIR)" -C $(@D) install
 endef
 
+define HOST_LUAJIT_INSTALL_CMDS
+	$(MAKE) PREFIX="/usr" DESTDIR="$(HOST_DIR)" -C $(@D) install
+endef
+
 define LUAJIT_CLEAN_CMDS
 	-$(MAKE) -C $(@D) clean
 endef
 
 $(eval $(generic-package))
+$(eval $(host-generic-package))
-- 
1.7.9.5
