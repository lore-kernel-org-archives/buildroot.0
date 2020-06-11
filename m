From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 11 Jun 2020 15:13:45 +0300
Subject: [Buildroot] [PATCH] package/empty: bump to version 0.6.21b
Message-ID: <5400c0f018d40f4760a4a1276f5c713b5e0f5b62.1591877625.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tarball is now without a leading directory component. Don't strip
leading patch component.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/empty/empty.hash | 2 +-
 package/empty/empty.mk   | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/empty/empty.hash b/package/empty/empty.hash
index 47e9577070cd..c5fbc2b4ac7f 100644
--- a/package/empty/empty.hash
+++ b/package/empty/empty.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  7e6636e400856984c4405ce7bd0843aaa3329fa3efd20c58df8400a9eaa35f09  empty-0.6.20b.tgz
+sha256  2fccd0faa1b3deaec1add679cbde3f34250e45872ad5df463badd4bb4edeb797  empty-0.6.21b.tgz
 sha256  f01dbe3c624084900b9df1393d9062518b2bc0487acd6a3300ebd6e71352d112  COPYRIGHT
diff --git a/package/empty/empty.mk b/package/empty/empty.mk
index 5e3ed42befd4..a9b8080a8ee7 100644
--- a/package/empty/empty.mk
+++ b/package/empty/empty.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-EMPTY_VERSION = 0.6.20b
+EMPTY_VERSION = 0.6.21b
 EMPTY_SOURCE = empty-$(EMPTY_VERSION).tgz
 EMPTY_SITE = http://downloads.sourceforge.net/project/empty/empty/empty-$(EMPTY_VERSION)
 EMPTY_LICENSE = BSD-3-Clause
 EMPTY_LICENSE_FILES = COPYRIGHT
+EMPTY_STRIP_COMPONENTS = 0
 
 define EMPTY_BUILD_CMDS
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
-- 
2.26.2
