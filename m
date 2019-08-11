From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 11 Aug 2019 23:03:16 +0200
Subject: [Buildroot] [git commit] package/harfbuzz: needs gcc >= 4.8
Message-ID: <20190811210020.2C1168859D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cbaa50fe4ff1b99eb28086a20cc0b5b3a0b962be
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Due to the version bump to 2.5.2 we need gcc >= 4.8.

Fixes:
http://autobuild.buildroot.net/results/924/9247b9773099d7995ad8fa1665dd768bb550f63c/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/harfbuzz/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/harfbuzz/Config.in b/package/harfbuzz/Config.in
index a6db9840cc..e8f407bb8f 100644
--- a/package/harfbuzz/Config.in
+++ b/package/harfbuzz/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_HARFBUZZ
 	bool "harfbuzz"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 	help
 	  HarfBuzz is an OpenType text shaping engine
 
@@ -10,6 +11,7 @@ config BR2_PACKAGE_HARFBUZZ
 	  Harfbuzz can make optional use of cairo, freetype,
 	  glib2 and icu packages if they are selected.
 
-comment "harfbuzz needs a toolchain w/ C++"
+comment "harfbuzz needs a toolchain w/ C++, gcc => 4.8"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on !BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
