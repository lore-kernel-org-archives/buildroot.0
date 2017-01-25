From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Jan 2017 23:25:26 +1300
Subject: [Buildroot] [git commit] libsepol: bump version to 2.6
Message-ID: <20170125102553.CC3378057D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a26fc91cec57f34d4c6419f7e8281ae246fd80dd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also removed patch 0003-add-stdarg-include.patch as this has been
committed to upstream.

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libsepol/0003-add-stdarg-include.patch         | 18 ------------------
 ...ln-relative.patch => 0003-revert-ln-relative.patch} |  0
 package/libsepol/libsepol.hash                         |  2 +-
 package/libsepol/libsepol.mk                           |  4 ++--
 4 files changed, 3 insertions(+), 21 deletions(-)

diff --git a/package/libsepol/0003-add-stdarg-include.patch b/package/libsepol/0003-add-stdarg-include.patch
deleted file mode 100644
index 246c965..0000000
--- a/package/libsepol/0003-add-stdarg-include.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-Add missing <stdarg.h> include
-
-This is needed to fix the build on uClibc, due to the usage of
-va_list.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Index: b/cil/src/cil_log.h
-===================================================================
---- a/cil/src/cil_log.h
-+++ b/cil/src/cil_log.h
-@@ -30,6 +30,7 @@
- #define CIL_LOG_H_
- 
- #include <stdlib.h>
-+#include <stdarg.h>
- #include <cil/cil.h>
- 
- #define MAX_LOG_SIZE 512
diff --git a/package/libsepol/0004-revert-ln-relative.patch b/package/libsepol/0003-revert-ln-relative.patch
similarity index 100%
rename from package/libsepol/0004-revert-ln-relative.patch
rename to package/libsepol/0003-revert-ln-relative.patch
diff --git a/package/libsepol/libsepol.hash b/package/libsepol/libsepol.hash
index 266ce43..6c70506 100644
--- a/package/libsepol/libsepol.hash
+++ b/package/libsepol/libsepol.hash
@@ -1,2 +1,2 @@
 # From https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256 2bdeec56d0a08b082b93b40703b4b3329cc5562152f7254d8f6ef6b56afe850a  libsepol-2.5.tar.gz
+sha256 d856d6506054f52abeaa3543ea2f2344595a3dc05d0d873ed7f724f7a16b1874  libsepol-2.6.tar.gz
diff --git a/package/libsepol/libsepol.mk b/package/libsepol/libsepol.mk
index bf85eef..61d1e61 100644
--- a/package/libsepol/libsepol.mk
+++ b/package/libsepol/libsepol.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBSEPOL_VERSION = 2.5
-LIBSEPOL_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20160223
+LIBSEPOL_VERSION = 2.6
+LIBSEPOL_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20161014
 LIBSEPOL_LICENSE = LGPLv2.1+
 LIBSEPOL_LICENSE_FILES = COPYING
 
