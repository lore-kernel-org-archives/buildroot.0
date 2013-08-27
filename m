From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Aug 2013 19:28:31 +0200
Subject: [Buildroot] [PATCHv2 1/4] kmod: indent properly the
	KMOD_INSTALL_TOOLS macro
In-Reply-To: <1377624514-10510-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1377624514-10510-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1377624514-10510-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The KMOD_INSTALL_TOOLS macro uses a non-conventional indentation. This
commit fixes this.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kmod/kmod.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index 72a24af..71a2632 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -44,8 +44,9 @@ KMOD_DEPENDENCIES += \
 	$(if $(BR2_PACKAGE_MODULE_INIT_TOOLS),module-init-tools)
 
 define KMOD_INSTALL_TOOLS
-	for i in depmod insmod lsmod modinfo modprobe rmmod; \
-	do ln -sf ../usr/bin/kmod $(TARGET_DIR)/sbin/$$i; done
+	for i in depmod insmod lsmod modinfo modprobe rmmod; do \
+		ln -sf ../usr/bin/kmod $(TARGET_DIR)/sbin/$$i; \
+	done
 endef
 
 KMOD_POST_INSTALL_TARGET_HOOKS += KMOD_INSTALL_TOOLS
-- 
1.8.1.2
