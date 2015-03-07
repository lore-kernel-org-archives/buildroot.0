From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Sat, 7 Mar 2015 17:10:56 +0000
Subject: [Buildroot] [PATCH] tcl: disable for static builds
Message-ID: <1425748256-20330-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

After discussion on mailing list...

http://lists.busybox.net/pipermail/buildroot/2015-March/121198.html

...we decided to disable tcl for static builds and let someone
interested on it to do the needed changes to add support for static
builds.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/tcl/Config.in |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/tcl/Config.in b/package/tcl/Config.in
index c3d0d87..11d46d3 100644
--- a/package/tcl/Config.in
+++ b/package/tcl/Config.in
@@ -4,14 +4,18 @@ config BR2_PACKAGE_TCL
 	depends on BR2_USE_MMU
 	depends on BR2_INET_IPV6
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	# See this mailing list thread:
+	# http://lists.busybox.net/pipermail/buildroot/2015-March/121198.html
+	depends on !BR2_STATIC_LIBS
 	help
 	  TCL (Tool Command Language) is a simple textual language.
 
 	  http://www.tcl.tk
 
-comment "tcl needs a toolchain w/ ipv6, threads"
+comment "tcl needs a toolchain w/ ipv6, threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_STATIC_LIBS
 
 if BR2_PACKAGE_TCL
 
-- 
1.7.1
