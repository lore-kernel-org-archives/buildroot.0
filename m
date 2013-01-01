From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 1 Jan 2013 13:26:16 +0100
Subject: [Buildroot] [git commit] libevas-generic-loaders: fix rsvg
	dependencies
Message-ID: <20130101130011.87EA49A585@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=65207ec2d1066ec45c77ad8a644e10d1074905f5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/f9bab292708f885f5e9713901952406f650491c2

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/efl/libevas-generic-loaders/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/efl/libevas-generic-loaders/Config.in b/package/efl/libevas-generic-loaders/Config.in
index 44bc37d..bfa6097 100644
--- a/package/efl/libevas-generic-loaders/Config.in
+++ b/package/efl/libevas-generic-loaders/Config.in
@@ -15,7 +15,11 @@ config BR2_PACKAGE_LIBEVAS_GENERIC_LOADERS_SVG
 	select BR2_PACKAGE_LIBRSVG
 	select BR2_PACKAGE_CAIRO
 	depends on BR2_USE_WCHAR # librsvg -> glib2
+	depends on BR2_INSTALL_LIBSTDCPP # librsvg -> pango
 	help
 	  This option enables the Evas generic SVG loader
 
+comment "SVG loader requires a toolchain with WCHAR and C++ support"
+	depends on !BR2_USE_WCHAR && !BR2_INSTALL_LIBSTDCPP
+
 endif
