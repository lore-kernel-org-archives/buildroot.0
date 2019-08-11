From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 11 Aug 2019 22:50:02 +0200
Subject: [Buildroot] [git commit] package/efl: SVG loader needs gcc >= 4.8
Message-ID: <20190811210019.D983A8859D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1e2a4fa8b2af72ebdc90c14e70a75b0748c0162e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Due to the harfbuzz bump to version 2.5.2 the SVG loader needs gcc >=
4.8.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/efl/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/efl/Config.in b/package/efl/Config.in
index 05be5aae56..c9f2b6a8aa 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -295,11 +295,16 @@ config BR2_PACKAGE_EFL_LIBRAW
 config BR2_PACKAGE_EFL_SVG
 	bool "SVG loader"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # librsvg -> pango -> harfbuzz
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # librsvg -> pango -> harfbuzz
 	select BR2_PACKAGE_LIBRSVG
 	select BR2_PACKAGE_CAIRO
 	help
 	  This option enables the Evas generic SVG loader
 
+comment "SVG loader needs a toolchain w/ gcc >= 4.8"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+
 endif # BR2_PACKAGE_EFL
 
 comment "efl needs a toolchain w/ C++, dynamic library, gcc >= 4.7, threads, wchar"
