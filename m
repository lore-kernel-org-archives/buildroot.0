From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 7 Oct 2011 13:15:06 +0200
Subject: [Buildroot] [git commit] directfb: bump to version 1.4.15
Message-ID: <20111007113306.DD4C58E289@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3b661b77212f08117b21c9fa3101fe101f864ea3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove patch that has been included upstream.

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../directfb/directfb-1.4.13-ppc-compile-fix.patch |   17 -----------------
 package/directfb/directfb.mk                       |    2 +-
 2 files changed, 1 insertions(+), 18 deletions(-)

diff --git a/package/directfb/directfb-1.4.13-ppc-compile-fix.patch b/package/directfb/directfb-1.4.13-ppc-compile-fix.patch
deleted file mode 100644
index 2514eae..0000000
--- a/package/directfb/directfb-1.4.13-ppc-compile-fix.patch
+++ /dev/null
@@ -1,17 +0,0 @@
----
- lib/direct/ppcasm_memcpy_cachable.S |    2 --
- 1 file changed, 2 deletions(-)
-
-Index: DirectFB-1.2.7/lib/direct/ppcasm_memcpy_cachable.S
-===================================================================
---- DirectFB-1.2.7.orig/lib/direct/ppcasm_memcpy_cachable.S
-+++ DirectFB-1.2.7/lib/direct/ppcasm_memcpy_cachable.S
-@@ -34,8 +34,6 @@
- 
- #define __ASSEMBLY__
- 
--#include <linux/config.h>
--
- #if defined(CONFIG_8xx) || defined(CONFIG_403GCX)
- #define L1_CACHE_LINE_SIZE       16
- #define LG_L1_CACHE_LINE_SIZE     4 
diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
index af64542..977d272 100644
--- a/package/directfb/directfb.mk
+++ b/package/directfb/directfb.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 DIRECTFB_VERSION_MAJOR = 1.4
-DIRECTFB_VERSION = $(DIRECTFB_VERSION_MAJOR).13
+DIRECTFB_VERSION = $(DIRECTFB_VERSION_MAJOR).15
 DIRECTFB_SITE = http://www.directfb.org/downloads/Core/DirectFB-$(DIRECTFB_VERSION_MAJOR)
 DIRECTFB_SOURCE = DirectFB-$(DIRECTFB_VERSION).tar.gz
 DIRECTFB_AUTORECONF = YES
