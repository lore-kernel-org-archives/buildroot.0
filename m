From: Francois Perrad <fperrad@gmail.com>
Date: Mon, 24 Feb 2014 08:34:42 +0100
Subject: [Buildroot] [PATCH 06/24] luajit: add host-luajit
In-Reply-To: <1393227301-14874-1-git-send-email-francois.perrad@gadz.org>
References: <1393227301-14874-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1393227301-14874-7-git-send-email-francois.perrad@gadz.org>
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
index 01fbb78..f742333 100644
--- a/package/luajit/luajit.mk
+++ b/package/luajit/luajit.mk
@@ -56,4 +56,13 @@ define LUAJIT_INSTALL_TARGET_CMDS
 	$(MAKE) PREFIX="/usr" DESTDIR="$(TARGET_DIR)" -C $(@D) install
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
