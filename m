From: deinok at deinok.com <deinok@deinok.com>
Date: Tue, 28 May 2019 13:59:18 +0200
Subject: [Buildroot] [PATCH 1/2] package/mender: bump version to 2.0
Message-ID: <20190528115919.26194-1-deinok@deinok.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: deinok <deinok@deinok.com>

Signed-off-by: deinok <deinok@deinok.com>
---
 package/mender/Config.in   | 1 +
 package/mender/mender.hash | 2 +-
 package/mender/mender.mk   | 3 ++-
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/mender/Config.in b/package/mender/Config.in
index 5ab2304e49..3fc93f9f06 100644
--- a/package/mender/Config.in
+++ b/package/mender/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_MENDER
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_UBOOT_TOOLS # runtime
 	select BR2_PACKAGE_UBOOT_TOOLS_FWPRINTENV # runtime
+	select BR2_PACKAGE_XZ
 	help
 	  Mender is an open source over-the-air (OTA) software updater
 	  for embedded Linux devices. Mender comprises a client
diff --git a/package/mender/mender.hash b/package/mender/mender.hash
index 89aec239b1..d5c319e9c5 100644
--- a/package/mender/mender.hash
+++ b/package/mender/mender.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256 caee18d1b8446df0cbb9a9c5a1c040d7eb1924332da94c3489494443a8077eb8 1.7.0.tar.gz
+sha256 af37a11c4189097b485254c35450f289b078bc61f6a230d6540743f202d81b98 2.0.0.tar.gz
 
 # Apache-2.0 license, locally computed
 sha256 98ed35b5a138f58164b5c0dbccd9d7f01ef4d84b9dba01e896f0a3241c50c0f7 LICENSE
diff --git a/package/mender/mender.mk b/package/mender/mender.mk
index 07f6e5e5f9..132b09c738 100644
--- a/package/mender/mender.mk
+++ b/package/mender/mender.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-MENDER_VERSION = 1.7.0
+MENDER_VERSION = 2.0.0
 MENDER_SITE = https://github.com/mendersoftware/mender/archive
 MENDER_SOURCE = $(MENDER_VERSION).tar.gz
 MENDER_LICENSE = Apache-2.0, BSD-2-Clause, BSD-3-Clause, ISC, MIT, OLDAP-2.8
+MENDER_DEPENDENCIES = xz
 
 # Vendor license paths generated with:
 #    awk '{print $2}' LIC_FILES_CHKSUM.sha256 | grep vendor
-- 
2.17.1
