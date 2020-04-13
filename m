From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 13 Apr 2020 22:34:50 +0200
Subject: [Buildroot] [git commit] package/sg3_utils: bump version to 1.45
Message-ID: <20200413202046.AEDA68EB51@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ccf621853ad4cce64f25c8e2ced92e5f55b9adbf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog: http://sg.danny.cz/sg/p/ChangeLog

Removed patch applied upstream:
https://github.com/hreinecke/sg3_utils/commit/180a604b564ca4b3cb972f6d29e1492aa6698896#diff-480477e89f9b6ddafb30c4383dcdd705

Updated BSD license hash due to switch to 2-clause license:
https://github.com/hreinecke/sg3_utils/commit/cb84e1efb96c52dcaae41e9b62b8628bca3c87a4

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[yann.morin.1998 at free.fr: two spaces in hash file]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...akefile.am-add-missing-RT_LIB-for-sg_turs.patch | 29 ----------------------
 package/sg3_utils/sg3_utils.hash                   |  6 ++---
 package/sg3_utils/sg3_utils.mk                     |  6 ++---
 3 files changed, 6 insertions(+), 35 deletions(-)

diff --git a/package/sg3_utils/0002-src-Makefile.am-add-missing-RT_LIB-for-sg_turs.patch b/package/sg3_utils/0002-src-Makefile.am-add-missing-RT_LIB-for-sg_turs.patch
deleted file mode 100644
index 34a4e114ec..0000000000
--- a/package/sg3_utils/0002-src-Makefile.am-add-missing-RT_LIB-for-sg_turs.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 68b0591cf37760e09e358533bbcecf36eddfceed Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Sun, 10 Feb 2019 14:46:41 +0100
-Subject: [PATCH] src/Makefile.am: add missing @RT_LIB@ for sg_turs
-
-The sg_turs program uses clock_gettime(), so it should link against
-librt, as provided by @RT_LIB at .
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- src/Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/Makefile.am b/src/Makefile.am
-index 881cf29..0eba680 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -170,7 +170,7 @@ sg_test_rwbuf_LDADD = ../lib/libsgutils2.la
- 
- sg_timestamp_LDADD = ../lib/libsgutils2.la
- 
--sg_turs_LDADD = ../lib/libsgutils2.la
-+sg_turs_LDADD = ../lib/libsgutils2.la @RT_LIB@
- 
- sg_unmap_LDADD = ../lib/libsgutils2.la
- 
--- 
-2.20.1
-
diff --git a/package/sg3_utils/sg3_utils.hash b/package/sg3_utils/sg3_utils.hash
index 14b94947d4..d6c7f03abb 100644
--- a/package/sg3_utils/sg3_utils.hash
+++ b/package/sg3_utils/sg3_utils.hash
@@ -1,6 +1,6 @@
 # Locally calculated from download (no sig, hash)
-sha256	ca94ac106510742cd8ff5ead4a7e5c89d410653291401daf4632d2bef2a35b05	sg3_utils-1.44.tar.xz
+sha256  c7dab547dc37381fa50e482d9da680fe64b88cfe0e3d79b61e478de14f58b2ee  sg3_utils-1.45.tar.xz
 
 # Hash for license files
-sha256	d516b8b337a77e3d4c65dffe708ca7fb25b1cb4ec77ec362cf11ed659b9250bc	COPYING
-sha256	31f6d59679e0fb21c9358f22484e6e3c53e20ef08c0950fd38a4a867cb55edc9	BSD_LICENSE
+sha256  d516b8b337a77e3d4c65dffe708ca7fb25b1cb4ec77ec362cf11ed659b9250bc  COPYING
+sha256  8ddd1d82f2be2f5cbd5b5c3b5c2ee94a90d2ca7112958448da74dd78384fd96a  BSD_LICENSE
diff --git a/package/sg3_utils/sg3_utils.mk b/package/sg3_utils/sg3_utils.mk
index 7070d6f83d..4685169e39 100644
--- a/package/sg3_utils/sg3_utils.mk
+++ b/package/sg3_utils/sg3_utils.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-SG3_UTILS_VERSION = 1.44
+SG3_UTILS_VERSION = 1.45
 SG3_UTILS_SOURCE = sg3_utils-$(SG3_UTILS_VERSION).tar.xz
 SG3_UTILS_SITE = http://sg.danny.cz/sg/p
-SG3_UTILS_LICENSE = BSD-3-Clause (library)
+SG3_UTILS_LICENSE = BSD-2-Clause (library)
 # Some utils progs are GPL-2.0+ licensed while others are BSD-3-Clause
 ifeq ($(BR2_PACKAGE_SG3_UTILS_PROGS),y)
-SG3_UTILS_LICENSE += , GPL-2.0+ (programs), BSD-3-Clause (programs)
+SG3_UTILS_LICENSE += , GPL-2.0+ (programs), BSD-2-Clause (programs)
 endif
 SG3_UTILS_LICENSE_FILES = COPYING BSD_LICENSE
 
