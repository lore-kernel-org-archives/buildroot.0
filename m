From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 15 Sep 2020 20:20:48 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/efl: depends on
 gcc >= 4.9
Message-ID: <20200915185431.D4FF188D1E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e058e5e1bc0d2eff7506133814989cda7a172980
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

efl depends on C++11 since version 1.22.0 and
https://github.com/Enlightenment/efl/commit/ac95f38d1b06ac6977ea6d8b9f14f9405396858f

Fixes:
 - http://autobuild.buildroot.org/results/458ec719a7251b59796edfc865b7226baaed6d8f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit dbe2d2e686281c19739824d4d4faec62187d1779)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/efl/Config.in | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/efl/Config.in b/package/efl/Config.in
index 728032018b..cf4976f66d 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_EFL
 	bool "efl"
-	 # g++ issue with 4.4.5, tested with g++ 4.7.2
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS # untested without threads
 	depends on BR2_USE_MMU
@@ -301,8 +300,8 @@ comment "SVG loader needs a toolchain w/ gcc >= 4.8"
 
 endif # BR2_PACKAGE_EFL
 
-comment "efl needs a toolchain w/ C++, dynamic library, gcc >= 4.7, threads, wchar"
+comment "efl needs a toolchain w/ C++, dynamic library, gcc >= 4.9, threads, wchar"
 	depends on !BR2_INSTALL_LIBSTDCPP \
-		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 \
 		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
 	depends on BR2_USE_MMU
