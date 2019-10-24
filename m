From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 24 Oct 2019 20:11:55 +0200
Subject: [Buildroot] [PATCH 1/1] package/libyang: fix up the 'v' prefix in
 the version
Message-ID: <20191024181155.14819-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order for the libyang version to match what is given by
release-monitoring.org, the 'v' prefix should be encoded in
LIBYANG_SITE and not LIBYANG_VERSION.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libyang/libyang.hash | 2 +-
 package/libyang/libyang.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libyang/libyang.hash b/package/libyang/libyang.hash
index 4989873c8c..e48ea20fa3 100644
--- a/package/libyang/libyang.hash
+++ b/package/libyang/libyang.hash
@@ -1,2 +1,2 @@
-sha256 351f712433d50494aad153bfd4aa92ff50299058428620eabddb7a41d781e756  libyang-v1.0-r3.tar.gz
+sha256 351f712433d50494aad153bfd4aa92ff50299058428620eabddb7a41d781e756  libyang-1.0-r3.tar.gz
 sha256 f942fe693e03e4e3ff67a351c00dc8f468a042e0d7273b0aa6bc53060b568112  LICENSE
diff --git a/package/libyang/libyang.mk b/package/libyang/libyang.mk
index a120f51293..a4333540da 100644
--- a/package/libyang/libyang.mk
+++ b/package/libyang/libyang.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBYANG_VERSION = v1.0-r3
-LIBYANG_SITE = $(call github,CESNET,libyang,$(LIBYANG_VERSION))
+LIBYANG_VERSION = 1.0-r3
+LIBYANG_SITE = $(call github,CESNET,libyang,v$(LIBYANG_VERSION))
 LIBYANG_LICENSE = BSD-3-Clause
 LIBYANG_LICENSE_FILES = LICENSE
 LIBYANG_INSTALL_STAGING = YES
-- 
2.23.0
