From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 11 May 2021 09:51:56 +0200
Subject: [Buildroot] [git commit] package/domoticz: needs gcc >= 6
Message-ID: <20210511072501.13B8386DB0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=143635b0c3595cf8d58ca2d7267fd1dbe1476c7e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

domoticz fails to build with gcc 5 since bump to version 2021.1 in
commit 33b49c4ae33e767b86130cbc1844e2003bbe0f98 because domoticz needs
C++14 since
https://github.com/domoticz/domoticz/commit/bdf82257dc93daa78b0179a0229539553b608f6b

Fixes:
 - http://autobuild.buildroot.org/results/f4f9caa44d1836279c3806bc990a1203bf743c0d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/domoticz/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/domoticz/Config.in b/package/domoticz/Config.in
index 26e79c18b7..4324d13cee 100644
--- a/package/domoticz/Config.in
+++ b/package/domoticz/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_DOMOTICZ
 	bool "domoticz"
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # sleep_for
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_6 # C++14
 	# pthread_condattr_setclock
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # mosquitto
 	depends on BR2_INSTALL_LIBSTDCPP
@@ -32,11 +32,11 @@ config BR2_PACKAGE_DOMOTICZ
 
 	  http://domoticz.com
 
-comment "domoticz needs lua 5.3 and a toolchain w/ C++, gcc >= 4.8, NPTL, wchar, dynamic library"
+comment "domoticz needs lua 5.3 and a toolchain w/ C++, gcc >= 6, NPTL, wchar, dynamic library"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_6 || \
 		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
 		!BR2_USE_WCHAR || BR2_STATIC_LIBS || \
 		!BR2_PACKAGE_LUA_5_3
