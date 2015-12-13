From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 13 Dec 2015 10:35:43 +0100
Subject: [Buildroot] [PATCH 1/1] package/read-edid: Needs c++
Message-ID: <1449999343-6032-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/8c1/8c11e463b68121fe0331acf9f8a42a1d3fef40c7//
and others

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/read-edid/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/read-edid/Config.in b/package/read-edid/Config.in
index c830e17..6f39037 100644
--- a/package/read-edid/Config.in
+++ b/package/read-edid/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_READ_EDID
 	bool "read-edid"
+	depends on BR2_INSTALL_LIBSTDCPP
 	help
 	  Read-edid is a pair of tools for reading the EDID from a
 	  monitor. It should work with most monitors made since 1996
@@ -11,3 +12,6 @@ config BR2_PACKAGE_READ_EDID
 	  XF86Config-compatible monitor section.
 
 	  http://polypux.org/projects/read-edid/
+
+comment "read-edid needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
-- 
2.6.2
