From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 11 Sep 2015 19:47:16 +0200
Subject: [Buildroot] [git commit] util-linux: show utilities alphabetically
	ordered
Message-ID: <20150911174757.0E2D581DB7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=54b072e6930b38ecc2ba4fd1b3935568f51a5ed9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The list of util-linux utilities we can find on its Config.in file it
seems to be alphabetically ordered in purpose. However, there are some
of them which are in the wrong place. This patch fixes that.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
