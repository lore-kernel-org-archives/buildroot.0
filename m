From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  8 May 2021 21:41:54 +0200
Subject: [Buildroot] [PATCH 1/2] boot/opensbi: bump to version 0.9
Message-ID: <20210508194155.3678473-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://github.com/riscv/opensbi/releases/tag/v0.9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 boot/opensbi/Config.in    | 4 ++--
 boot/opensbi/opensbi.hash | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/boot/opensbi/Config.in b/boot/opensbi/Config.in
index 55a644506f..632eeec88d 100644
--- a/boot/opensbi/Config.in
+++ b/boot/opensbi/Config.in
@@ -19,7 +19,7 @@ choice
 	  Select the specific OpenSBI version you want to use
 
 config BR2_TARGET_OPENSBI_LATEST_VERSION
-	bool "0.8"
+	bool "0.9"
 
 config BR2_TARGET_OPENSBI_CUSTOM_VERSION
 	bool "Custom version"
@@ -57,7 +57,7 @@ endif
 
 config BR2_TARGET_OPENSBI_VERSION
 	string
-	default "0.8"	if BR2_TARGET_OPENSBI_LATEST_VERSION
+	default "0.9"	if BR2_TARGET_OPENSBI_LATEST_VERSION
 	default BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE \
 		if BR2_TARGET_OPENSBI_CUSTOM_VERSION
 	default "custom"	if BR2_TARGET_OPENSBI_CUSTOM_TARBALL
diff --git a/boot/opensbi/opensbi.hash b/boot/opensbi/opensbi.hash
index f7280b890b..3b6d97c42d 100644
--- a/boot/opensbi/opensbi.hash
+++ b/boot/opensbi/opensbi.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  17e048ac765e92e15f7436b604452614cf88dc2bcbbaab18cdc024f3fdd4c575  opensbi-0.8.tar.gz
+sha256  60f995cb3cd03e3cf5e649194d3395d0fe67499fd960a36cf7058a4efde686f0  opensbi-0.9.tar.gz
 sha256  82d13fb1bf6bb162629deeea9eb9c117e74548d3b707e478967691fe79a68e21  COPYING.BSD
-- 
2.30.2
