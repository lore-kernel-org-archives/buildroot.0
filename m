From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 19 Nov 2010 10:45:03 +0100
Subject: [Buildroot] [git commit master 1/1] pciutils: compilation failed
	with zlib enabled because it lacks a dependency
Message-ID: <20101119094525.53B6E8D2F9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e5edc7338175f8cbbf2d90c5d6be7ccc39bd94e2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #2797

Signed-off-by: Stanislav Bogatyrev <realloc@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                      |    5 +++--
 package/pciutils/pciutils.mk |    1 +
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index 5bd7483..0d67202 100644
--- a/CHANGES
+++ b/CHANGES
@@ -3,13 +3,14 @@
 	Fixes all over the tree.
 
 	Updated/fixed packages: bash, bind, busybox, libglib2, libmad,
-	midori, module-init-tools, mtd-utils, openssh, qt, sqlite,
-	webkit
+	midori, module-init-tools, mtd-utils, openssh, pciutils, qt,
+	sqlite, webkit
 
 	Issues resolved (http://bugs.uclibc.org):
 
 	#2479: host-module-init-tools 3.11 fails to build
 	#2785: mtd-utils build fails due to missing libmtd
+	#2797: pciutils dependencies on zlib not taken into account
 	#2809: failed to compile libglib2
 	#2821: [PATCH] Patch for JavaScriptCore in QtWebKit module
 	#2827: qt-4.7.0-pthread_getattr_np.patch invalid for qt 4.6...
diff --git a/package/pciutils/pciutils.mk b/package/pciutils/pciutils.mk
index a7d9996..6e16300 100644
--- a/package/pciutils/pciutils.mk
+++ b/package/pciutils/pciutils.mk
@@ -8,6 +8,7 @@ PCIUTILS_VERSION = 3.1.7
 PCIUTILS_SITE = ftp://atrey.karlin.mff.cuni.cz/pub/linux/pci
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 	PCIUTILS_ZLIB=yes
+	PCIUTILS_DEPENDENCIES += zlib
 else
 	PCIUTILS_ZLIB=no
 endif
-- 
1.7.2.2
