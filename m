From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 11 Sep 2019 19:06:33 +0200
Subject: [Buildroot] [PATCH 1/1] package/zziplib: fixup the 'v' prefix in
 the version
Message-ID: <20190911170633.27679-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order for the zziplib version to match what is given by
release-monitoring.org, the 'v' prefix should be encoded in
ZZIPLIB_SITE and not ZZIPLIB_VERSION.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/zziplib/zziplib.hash | 2 +-
 package/zziplib/zziplib.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/zziplib/zziplib.hash b/package/zziplib/zziplib.hash
index 1f6b55ec18..88f618b7bf 100644
--- a/package/zziplib/zziplib.hash
+++ b/package/zziplib/zziplib.hash
@@ -1,5 +1,5 @@
 # sha256 locally computed
-sha256 846246d7cdeee405d8d21e2922c6e97f55f24ecbe3b6dcf5778073a88f120544  zziplib-v0.13.69.tar.gz
+sha256 846246d7cdeee405d8d21e2922c6e97f55f24ecbe3b6dcf5778073a88f120544  zziplib-0.13.69.tar.gz
 sha256 94b03f1a60a7fd5007149530626a895a6ef5a8b9342abfd56860c5f3956f5d23  docs/COPYING.LIB
 sha256 c2aa7d58cebd24cb877bbf11d6b13a4bb7cd08b9d7db5d3037ca06c46bf4cfd8  docs/COPYING.MPL
 sha256 1c6da11efe8c43ee853fe5b21501dd72b81831ae84d58ea376bddc0620a5c361  docs/copying.htm
diff --git a/package/zziplib/zziplib.mk b/package/zziplib/zziplib.mk
index 04129fdd97..90bbaf1a17 100644
--- a/package/zziplib/zziplib.mk
+++ b/package/zziplib/zziplib.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-ZZIPLIB_VERSION = v0.13.69
-ZZIPLIB_SITE = $(call github,gdraheim,zziplib,$(ZZIPLIB_VERSION))
+ZZIPLIB_VERSION = 0.13.69
+ZZIPLIB_SITE = $(call github,gdraheim,zziplib,v$(ZZIPLIB_VERSION))
 ZZIPLIB_LICENSE = LGPL-2.0+ or MPL-1.1
 ZZIPLIB_LICENSE_FILES = docs/COPYING.LIB docs/COPYING.MPL docs/copying.htm
 ZZIPLIB_INSTALL_STAGING = YES
-- 
2.23.0.rc1
