From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 25 Jun 2015 15:52:08 -0300
Subject: [Buildroot] [PATCH] dosfstools: bump to version 3.0.28
Message-ID: <1435258328-13738-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Change to new homepage since maintainer changed as well.
Add hash file based on tarball signature file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/dosfstools/Config.in       | 2 +-
 package/dosfstools/dosfstools.hash | 2 ++
 package/dosfstools/dosfstools.mk   | 4 ++--
 3 files changed, 5 insertions(+), 3 deletions(-)
 create mode 100644 package/dosfstools/dosfstools.hash

diff --git a/package/dosfstools/Config.in b/package/dosfstools/Config.in
index 7f3481c..33c64b3 100644
--- a/package/dosfstools/Config.in
+++ b/package/dosfstools/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_DOSFSTOOLS
 	help
 	  Tools for creating and checking DOS FAT filesystems.
 
-	  http://www.daniel-baumann.ch/software/dosfstools/
+	  https://github.com/dosfstools/dosfstools
 
 if BR2_PACKAGE_DOSFSTOOLS
 
diff --git a/package/dosfstools/dosfstools.hash b/package/dosfstools/dosfstools.hash
new file mode 100644
index 0000000..f852195
--- /dev/null
+++ b/package/dosfstools/dosfstools.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	ee95913044ecf2719b63ea11212917649709a6e53209a72d622135aaa8517ee2	dosfstools-3.0.28.tar.xz
diff --git a/package/dosfstools/dosfstools.mk b/package/dosfstools/dosfstools.mk
index 88c4fe8..b7f7d96 100644
--- a/package/dosfstools/dosfstools.mk
+++ b/package/dosfstools/dosfstools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-DOSFSTOOLS_VERSION = 3.0.26
+DOSFSTOOLS_VERSION = 3.0.28
 DOSFSTOOLS_SOURCE = dosfstools-$(DOSFSTOOLS_VERSION).tar.xz
-DOSFSTOOLS_SITE = http://daniel-baumann.ch/files/software/dosfstools
+DOSFSTOOLS_SITE = https://github.com/dosfstools/dosfstools/releases/download/v$(DOSFSTOOLS_VERSION)
 DOSFSTOOLS_LICENSE = GPLv3+
 DOSFSTOOLS_LICENSE_FILES = COPYING
 
-- 
2.3.6
