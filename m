From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 1 Sep 2015 14:20:50 +0100
Subject: [Buildroot] [PATCH] util-linux: show utilities alphabetically
	ordered
Message-ID: <1441113650-51415-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The list of util-linux utilities we can find on its Config.in file it
seems to be alphabetically ordered in purpose. However, there are some
of them which are in the wrong place. This patch fixes that.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/util-linux/Config.in |   24 ++++++++++++------------
 1 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index cc6e9a5..d5c9812 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -149,15 +149,6 @@ config BR2_PACKAGE_UTIL_LINUX_MINIX
 	help
 	  Minix filesystem support
 
-config BR2_PACKAGE_UTIL_LINUX_NSENTER
-	bool "nsenter"
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
-	help
-	  Enter the namespaces of another process.
-
-comment "nsenter needs a toolchain w/ headers >= 3.0"
-	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
-
 config BR2_PACKAGE_UTIL_LINUX_MORE
 	bool "more"
 	select BR2_PACKAGE_NCURSES
@@ -184,16 +175,25 @@ config BR2_PACKAGE_UTIL_LINUX_NOLOGIN
 	help
 	  Politely refuse a login
 
-config BR2_PACKAGE_UTIL_LINUX_PIVOT_ROOT
-	bool "pivot_root"
+config BR2_PACKAGE_UTIL_LINUX_NSENTER
+	bool "nsenter"
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
 	help
-	  Change the root filesystem
+	  Enter the namespaces of another process.
+
+comment "nsenter needs a toolchain w/ headers >= 3.0"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
 
 config BR2_PACKAGE_UTIL_LINUX_PARTX
 	bool "partition utilities"
 	help
 	  Partition tools (addpart, delpart, partx)
 
+config BR2_PACKAGE_UTIL_LINUX_PIVOT_ROOT
+	bool "pivot_root"
+	help
+	  Change the root filesystem
+
 config BR2_PACKAGE_UTIL_LINUX_RAW
 	bool "raw"
 	help
-- 
1.7.1
