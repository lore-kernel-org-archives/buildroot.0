From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Jun 2016 17:58:46 +0200
Subject: [Buildroot] [git commit] package/gmock: install .pc file
Message-ID: <20160624160016.4316581EB2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4dd576b563eff108de16e7318443016c89798e09
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin@orange.com>
Signed-off-by: Cedric Chedaleux <cedric.chedaleux@orange.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gmock/gmock.mk |  2 ++
 package/gmock/gmock.pc | 11 +++++++++++
 2 files changed, 13 insertions(+)

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
