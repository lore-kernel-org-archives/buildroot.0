From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 2 Sep 2013 22:45:06 +0200
Subject: [Buildroot] [git commit] kmod: indent properly the
	KMOD_INSTALL_TOOLS macro
Message-ID: <20130902213321.F1A259B6B0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=528d15721b5e47f7aa8bdff588996c6a747e328a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The KMOD_INSTALL_TOOLS macro uses a non-conventional indentation. This
commit fixes this.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/kmod/kmod.mk |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index aa197dd..06d8dc5 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -47,8 +47,9 @@ KMOD_DEPENDENCIES += \
 	$(if $(BR2_PACKAGE_MODULE_INIT_TOOLS),module-init-tools)
 
 define KMOD_INSTALL_TOOLS
-	for i in depmod insmod lsmod modinfo modprobe rmmod; \
-	do ln -sf ../usr/bin/kmod $(TARGET_DIR)/sbin/$$i; done
+	for i in depmod insmod lsmod modinfo modprobe rmmod; do \
+		ln -sf ../usr/bin/kmod $(TARGET_DIR)/sbin/$$i; \
+	done
 endef
 
 KMOD_POST_INSTALL_TARGET_HOOKS += KMOD_INSTALL_TOOLS
