From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 16 Sep 2016 18:45:34 +0200
Subject: [Buildroot] [git commit] libcap-ng: bump version to 0.7.8
Message-ID: <20160916164630.ACB1E81D5C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e0b38197e04f3404b94b270f852920b63a7b96e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop upstream patch

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libcap-ng/0001-add-missing-include.patch | 22 ----------------------
 package/libcap-ng/libcap-ng.hash                 |  2 +-
 package/libcap-ng/libcap-ng.mk                   |  2 +-
 3 files changed, 2 insertions(+), 24 deletions(-)

diff --git a/package/libcap-ng/0001-add-missing-include.patch b/package/libcap-ng/0001-add-missing-include.patch
deleted file mode 100644
index c30c40d..0000000
--- a/package/libcap-ng/0001-add-missing-include.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-Add missing include <sys/types.h>
-
-This include is needed to get the pid_t definition, at least with the
-musl C library.
-
-Patch inspired from Alpine Linux patch
-http://git.alpinelinux.org/cgit/aports/tree/main/libcap-ng/fix-includes.patch.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/utils/proc-llist.h
-===================================================================
---- a/utils/proc-llist.h
-+++ b/utils/proc-llist.h
-@@ -26,6 +26,7 @@
- 
- #include "config.h"
- 
-+#include <sys/types.h>
- 
- /* This is the node of the linked list. Any data elements that are per
-  *  record goes here. */
diff --git a/package/libcap-ng/libcap-ng.hash b/package/libcap-ng/libcap-ng.hash
index ecea6e8..b433b75 100644
--- a/package/libcap-ng/libcap-ng.hash
+++ b/package/libcap-ng/libcap-ng.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	615549ce39b333f6b78baee0c0b4ef18bc726c6bf1cca123dfd89dd963f6d06b  libcap-ng-0.7.7.tar.gz
+sha256 c21af997445cd4107a55d386f955c5ea6f6e96ead693e9151277c0ab5f97d05f libcap-ng-0.7.8.tar.gz
diff --git a/package/libcap-ng/libcap-ng.mk b/package/libcap-ng/libcap-ng.mk
index d78f5dc..34e0f2c 100644
--- a/package/libcap-ng/libcap-ng.mk
+++ b/package/libcap-ng/libcap-ng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCAP_NG_VERSION = 0.7.7
+LIBCAP_NG_VERSION = 0.7.8
 LIBCAP_NG_SITE = http://people.redhat.com/sgrubb/libcap-ng
 LIBCAP_NG_LICENSE = GPLv2+ LGPLv2.1+
 LIBCAP_NG_LICENSE_FILES = COPYING COPYING.LIB
