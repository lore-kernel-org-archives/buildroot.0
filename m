From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 22 Nov 2014 01:01:32 +0100
Subject: [Buildroot] [PATCH 2/2] package/openpowerlink: bump to version 1.8.5
In-Reply-To: <1416614492-25656-1-git-send-email-romain.naour@openwide.fr>
References: <1416614492-25656-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1416614492-25656-2-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove upstream commit

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 ...-Fix-Linux-Powerlink-user-lib-add-INSTALL.patch | 28 ----------------------
 package/openpowerlink/openpowerlink.mk             |  2 +-
 2 files changed, 1 insertion(+), 29 deletions(-)
 delete mode 100644 package/openpowerlink/openpowerlink-0001-Fix-Linux-Powerlink-user-lib-add-INSTALL.patch

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
index e3d258d..a803977 100644
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
-- 
1.9.3
