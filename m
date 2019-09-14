From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 14 Sep 2019 11:32:26 +0200
Subject: [Buildroot] [PATCH 1/2] package/chrony: bump to version 3.5
Message-ID: <20190914093227.4893-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove second patch (already in version)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...02-hash-include-util.h-for-MIN-macro.patch | 28 -------------------
 package/chrony/chrony.hash                    |  6 ++--
 package/chrony/chrony.mk                      |  2 +-
 3 files changed, 4 insertions(+), 32 deletions(-)
 delete mode 100644 package/chrony/0002-hash-include-util.h-for-MIN-macro.patch

diff --git a/package/chrony/0002-hash-include-util.h-for-MIN-macro.patch b/package/chrony/0002-hash-include-util.h-for-MIN-macro.patch
deleted file mode 100644
index 1fd5bd9984..0000000000
--- a/package/chrony/0002-hash-include-util.h-for-MIN-macro.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 948ecf84314f78da82e0e2b07b6570ca9cff86c8 Mon Sep 17 00:00:00 2001
-From: Miroslav Lichvar <mlichvar@redhat.com>
-Date: Thu, 20 Sep 2018 15:01:16 +0200
-Subject: [PATCH] hash: include util.h for MIN macro
-
-The hash_intmd5.c file inadvertently relied on the system headers to
-provide the MIN macro, but it is missing with some libc implementations.
-
-Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
----
- hash_intmd5.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/hash_intmd5.c b/hash_intmd5.c
-index 0b60f9b..49da1cf 100644
---- a/hash_intmd5.c
-+++ b/hash_intmd5.c
-@@ -29,6 +29,7 @@
- #include "sysincl.h"
- #include "hash.h"
- #include "memory.h"
-+#include "util.h"
- 
- #include "md5.c"
- 
--- 
-2.17.1
-
diff --git a/package/chrony/chrony.hash b/package/chrony/chrony.hash
index 925240cf6a..c31c6893aa 100644
--- a/package/chrony/chrony.hash
+++ b/package/chrony/chrony.hash
@@ -1,5 +1,5 @@
-# From https://listengine.tuxfamily.org/chrony.tuxfamily.org/chrony-announce/2018/09/msg00000.html
-md5 7170e750469c198fc6784047d6f71144  chrony-3.4.tar.gz
-sha1 fa41e595e7041a9deda76a69e970a023091474f6  chrony-3.4.tar.gz
+# From https://listengine.tuxfamily.org/chrony.tuxfamily.org/chrony-announce/2019/05/msg00001.html
+md5 5f66338bc940a9b51eede8f391e7bed3  chrony-3.5.tar.gz
+sha1 79e9aeace143550300387a99f17bff04b45673f7  chrony-3.5.tar.gz
 # Locally calculated
 sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/chrony/chrony.mk b/package/chrony/chrony.mk
index b5821b238d..4a740d5067 100644
--- a/package/chrony/chrony.mk
+++ b/package/chrony/chrony.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CHRONY_VERSION = 3.4
+CHRONY_VERSION = 3.5
 CHRONY_SITE = http://download.tuxfamily.org/chrony
 CHRONY_LICENSE = GPL-2.0
 CHRONY_LICENSE_FILES = COPYING
-- 
2.23.0.rc1
