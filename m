From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 27 Feb 2011 22:25:58 +0100
Subject: [Buildroot] [git commit master 1/1] xerces: needs wchar support in
	toolchain
Message-ID: <20110227212630.BF9E98F77C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b89f403e0b076d40ee1fc48e42c7df02c4c24c73
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/xerces/Config.in |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/xerces/Config.in b/package/xerces/Config.in
index 123f0c1..b77794d 100644
--- a/package/xerces/Config.in
+++ b/package/xerces/Config.in
@@ -1,11 +1,11 @@
 config BR2_PACKAGE_XERCES
 	bool "xerces-c++"
-	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
 	  Xerces-C++ is a validating XML parser written in portable C++.
 
 	  http://xml.apache.org/xerces-c/
 
-comment "xerces-c++ requires a toolchain with C++ support enabled"
-	depends on !BR2_INSTALL_LIBSTDCPP
+comment "xerces-c++ requires a toolchain with C++ and WCHAR support enabled"
+	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR)
-- 
1.7.3.4
