From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Nov 2013 16:00:53 +0100
Subject: [Buildroot] [git commit] omniorb: needs thread support
Message-ID: <20131122150950.EA13F9BD90@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b55e473e62cf6336de4a1ce368409df8e20e74f5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

   http://autobuild.buildroot.org/results/dfc/dfc083bff04eba68456edd359424293842b6f42d/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/omniorb/Config.in |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

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
