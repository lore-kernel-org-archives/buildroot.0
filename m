From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 10 Nov 2019 14:32:08 +0100
Subject: [Buildroot] [git commit] package/glog: disable on microblaze
Message-ID: <20191110132459.6011E8EC26@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cd080fe42133b917d6e0fffc6c5c6344de6f642d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable glog on microblaze instead of trying to fix the build failure
due to __ELF__ being undefined on this architecture following Arnout
request during review of https://patchwork.ozlabs.org/patch/1186107

Fixes:
 - http://autobuild.buildroot.org/results/ae138c08361d3544df92f88edf3f6dcd617b6232

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/glog/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/glog/Config.in b/package/glog/Config.in
index e864094646..3376323004 100644
--- a/package/glog/Config.in
+++ b/package/glog/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_GLOG
 	bool "glog"
+	# __ELF__ not defined on Microblaze
+	depends on !BR2_microblaze
 	depends on BR2_INSTALL_LIBSTDCPP
 	help
 	  C++ implementation of the Google logging module
@@ -7,4 +9,5 @@ config BR2_PACKAGE_GLOG
 	  https://github.com/google/glog
 
 comment "glog needs a toolchain w/ C++"
+	depends on !BR2_microblaze
 	depends on !BR2_INSTALL_LIBSTDCPP
