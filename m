From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 9 Jun 2019 23:27:59 +0200
Subject: [Buildroot] [git commit] package/iputils: fix license
Message-ID: <20190609213032.B76C780FF0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=07d213be0cbe3a516ab537822e8a75c52edac6b6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Replace nfinfod/COPYING by LICENSE, Documentation/LICENSE.BSD3 and
  Documentation/LICENSE.GPL2 which are available since version s20180629
  and
  https://github.com/iputils/iputils/commit/686ee13130550aa4cb2937842504b2131f0934c6
- BSD-4-Clause has been removed since version s20180629 and
  https://github.com/iputils/iputils/commit/f69eeac80de413248fd3d7d4d4244af22a81e055

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/iputils/iputils.hash | 4 +++-
 package/iputils/iputils.mk   | 5 ++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/iputils/iputils.hash b/package/iputils/iputils.hash
index 57b9ccf6a4..613414ce5c 100644
--- a/package/iputils/iputils.hash
+++ b/package/iputils/iputils.hash
@@ -1,3 +1,5 @@
 # Locally computed
 sha256 9b5125eb5ef9f4e947ad8fdddcf77f538f53b8f47b53eb5bc5347cb16d01c8fd  iputils-s20190515.tar.gz
-sha256 966075293e45785230c19415bcda15bd07c75bead4fe73332d1a4b9c45bb321f  ninfod/COPYING
+sha256 b8ea785d12fa6a44916601104dd746216957e93f13a26d3eb858b3b5a4ad66ab  LICENSE
+sha256 9acc4bc871a4742550158e3696dcb381953172ef808d04ca248184f9f6322712  Documentation/LICENSE.BSD3
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  Documentation/LICENSE.GPL2
diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
index 6eae32d594..d9a51ece2a 100644
--- a/package/iputils/iputils.mk
+++ b/package/iputils/iputils.mk
@@ -13,9 +13,8 @@
 
 IPUTILS_VERSION = s20190515
 IPUTILS_SITE = $(call github,iputils,iputils,$(IPUTILS_VERSION))
-IPUTILS_LICENSE = GPL-2.0+, BSD-3-Clause, BSD-4-Clause
-# Only includes a license file for BSD
-IPUTILS_LICENSE_FILES = ninfod/COPYING
+IPUTILS_LICENSE = GPL-2.0+, BSD-3-Clause
+IPUTILS_LICENSE_FILES = LICENSE Documentation/LICENSE.BSD3 Documentation/LICENSE.GPL2
 IPUTILS_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 
 ifeq ($(BR2_PACKAGE_LIBCAP),y)
