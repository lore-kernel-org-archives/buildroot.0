From: James Grant <james.grant@jci.com>
Date: Fri, 1 Mar 2019 15:17:11 +1300
Subject: [Buildroot] [PATCH 1/2] package/qt5/qt5base: add custom configure
 options last
Message-ID: <20190301021712.47698-1-james.grant@jci.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This allows all options set by Buildroot to be overridden.

Signed-off-by: James Grant <james.grant@jci.com>
---
 package/qt5/qt5base/qt5base.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 11c6684812..8c0f5f0c9f 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -296,6 +296,9 @@ define QT5BASE_CONFIGURE_HOSTCC
 	$(SED) 's,^QMAKE_CXX\s*=.*,QMAKE_CXX = $(HOSTCXX),' $(@D)/mkspecs/common/g++-base.conf
 endef
 
+# Must be last so can override all options set by Buildroot
+QT5BASE_CONFIGURE_OPTS += $(call qstrip,$(BR2_PACKAGE_QT5BASE_CUSTOM_CONF_OPTS))
+
 define QT5BASE_CONFIGURE_CMDS
 	mkdir -p $(@D)/mkspecs/devices/linux-buildroot-g++/
 	sed 's/@EGLFS_DEVICE@/$(QT5BASE_EGLFS_DEVICE)/g' \
-- 
2.21.0
