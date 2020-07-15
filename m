From: Antoine Tenart <antoine.tenart@bootlin.com>
Date: Wed, 15 Jul 2020 15:07:36 +0200
Subject: [Buildroot] [PATCH 5/9] package/checkpolicy: bump to 20200710
In-Reply-To: <20200715130740.775804-1-antoine.tenart@bootlin.com>
References: <20200715130740.775804-1-antoine.tenart@bootlin.com>
Message-ID: <20200715130740.775804-6-antoine.tenart@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Patch 0001-checkpolicy-remove-unused-te_assertions.patch is now part of
the upstream release 20200710.

Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
---
 ...ckpolicy-remove-unused-te_assertions.patch | 45 -------------------
 package/checkpolicy/checkpolicy.hash          |  2 +-
 package/checkpolicy/checkpolicy.mk            |  4 +-
 3 files changed, 3 insertions(+), 48 deletions(-)
 delete mode 100644 package/checkpolicy/0001-checkpolicy-remove-unused-te_assertions.patch

diff --git a/package/checkpolicy/0001-checkpolicy-remove-unused-te_assertions.patch b/package/checkpolicy/0001-checkpolicy-remove-unused-te_assertions.patch
deleted file mode 100644
index 0c4ffcbf8749..000000000000
--- a/package/checkpolicy/0001-checkpolicy-remove-unused-te_assertions.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 4d330d0d3155211f119b3082f728ae42dcc01e96 Mon Sep 17 00:00:00 2001
-From: Ondrej Mosnacek <omosnace@redhat.com>
-Date: Thu, 23 Jan 2020 13:57:15 +0100
-Subject: [PATCH] checkpolicy: remove unused te_assertions
-
-This variable is declared in a header file, but never defined or used.
-The te_assert structure definition is only used in this declaration, so
-remove both.
-
-Upstream: https://github.com/SELinuxProject/selinux/commit/4d330d0d3155211f119b3082f728ae42dcc01e96#diff-daf264ea505347df0d59a3a97a07742e
-
-Signed-off-by: Ondrej Mosnacek <omosnace@redhat.com>
-Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
----
- checkpolicy.h | 14 --------------
- 1 file changed, 14 deletions(-)
-
-diff --git a/checkpolicy.h b/checkpolicy.h
-index 3868f1fa..f127687e 100644
---- a/checkpolicy.h
-+++ b/checkpolicy.h
-@@ -1,20 +1,6 @@
- #ifndef _CHECKPOLICY_H_
- #define _CHECKPOLICY_H_
- 
--#include <sepol/policydb/ebitmap.h>
--
--typedef struct te_assert {
--	ebitmap_t stypes;
--	ebitmap_t ttypes;
--	ebitmap_t tclasses;
--	int self;
--	sepol_access_vector_t *avp;
--	unsigned long line;
--	struct te_assert *next;
--} te_assert_t;
--
--te_assert_t *te_assertions;
--
- extern unsigned int policyvers;
- 
- #endif
--- 
-2.17.1
-
diff --git a/package/checkpolicy/checkpolicy.hash b/package/checkpolicy/checkpolicy.hash
index 264e21b8f3a3..55f4f09f76a1 100644
--- a/package/checkpolicy/checkpolicy.hash
+++ b/package/checkpolicy/checkpolicy.hash
@@ -1,5 +1,5 @@
 # https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256 c88c719a141dd5c1202d49c378c7f063349d630522d5e04dc6e0c53da81aa4f8  checkpolicy-3.0.tar.gz
+sha256 dfc7707070520c93b14fbbdfdbe081364d806bf28e3e79e10318c2594c77bbb2  checkpolicy-3.1.tar.gz
 
 # Hash for license file
 sha256 204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  COPYING
diff --git a/package/checkpolicy/checkpolicy.mk b/package/checkpolicy/checkpolicy.mk
index 3b055df4897a..86eaffccb1ac 100644
--- a/package/checkpolicy/checkpolicy.mk
+++ b/package/checkpolicy/checkpolicy.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-CHECKPOLICY_VERSION = 3.0
-CHECKPOLICY_SITE = https://github.com/SELinuxProject/selinux/releases/download/20191204
+CHECKPOLICY_VERSION = 3.1
+CHECKPOLICY_SITE = https://github.com/SELinuxProject/selinux/releases/download/20200710
 CHECKPOLICY_LICENSE = GPL-2.0
 CHECKPOLICY_LICENSE_FILES = COPYING
 
-- 
2.26.2
