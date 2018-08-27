From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Aug 2018 00:01:00 +0200
Subject: [Buildroot] [git commit] cutelyst: depends on C++11
Message-ID: <20180827220219.C42E38E80C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=68fe6d7d00ad5c998ee05d48cf1dbb6450621966
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

thread-local storage is a C++11 feature available since gcc 4.8:
https://gcc.gnu.org/projects/cxx-status.html#cxx11

Fixes:
 - http://autobuild.buildroot.net/results/2963bd55cd7c33ded3e5a75fc86079acfae844c1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cutelyst/Config.in | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/cutelyst/Config.in b/package/cutelyst/Config.in
index 5a3974a454..91b559bd18 100644
--- a/package/cutelyst/Config.in
+++ b/package/cutelyst/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_CUTELYST
 	bool "cutelyst"
 	depends on BR2_PACKAGE_QT5
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_QT5BASE_GUI
 	help
@@ -8,3 +10,7 @@ config BR2_PACKAGE_CUTELYST
 	  the simple approach of Catalyst (Perl) framework.
 
 	  https://cutelyst.org
+
+comment "cutelyst needs a toolchain w/ C++, gcc >= 4.8"
+	depends on BR2_PACKAGE_QT5
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
