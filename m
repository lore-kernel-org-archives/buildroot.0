From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Dec 2014 23:21:30 +0100
Subject: [Buildroot] [git commit] package/openpowerlink: bump to version
	1.8.5
Message-ID: <20141210224108.26D42801D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=316d2ba0846a684a5c3d78cf35c5ce71863eddcf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove upstream commit

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...-Fix-Linux-Powerlink-user-lib-add-INSTALL.patch |   28 --------------------
 package/openpowerlink/openpowerlink.mk             |    2 +-
 2 files changed, 1 insertions(+), 29 deletions(-)

diff --git a/package/openpowerlink/openpowerlink-0001-Fix-Linux-Powerlink-user-lib-add-INSTALL.patch b/package/openpowerlink/openpowerlink-0001-Fix-Linux-Powerlink-user-lib-add-INSTALL.patch
deleted file mode 100644
index bed878e..0000000
--- a/package/openpowerlink/openpowerlink-0001-Fix-Linux-Powerlink-user-lib-add-INSTALL.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From cb6c4ff053e72f7fe5954894aebe2c0d94120b2d Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@openwide.fr>
-Date: Thu, 3 Oct 2013 23:22:17 +0200
-Subject: [PATCH 5/5] [FIX] Linux Powerlink user lib: add INSTALL
-
-Signed-off-by: Romain Naour <romain.naour@openwide.fr>
----
- Examples/X86/Generic/powerlink_user_lib/CMakeLists.txt | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/Examples/X86/Generic/powerlink_user_lib/CMakeLists.txt b/Examples/X86/Generic/powerlink_user_lib/CMakeLists.txt
-index e67d573..40b7756 100644
---- a/Examples/X86/Generic/powerlink_user_lib/CMakeLists.txt
-+++ b/Examples/X86/Generic/powerlink_user_lib/CMakeLists.txt
-@@ -329,7 +329,9 @@ ENDIF ()
- #
- # Installation
- #
--IF (WIN32)
-+IF (UNIX)
-+    INSTALL(TARGETS powerlink ARCHIVE DESTINATION lib)
-+ELSEIF (WIN32)
-     IF (CFG_X86_WINDOWS_DLL)
-         INSTALL(TARGETS openPOWERLINK RUNTIME DESTINATION bin)
-     ENDIF (CFG_X86_WINDOWS_DLL)
---
-1.8.4
-
diff --git a/package/openpowerlink/openpowerlink.mk b/package/openpowerlink/openpowerlink.mk
index 7ad3eca..dcaf386 100644
--- a/package/openpowerlink/openpowerlink.mk
+++ b/package/openpowerlink/openpowerlink.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENPOWERLINK_VERSION = V1.08.4
+OPENPOWERLINK_VERSION = V1.08.5
 OPENPOWERLINK_SITE = http://git.code.sf.net/p/openpowerlink/code
 OPENPOWERLINK_SITE_METHOD = git
 OPENPOWERLINK_LICENSE = BSD-2c, GPLv2
