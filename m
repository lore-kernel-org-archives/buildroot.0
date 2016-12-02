From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 2 Dec 2016 22:37:55 +0100
Subject: [Buildroot] [git commit] package/libimxvpuapi: make it a waf-package
Message-ID: <20161202225223.507E981E52@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c1968da4b5e0bfc26fe8c8520aad940b6349b531
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Gary Bisson <gary.bisson@boundarydevices.com>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Tested-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libimxvpuapi/libimxvpuapi.mk | 23 +----------------------
 1 file changed, 1 insertion(+), 22 deletions(-)

diff --git a/package/libimxvpuapi/libimxvpuapi.mk b/package/libimxvpuapi/libimxvpuapi.mk
index df84806..fde4429 100644
--- a/package/libimxvpuapi/libimxvpuapi.mk
+++ b/package/libimxvpuapi/libimxvpuapi.mk
@@ -11,25 +11,4 @@ LIBIMXVPUAPI_LICENSE_FILES = LICENSE
 LIBIMXVPUAPI_DEPENDENCIES = host-pkgconf host-python imx-vpu
 LIBIMXVPUAPI_INSTALL_STAGING = YES
 
-define LIBIMXVPUAPI_CONFIGURE_CMDS
-	cd $(@D); \
-	$(TARGET_CONFIGURE_OPTS) $(HOST_DIR)/usr/bin/python2 ./waf configure \
-		--prefix=/usr --libdir=/usr/lib
-endef
-
-define LIBIMXVPUAPI_BUILD_CMDS
-	cd $(@D); \
-	$(HOST_DIR)/usr/bin/python2 ./waf build -j $(PARALLEL_JOBS)
-endef
-
-define LIBIMXVPUAPI_INSTALL_STAGING_CMDS
-	cd $(@D); \
-	$(HOST_DIR)/usr/bin/python2 ./waf --destdir=$(STAGING_DIR) install
-endef
-
-define LIBIMXVPUAPI_INSTALL_TARGET_CMDS
-	cd $(@D); \
-	$(HOST_DIR)/usr/bin/python2 ./waf --destdir=$(TARGET_DIR) install
-endef
-
-$(eval $(generic-package))
+$(eval $(waf-package))
