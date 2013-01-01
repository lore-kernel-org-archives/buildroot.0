From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 1 Jan 2013 13:20:38 +0100
Subject: [Buildroot] [git commit] librsvg: pango needs C++ support
Message-ID: <20130101130010.F15589A585@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=89913cbec56c1a994d302cfbc86d8c3b22af5aee
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/librsvg/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/librsvg/Config.in b/package/librsvg/Config.in
index 855b3d6..b2ef6ad 100644
--- a/package/librsvg/Config.in
+++ b/package/librsvg/Config.in
@@ -7,8 +7,12 @@ config BR2_PACKAGE_LIBRSVG
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_GDK_PIXBUF
 	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_INSTALL_LIBSTDCPP # pango
 	help
 	  The rsvg library is an efficient renderer for Scalable
 	  Vector Graphics (SVG) pictures.
 
 	  http://librsvg.sourceforge.net/
+
+comment "librsvg requires a toolchain with WCHAR and C++ support"
+	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP
