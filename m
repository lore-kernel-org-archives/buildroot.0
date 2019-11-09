From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  9 Nov 2019 23:51:40 +0100
Subject: [Buildroot] [PATCH 1/1] package/glog: disable on microblaze
Message-ID: <20191109225140.27689-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Disable glog on microblaze instead of trying to fix the build failure
due to __ELF__ being undefined on this architecture following Arnout
request during review of https://patchwork.ozlabs.org/patch/1186107

Fixes:
 - http://autobuild.buildroot.org/results/ae138c08361d3544df92f88edf3f6dcd617b6232

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/glog/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/glog/Config.in b/package/glog/Config.in
index e864094646..41e4bea4fc 100644
--- a/package/glog/Config.in
+++ b/package/glog/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_GLOG
 	bool "glog"
+	depends on !BR2_microblaze
 	depends on BR2_INSTALL_LIBSTDCPP
 	help
 	  C++ implementation of the Google logging module
@@ -7,4 +8,5 @@ config BR2_PACKAGE_GLOG
 	  https://github.com/google/glog
 
 comment "glog needs a toolchain w/ C++"
+	depends on !BR2_microblaze
 	depends on !BR2_INSTALL_LIBSTDCPP
-- 
2.23.0
