From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 25 Mar 2018 21:20:59 +0300
Subject: [Buildroot] [PATCH] strace: bump to version 4.21
Message-ID: <09291b181183799749bd7af44bf67a16408a4db1.1522002059.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Download site moved to strace.io. No upstream provided hashes.

Drop the musl specific autoconf seed values. These values are now
detected correctly.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/strace/strace.hash |  7 ++-----
 package/strace/strace.mk   | 12 ++----------
 2 files changed, 4 insertions(+), 15 deletions(-)

diff --git a/package/strace/strace.hash b/package/strace/strace.hash
index 404be3978848..21da83058e9f 100644
--- a/package/strace/strace.hash
+++ b/package/strace/strace.hash
@@ -1,7 +1,4 @@
-# From https://sourceforge.net/projects/strace/files/strace/4.20/
-md5	f2271ab0fac49ebee9cbd7f3469227cb	strace-4.20.tar.xz
-sha1	9cebc754af3434e4027a07745770892f685c0316	strace-4.20.tar.xz
 # Locally calculated after checking signature
-# https://sourceforge.net/projects/strace/files/strace/4.20/strace-4.20.tar.xz.asc
-sha256	5bf3148dd17306a42566f7da17368fdd781afa147db05ea63a4ca2b50f58c523	strace-4.20.tar.xz
+# https://strace.io/files/4.21/strace-4.21.tar.xz.asc
+sha256	5c7688db44073e94c59a5627744e5699454419824cc8166e8bcfd7ec58375c37	strace-4.21.tar.xz
 sha256	ea7ff222f36c9df0aa2924a8f7c7d2aec3ea11e752feba4b15ec79b695b6236a	COPYING
diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index ba57774e5d4a..77434e11bd6b 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -4,20 +4,12 @@
 #
 ################################################################################
 
-STRACE_VERSION = 4.20
+STRACE_VERSION = 4.21
 STRACE_SOURCE = strace-$(STRACE_VERSION).tar.xz
-STRACE_SITE = http://downloads.sourceforge.net/project/strace/strace/$(STRACE_VERSION)
+STRACE_SITE = https://strace.io/files/$(STRACE_VERSION)
 STRACE_LICENSE = BSD-3-Clause
 STRACE_LICENSE_FILES = COPYING
 
-# strace bundle some kernel headers to build libmpers, this mixes userspace
-# headers and kernel headers which break the build with musl.
-# The stddef.h from gcc is used instead of the one from musl.
-ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
-STRACE_CONF_OPTS += st_cv_m32_mpers=no \
-	st_cv_mx32_mpers=no
-endif
-
 define STRACE_REMOVE_STRACE_GRAPH
 	rm -f $(TARGET_DIR)/usr/bin/strace-graph
 endef
-- 
2.16.2
