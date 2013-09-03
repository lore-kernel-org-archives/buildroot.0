From: Axel Lin <axel.lin@ingics.com>
Date: Tue, 03 Sep 2013 17:39:53 +0800
Subject: [Buildroot] [PATCH] Config.in: Rename BR2_ELF2FLT to
	BR2_PACKAGE_HOST_ELF2FLT
Message-ID: <1378201193.10215.0.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The BR2_ELF2FLT option has been renamed to BR2_PACKAGE_HOST_ELF2FLT, thus use
the new name to fix dependency.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Config.in b/Config.in
index cb246a4..65c29b4 100644
--- a/Config.in
+++ b/Config.in
@@ -286,7 +286,7 @@ choice
 
 config BR2_STRIP_strip
 	bool "strip"
-	depends on !BR2_ELF2FLT
+	depends on !BR2_PACKAGE_HOST_ELF2FLT
 	help
 	  Binaries and libraries in the target filesystem will be
 	  stripped using the normal 'strip' command. This allows to
@@ -297,7 +297,7 @@ config BR2_STRIP_strip
 config BR2_STRIP_sstrip
 	bool "sstrip"
 	select BR2_PACKAGE_SSTRIP_HOST
-	depends on !BR2_ELF2FLT
+	depends on !BR2_PACKAGE_HOST_ELF2FLT
 	help
 	  Binaries and libraries in the target filesystem will be
 	  stripped using the 'sstrip' command, which strips a little
-- 
1.8.1.2
