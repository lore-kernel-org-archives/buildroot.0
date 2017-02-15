From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 15 Feb 2017 16:49:42 -0300
Subject: [Buildroot] [PATCH next] sed: bump to version 4.4
Message-ID: <20170215194942.1863-1-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/sed/Config.in | 5 +++--
 package/sed/sed.hash  | 2 +-
 package/sed/sed.mk    | 3 ++-
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/sed/Config.in b/package/sed/Config.in
index 6adebf2..b8d182a 100644
--- a/package/sed/Config.in
+++ b/package/sed/Config.in
@@ -3,9 +3,10 @@ config BR2_PACKAGE_SED
 	depends on BR2_USE_WCHAR
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	help
-	  Super-useful stream editor.
+	  sed (stream editor) is a non-interactive command-line text
+	  editor.
 
-	  http://sed.sourceforge.net/
+	  https://www.gnu.org/software/sed/
 
 comment "sed needs a toolchain w/ wchar"
 	depends on !BR2_USE_WCHAR
diff --git a/package/sed/sed.hash b/package/sed/sed.hash
index e7f2db5..652c573 100644
--- a/package/sed/sed.hash
+++ b/package/sed/sed.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	fea0a94d4b605894f3e2d5572e3f96e4413bcad3a085aae7367c2cf07908b2ff	sed-4.2.2.tar.gz
+sha256	cbd6ebc5aaf080ed60d0162d7f6aeae58211a1ee9ba9bb25623daa6cd942683b	sed-4.4.tar.xz
diff --git a/package/sed/sed.mk b/package/sed/sed.mk
index 71c62d0..68bcb98 100644
--- a/package/sed/sed.mk
+++ b/package/sed/sed.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-SED_VERSION = 4.2.2
+SED_VERSION = 4.4
+SED_SOURCE = sed-$(SED_VERSION).tar.xz
 SED_SITE = $(BR2_GNU_MIRROR)/sed
 SED_LICENSE = GPLv3
 SED_LICENSE_FILES = COPYING
-- 
2.10.2
