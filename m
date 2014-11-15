From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 15 Nov 2014 11:58:00 +0100
Subject: [Buildroot] [PATCH] host-qemu: fix install
Message-ID: <1416049080-6544-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

at configure time, PREFIX is already set with $(HOST_DIR)/usr
so, don't use DESTDIR

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/qemu/qemu.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index fe65a87..253b2b8 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -75,7 +75,7 @@ define HOST_QEMU_BUILD_CMDS
 endef

 define HOST_QEMU_INSTALL_CMDS
-	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(HOST_DIR) install
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) install
 endef

 $(eval $(host-generic-package))
--
2.1.0
