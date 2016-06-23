From: Yann E. MORIN <yann.morin@orange.com>
Date: Thu, 23 Jun 2016 09:09:35 +0200
Subject: [Buildroot] [PATCH 2/2] package/gtest: add and install a .pc file
In-Reply-To: <1466665775-715-1-git-send-email-yann.morin@orange.com>
References: <1466665775-715-1-git-send-email-yann.morin@orange.com>
Message-ID: <1466665775-715-2-git-send-email-yann.morin@orange.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin@orange.com>
Signed-off-by: Cedric Chedaleux <cedric.chedaleux@orange.com>
---
 package/gtest/gtest.mk |  2 ++
 package/gtest/gtest.pc | 11 +++++++++++
 2 files changed, 13 insertions(+)
 create mode 100644 package/gtest/gtest.pc

diff --git a/package/gtest/gtest.mk b/package/gtest/gtest.mk
index da08621..a4ef45b 100644
--- a/package/gtest/gtest.mk
+++ b/package/gtest/gtest.mk
@@ -31,6 +31,8 @@ define GTEST_INSTALL_STAGING_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/libgtest_main.a $(STAGING_DIR)/usr/lib/libgtest_main.a
 	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/include/gtest/
 	cp -rp $(@D)/include/gtest/* $(STAGING_DIR)/usr/include/gtest/
+	$(INSTALL) -D -m 0644 packages/gtest/gtest.pc \
+		$(STAGING_DIR)/usr/lib/pkgconfig/gtest.pc
 	# Generate the gtest-config script manually, since the CMake
 	# build system is not doing it.
 	sed 's%@PACKAGE_TARNAME@%gtest%;\
diff --git a/package/gtest/gtest.pc b/package/gtest/gtest.pc
new file mode 100644
index 0000000..b7a8aa4
--- /dev/null
+++ b/package/gtest/gtest.pc
@@ -0,0 +1,11 @@
+prefix=/usr
+exec_prefix=${prefix}
+libdir=${prefix}/lib/
+includedir=${prefix}/include
+
+Name: gtest
+Description: Google C++ Testing Framework
+Version: 1.7.0
+Libs: -L${libdir} -lgtest
+Libs.private: -lpthread
+Cflags: -I${includedir}
-- 
1.9.1
