From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 20 Nov 2018 22:48:23 +0100
Subject: [Buildroot] [PATCH 1/2] libostree: add systemd optional dependency
Message-ID: <20181120214824.9541-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This option is available since v2018.3:
https://github.com/ostreedev/ostree/commit/17db0f15a79835b76ede6785120d237066c57d32

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libostree/libostree.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/libostree/libostree.mk b/package/libostree/libostree.mk
index 4c841dbe4d..8538cdc69c 100644
--- a/package/libostree/libostree.mk
+++ b/package/libostree/libostree.mk
@@ -68,4 +68,13 @@ else
 LIBOSTREE_CONF_OPTS += --without-selinux
 endif
 
+ifeq ($(BR2_INIT_SYSTEMD),y)
+LIBOSTREE_CONF_OPTS += \
+	--with-libsystemd \
+	--with-systemdsystemunitdir=/usr/lib/systemd/system
+LIBOSTREE_DEPENDENCIES += systemd
+else
+LIBOSTREE_CONF_OPTS += --without-libsystemd
+endif
+
 $(eval $(autotools-package))
-- 
2.14.1
