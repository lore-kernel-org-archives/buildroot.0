From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Mar 2019 23:06:44 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/intel-gmmlib:
 needs dynamic library
Message-ID: <20190327220338.2B2AC83ACF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1d45e1b5bbfb070de4549decce81715d42acc571
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes:
 - http://autobuild.buildroot.org/results/0121befb9b4ba6cffc47ce7f861ed81077fc900f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 735bedd0d32e18210c38d10ef74f69fc750114c9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/intel-gmmlib/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/intel-gmmlib/Config.in b/package/intel-gmmlib/Config.in
index ef92a91128..9d5fbd9cae 100644
--- a/package/intel-gmmlib/Config.in
+++ b/package/intel-gmmlib/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_INTEL_GMMLIB
 	bool "intel-gmmlib"
 	depends on BR2_x86_64
+	depends on !BR2_STATIC_LIBS
 	help
 	  The Intel(R) Graphics Memory Management Library provides
 	  device specific and buffer management for the Intel(R)
@@ -8,3 +9,6 @@ config BR2_PACKAGE_INTEL_GMMLIB
 	  Media Driver for VAAPI.
 
 	  https://github.com/intel/gmmlib
+
+comment "intel-gmmlib needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
