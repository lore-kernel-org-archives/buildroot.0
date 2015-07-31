From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Fri, 31 Jul 2015 21:54:16 +0200
Subject: [Buildroot] [PATCH 1/1] package/upmpdcli: bump to version 0.11.2
Message-ID: <1438372456-5346-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also:
  * remove patch #1 -> merged upstream

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 .../0001-Add-conditional-check-for-__linux__.patch | 32 ----------------------
 package/upmpdcli/upmpdcli.hash                     |  4 +--
 package/upmpdcli/upmpdcli.mk                       |  2 +-
 3 files changed, 3 insertions(+), 35 deletions(-)
 delete mode 100644 package/upmpdcli/0001-Add-conditional-check-for-__linux__.patch

diff --git a/package/upmpdcli/0001-Add-conditional-check-for-__linux__.patch b/package/upmpdcli/0001-Add-conditional-check-for-__linux__.patch
deleted file mode 100644
index 910ee3c..0000000
--- a/package/upmpdcli/0001-Add-conditional-check-for-__linux__.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 69740cf6fe35413edc4b6adc502ba70ce8de8557 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
-Date: Sun, 19 Jul 2015 08:48:13 +0200
-Subject: [PATCH 1/1] Add conditional check for __linux__
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-When building upmpdcli with certain toolchains using the compiler flag
--std=c++0x let gcc not define "linux" or "__linux", but "__linux__".
-
-Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
----
- src/closefrom.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/closefrom.cpp b/src/closefrom.cpp
-index 4429b20..0cd7957 100644
---- a/src/closefrom.cpp
-+++ b/src/closefrom.cpp
-@@ -111,7 +111,7 @@ int libclf_closefrom(int fd0)
- }
- 
- /*************************************************************************/
--#elif (defined(linux) || defined(__linux))
-+#elif (defined(linux) || defined(__linux) || defined(__linux__))
- 
- /* Use /proc/self/fd directory */
- #include <sys/types.h>
--- 
-2.4.6
-
diff --git a/package/upmpdcli/upmpdcli.hash b/package/upmpdcli/upmpdcli.hash
index 549945e..762b0af 100644
--- a/package/upmpdcli/upmpdcli.hash
+++ b/package/upmpdcli/upmpdcli.hash
@@ -1,2 +1,2 @@
-# Hashes from: http://www.lesbonscomptes.com/upmpdcli/downloads/upmpdcli-0.11.0.tar.gz.sha256
-sha256 0f064b7fe498ee56879e606f48b7bafa42381d25fda6b91ef2cb3677effc85b9  upmpdcli-0.11.0.tar.gz
+# Hashes from: http://www.lesbonscomptes.com/upmpdcli/downloads/upmpdcli-0.11.2.tar.gz.sha256
+sha256 595865c306b0076baaff7eb4f76f779119bd8952f53a4e6662157dc83ab70d89  upmpdcli-0.11.2.tar.gz
diff --git a/package/upmpdcli/upmpdcli.mk b/package/upmpdcli/upmpdcli.mk
index 8dde87d..c69e01c 100644
--- a/package/upmpdcli/upmpdcli.mk
+++ b/package/upmpdcli/upmpdcli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UPMPDCLI_VERSION = 0.11.0
+UPMPDCLI_VERSION = 0.11.2
 UPMPDCLI_SITE = http://www.lesbonscomptes.com/upmpdcli/downloads
 UPMPDCLI_LICENSE = GPLv2+
 UPMPDCLI_LICENSE_FILES = COPYING
-- 
2.5.0
