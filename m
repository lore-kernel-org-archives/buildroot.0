From: Francois Perrad <fperrad@gmail.com>
Date: Sat,  1 Mar 2014 18:23:05 +0100
Subject: [Buildroot] [lua V3 4/8] luajit: add host variant
In-Reply-To: <1393694590-29945-1-git-send-email-francois.perrad@gadz.org>
References: <1393694590-29945-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1393694590-29945-5-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luajit/luajit.mk |    9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
index 859425a..cb1d94e 100644
--- a/package/luajit/luajit.mk
+++ b/package/luajit/luajit.mk
@@ -62,4 +62,13 @@ define LUAJIT_INSTALL_TARGET_CMDS
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
1.7.9.5
