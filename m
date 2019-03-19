From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 19 Mar 2019 22:03:10 +0100
Subject: [Buildroot] [git commit] package/uftp: needs MMU, threads and wchar
Message-ID: <20190319210005.C054282A23@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3bc0830d5de3e2b94f0565b7a7314b1515dd4612
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/47dd067dfdcaae99d50216f59ea6af115d8f1e1e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
