From: =?UTF-8?q?Beno=C3=AEt=20Th=C3=A9baudeau?= <benoit.thebaudeau@advansee.com>
Date: Wed,  6 Aug 2014 15:39:08 +0200
Subject: [Buildroot] [PATCH v2 1/3] rpi-userland: Bump version
Message-ID: <1407332350-27220-1-git-send-email-benoit.thebaudeau@advansee.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump version to f9e6f9f3def8dc18dc0092cd695ccf53b8ba3efe and revert local commit
f22830e456833e98e11f09d2aa38017f5aaa557c 'rpi-userland: add patch fix missing
libvcilcs install rules' in order to replace the local patch from this commit by
the upstream commit 1ecc49c97b7be3d524cb4cfc97401f16b485a4ee 'vmcs_host: Fix
missing install of libvcilcs.so'.

Signed-off-by: Beno?t Th?baudeau <benoit.thebaudeau@advansee.com>

---

Changes in v2: New patch
---
 ...vmcs_host-add-install-rules-for-libvcilcs.patch | 23 ----------------------
 package/rpi-userland/rpi-userland.mk               |  2 +-
 2 files changed, 1 insertion(+), 24 deletions(-)
 delete mode 100644 package/rpi-userland/rpi-userland-003-interface-vmcs_host-add-install-rules-for-libvcilcs.patch

diff --git a/package/rpi-userland/rpi-userland-003-interface-vmcs_host-add-install-rules-for-libvcilcs.patch b/package/rpi-userland/rpi-userland-003-interface-vmcs_host-add-install-rules-for-libvcilcs.patch
deleted file mode 100644
index 05cf4b3..0000000
--- a/package/rpi-userland/rpi-userland-003-interface-vmcs_host-add-install-rules-for-libvcilcs.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-From b60398837ddf39d4b605600abc167d4366e454a6 Mon Sep 17 00:00:00 2001
-From: Samuel Martin <s.martin49@gmail.com>
-Date: Thu, 5 Jun 2014 00:06:08 +0200
-Subject: [PATCH] interface/vmcs_host: add install rules for libvcilcs
-
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
----
- interface/vmcs_host/CMakeLists.txt | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/interface/vmcs_host/CMakeLists.txt b/interface/vmcs_host/CMakeLists.txt
-index 64ba2f8..8510f81 100755
---- a/interface/vmcs_host/CMakeLists.txt
-+++ b/interface/vmcs_host/CMakeLists.txt
-@@ -33,4 +33,5 @@ target_link_libraries(vchostif vchiq_arm vcos vcfiled_check)
- 
- add_subdirectory(linux/vcfiled)
- install(TARGETS vchostif DESTINATION lib)
-+install(TARGETS vcilcs DESTINATION lib)
- 
--- 
-2.0.0
-
diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
index 717eab1..20f68fa 100644
--- a/package/rpi-userland/rpi-userland.mk
+++ b/package/rpi-userland/rpi-userland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_USERLAND_VERSION = b555474b19310762255252d085e57599ea573889
+RPI_USERLAND_VERSION = f9e6f9f3def8dc18dc0092cd695ccf53b8ba3efe
 RPI_USERLAND_SITE = $(call github,raspberrypi,userland,$(RPI_USERLAND_VERSION))
 RPI_USERLAND_LICENSE = BSD-3c
 RPI_USERLAND_LICENSE_FILES = LICENCE
-- 
1.9.1
