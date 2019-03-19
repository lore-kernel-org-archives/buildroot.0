From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 19 Mar 2019 21:46:40 +0100
Subject: [Buildroot] [PATCH 1/3] package/uftp: needs MMU, threads and wchar
Message-ID: <20190319204642.28920-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/47dd067dfdcaae99d50216f59ea6af115d8f1e1e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/uftp/Config.in | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/uftp/Config.in b/package/uftp/Config.in
index b6a8961628..ca6e5f9a05 100644
--- a/package/uftp/Config.in
+++ b/package/uftp/Config.in
@@ -1,7 +1,14 @@
 config BR2_PACKAGE_UFTP
 	bool "uftp"
+	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_OPENSSL
 	help
 	  Encrypted UDP based FTP with multicast.
 
 	  http://uftp-multicast.sourceforge.net/
+
+comment "uftp needs a toolchain w/ threads, wchar"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
-- 
2.14.1
