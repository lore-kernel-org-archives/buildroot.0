From: Cam Mannett <camden.mannett@gmail.com>
Date: Fri, 24 Feb 2017 22:44:08 +0000
Subject: [Buildroot] [PATCH 1/2] pru-software-support: bump version to 5.1.0
Message-ID: <20170224224408.8647-1-camden.mannett@protonmail.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Cam Mannett <camden.mannett@protonmail.ch>
---
 package/pru-software-support/pru-software-support.hash |  2 +-
 package/pru-software-support/pru-software-support.mk   | 17 ++++++++++++++---
 2 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/package/pru-software-support/pru-software-support.hash b/package/pru-software-support/pru-software-support.hash
index 8f624da..08ca8d2 100644
--- a/package/pru-software-support/pru-software-support.hash
+++ b/package/pru-software-support/pru-software-support.hash
@@ -1,2 +1,2 @@
 # Locally-calculated hash
-sha256	b257535ca9b1641d1a238795f3c7004064c573a91cf4a1fa566e3f7c2360c38f	pru-software-support-804b548e69ef9fdf44445f6d0968d81cb8a1e7b4.tar.gz
+sha256	1e880d74f9a1d04324e6255cb7a0e3d40f92e08809dc81dc6c714447bac5c335	v5.1.0
diff --git a/package/pru-software-support/pru-software-support.mk b/package/pru-software-support/pru-software-support.mk
index 06983c2..2b29efe 100644
--- a/package/pru-software-support/pru-software-support.mk
+++ b/package/pru-software-support/pru-software-support.mk
@@ -4,13 +4,24 @@
 #
 ################################################################################
 
-PRU_SOFTWARE_SUPPORT_VERSION = 804b548e69ef9fdf44445f6d0968d81cb8a1e7b4
-PRU_SOFTWARE_SUPPORT_SITE = git://git.ti.com/pru-software-support-package/pru-software-support-package.git
+PRU_SOFTWARE_SUPPORT_VERSION = v5.1.0
+PRU_SOFTWARE_SUPPORT_SOURCE = $(PRU_SOFTWARE_SUPPORT_VERSION)
+PRU_SOFTWARE_SUPPORT_SITE = https://git.ti.com/pru-software-support-package/pru-software-support-package/archive-tarball
 PRU_SOFTWARE_SUPPORT_LICENSE =  BSD-3c, GPLv2, Public Domain
-PRU_SOFTWARE_SUPPORT_LICENSE_FILES = PRU-Package-v4.0-Manifest.html
+PRU_SOFTWARE_SUPPORT_LICENSE_FILES = PRU-Package-v5.0-Manifest.html
 PRU_SOFTWARE_SUPPORT_DEPENDENCIES = host-ti-cgt-pru host-pru-software-support
 HOST_PRU_SOFTWARE_SUPPORT_DEPENDENCIES = host-ti-cgt-pru
 
+PRU_SOFTWARE_SUPPORT_EXTRACT_CMD = tar -C $(@D) --strip-components=1 -xzf $(DL_DIR)/$(PRU_SOFTWARE_SUPPORT_SOURCE)
+
+define PRU_SOFTWARE_SUPPORT_EXTRACT_CMDS
+	$(PRU_SOFTWARE_SUPPORT_EXTRACT_CMD)
+endef
+
+define HOST_PRU_SOFTWARE_SUPPORT_EXTRACT_CMDS
+	$(PRU_SOFTWARE_SUPPORT_EXTRACT_CMD)
+endef
+
 define HOST_PRU_SOFTWARE_SUPPORT_BUILD_CMDS
 	$(MAKE) PRU_CGT=$(TI_CGT_PRU_INSTALLDIR) -C $(@D)/lib/src
 endef
-- 
2.9.3
