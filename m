From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Apr 2010 06:05:12 +0200
Subject: [Buildroot] [PATCH 16/25] Move the global config cache option to an
	Advanced submenu
In-Reply-To: <cover.1270958653.git.thomas.petazzoni@free-electrons.com>
References: <cover.1270958653.git.thomas.petazzoni@free-electrons.com>
Message-ID: <f07e3461577efafcd2bd2dc76b221e6b163234e6.1270958653.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in |   20 ++++++++++++--------
 1 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/Config.in b/Config.in
index de0c3b2..7ad84e7 100644
--- a/Config.in
+++ b/Config.in
@@ -145,14 +145,6 @@ config BR2_DEPRECATED
 	help
 	  This option hides outdated/obsolete versions of packages.
 
-config BR2_CONFIG_CACHE
-	bool "Use a central configure cache file"
-	default y
-	help
-	  This determines if a central config cache is used by
-	  packages, reducing the configure time for packages as each
-	  one caches its findings.
-
 config BR2_ENABLE_DEBUG
 	bool "build packages with debugging symbols"
 	select BR2_PACKAGE_GDB_SERVER
@@ -312,6 +304,18 @@ config BR2_HAVE_DEVFILES
 	  Install headers and static libraries in the
 	  target filesystem
 
+menu "Advanced"
+
+config BR2_CONFIG_CACHE
+	bool "Use a central configure cache file"
+	default y
+	help
+	  This determines if a central config cache is used by
+	  packages, reducing the configure time for packages as each
+	  one caches its findings.
+
+endmenu
+
 endmenu
 
 source "toolchain/Config.in"
-- 
1.6.3.3
