From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Nov 2014 14:28:45 +0100
Subject: [Buildroot] [git commit] host-qemu: fix install
Message-ID: <20141115140215.5E3ACB44DF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f0bd293ffd227908e1d09d61e08486d5259b5cfb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

at configure time, PREFIX is already set with $(HOST_DIR)/usr
so, don't use DESTDIR

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qemu/qemu.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
