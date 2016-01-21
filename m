From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 Jan 2016 15:25:55 +0100
Subject: [Buildroot] [git commit] libv4l: update upstream status of patches
Message-ID: <20160121142637.623BE7FCB1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=09816566f4a451b3eb00584278c710df5dc7e1e1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

After some effort to upstream the libv4l patches, 4 out of our 5
patches are now upstream. This commit updates those patches to
indicate their upstream status.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libv4l/0002-dvb-keytable-fix-missing-libintl-linking.patch     | 3 +++
 .../0003-libv4lsyscall-priv.h-Use-off_t-instead-of-__off_t.patch       | 3 +++
 .../0004-utils-Properly-use-ENABLE_NLS-for-locale-related-cod.patch    | 3 +++
 .../0005-libv4lconvert-only-expose-jpeg_mem_-protoypes-when-J.patch    | 3 +++
 4 files changed, 12 insertions(+)

diff --git a/package/libv4l/0002-dvb-keytable-fix-missing-libintl-linking.patch b/package/libv4l/0002-dvb-keytable-fix-missing-libintl-linking.patch
index 5fb93ff..1b89961 100644
--- a/package/libv4l/0002-dvb-keytable-fix-missing-libintl-linking.patch
+++ b/package/libv4l/0002-dvb-keytable-fix-missing-libintl-linking.patch
@@ -3,6 +3,9 @@ From: Peter Seiderer <ps.report@gmx.net>
 Date: Fri, 16 Oct 2015 20:32:45 +0200
 Subject: [PATCH] dvb/keytable: fix missing libintl linking
 
+Patch upstream at
+http://git.linuxtv.org/v4l-utils.git/commit/?id=ceaec539b62d83ffb5fdb5231e574a6adef0bf83.
+
 Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 ---
  utils/dvb/Makefile.am      | 8 ++++----
diff --git a/package/libv4l/0003-libv4lsyscall-priv.h-Use-off_t-instead-of-__off_t.patch b/package/libv4l/0003-libv4lsyscall-priv.h-Use-off_t-instead-of-__off_t.patch
index 015acd4..7868d71 100644
--- a/package/libv4l/0003-libv4lsyscall-priv.h-Use-off_t-instead-of-__off_t.patch
+++ b/package/libv4l/0003-libv4lsyscall-priv.h-Use-off_t-instead-of-__off_t.patch
@@ -11,6 +11,9 @@ but the mmap() manpage really uses off_t, not __off_t.
 Switching from __off_t to off_t allows the code to build properly with
 musl.
 
+Patch upstream at
+http://git.linuxtv.org/v4l-utils.git/commit/?id=a6ff0635f7ed3400eec25039b96002b60a44209b.
+
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 ---
  lib/libv4l1/v4l1compat.c               |  3 +--
diff --git a/package/libv4l/0004-utils-Properly-use-ENABLE_NLS-for-locale-related-cod.patch b/package/libv4l/0004-utils-Properly-use-ENABLE_NLS-for-locale-related-cod.patch
index 8325234..2be74cc 100644
--- a/package/libv4l/0004-utils-Properly-use-ENABLE_NLS-for-locale-related-cod.patch
+++ b/package/libv4l/0004-utils-Properly-use-ENABLE_NLS-for-locale-related-cod.patch
@@ -13,6 +13,9 @@ not available due to <locale.h> not being included.
 In order to fix this, we add ENABLE_NLS conditionals around the calls
 to these functions.
 
+Patch upstream at:
+http://git.linuxtv.org/v4l-utils.git/commit/?id=defad307a09c11ba989e6338bb0293c0e1acba87.
+
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 ---
  utils/dvb/dvb-fe-tool.c        | 2 ++
diff --git a/package/libv4l/0005-libv4lconvert-only-expose-jpeg_mem_-protoypes-when-J.patch b/package/libv4l/0005-libv4lconvert-only-expose-jpeg_mem_-protoypes-when-J.patch
index d0d3624..1868fd3 100644
--- a/package/libv4l/0005-libv4lconvert-only-expose-jpeg_mem_-protoypes-when-J.patch
+++ b/package/libv4l/0005-libv4lconvert-only-expose-jpeg_mem_-protoypes-when-J.patch
@@ -25,6 +25,9 @@ only expose the prototypes when libv4l is implementing the functions
 (i.e when JPEG_LIB_VERSION < 80). When JPEG_LIB_VERSION >= 80, the
 prototypes will come from <jpeglib.h>.
 
+Patch upstream at:
+http://git.linuxtv.org/v4l-utils.git/commit/?id=0b33f4c87cb26644ea662455acbc1649858b151f.
+
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 ---
  lib/libv4lconvert/jpeg_memsrcdest.h | 4 ++++
