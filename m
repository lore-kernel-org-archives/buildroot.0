From: Yann E. MORIN <yann.morin@orange.com>
Date: Thu, 23 Jun 2016 09:09:34 +0200
Subject: [Buildroot] [PATCH 1/2] package/gmock: install .pc file
Message-ID: <1466665775-715-1-git-send-email-yann.morin@orange.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin@orange.com>
Signed-off-by: Cedric Chedaleux <cedric.chedaleux@orange.com>
---
 package/gmock/gmock.mk |  2 ++
 package/gmock/gmock.pc | 11 +++++++++++
 2 files changed, 13 insertions(+)
 create mode 100644 package/gmock/gmock.pc

diff --git a/package/gmock/gmock.mk b/package/gmock/gmock.mk
index a0351d0..4f04422 100644
--- a/package/gmock/gmock.mk
+++ b/package/gmock/gmock.mk
@@ -39,6 +39,8 @@ define GMOCK_INSTALL_STAGING_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/lib/.libs/libgmock_main.a $(STAGING_DIR)/usr/lib/libgmock_main.a
 	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/include/gmock/
 	cp -rp $(@D)/include/gmock/* $(STAGING_DIR)/usr/include/gmock/
+	$(INSTALL) -D -m 0755 package/gmock/gmock.pc \
+		$(STAGING_DIR)/usr/lib/pkgconfig/gmock.pc
 endef
 
 # Unzipping inside $(@D) and moving everything from the created subdirectory is
diff --git a/package/gmock/gmock.pc b/package/gmock/gmock.pc
new file mode 100644
index 0000000..2f90068
--- /dev/null
+++ b/package/gmock/gmock.pc
@@ -0,0 +1,11 @@
+prefix=/usr
+exec_prefix=${prefix}
+libdir=${prefix}/lib/
+includedir=${prefix}/include
+
+Name: gmock
+Description: Google C++ Mocking Framework
+Version: 1.7.0
+Libs: -L${libdir} -lgmock
+Libs.private: -lpthread
+Cflags: -I${includedir}
-- 
1.9.1
