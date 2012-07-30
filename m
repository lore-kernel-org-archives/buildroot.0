From: Francois Perrad <fperrad@gmail.com>
Date: Mon, 30 Jul 2012 08:31:28 +0200
Subject: [Buildroot] [PATCH 2/4] luajit: allow building for the host
In-Reply-To: <1343629890-4657-1-git-send-email-francois.perrad@gadz.org>
References: <1343629890-4657-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1343629890-4657-2-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/luajit/luajit.mk |   10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
index b35cdb4..19bf659 100644
--- a/package/luajit/luajit.mk
+++ b/package/luajit/luajit.mk
@@ -48,6 +48,11 @@ define LUAJIT_BUILD_CMDS
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
@@ -56,8 +61,13 @@ define LUAJIT_INSTALL_TARGET_CMDS
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
