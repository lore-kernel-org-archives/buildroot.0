From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 24 Mar 2019 12:45:54 +0100
Subject: [Buildroot] [PATCH 1/1] package/intel-gmmlib: needs dynamic library
Message-ID: <20190324114554.26799-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/0121befb9b4ba6cffc47ce7f861ed81077fc900f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
-- 
2.20.1
