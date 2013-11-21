From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 Nov 2013 18:21:47 +0100
Subject: [Buildroot] [PATCH] omniorb: needs thread support
Message-ID: <1385054507-2798-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

   http://autobuild.buildroot.org/results/dfc/dfc083bff04eba68456edd359424293842b6f42d/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/omniorb/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/omniorb/Config.in b/package/omniorb/Config.in
index 6326688..192ad54 100644
--- a/package/omniorb/Config.in
+++ b/package/omniorb/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_OMNIORB
 	bool "omniorb"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  omniORB is a robust high performance CORBA ORB for C++ and Python.
 	  omniORB is largely CORBA 2.6 compliant. omniORB is one of only
@@ -10,5 +11,5 @@ config BR2_PACKAGE_OMNIORB
 
 	  http://omniorb.sourceforge.net/
 
-comment "omniORB needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
+comment "omniORB needs a toolchain w/ C++, threads"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
-- 
1.8.1.2
