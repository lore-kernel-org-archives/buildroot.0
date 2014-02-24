From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Feb 2014 09:02:24 +0100
Subject: [Buildroot] [git commit] packages: missing propagation of !mmu from
	pango
Message-ID: <20140224083839.2FFFC99B79@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ec7c940a3b5c0fed964789b2c7c6cf92681471e0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A number of packages that select Pango (which depends on BR2_USE_MMU)
forget to also depends on BR2_USE_MMU. This commit fixes that.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer/gst-plugins-base/Config.in   |    1 +
 package/gstreamer1/gst1-plugins-base/Config.in |    1 +
 package/libgail/Config.in                      |    1 +
 package/webkit/Config.in                       |    1 +
 4 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/gstreamer/gst-plugins-base/Config.in b/package/gstreamer/gst-plugins-base/Config.in
index 95f84d3..ccc88f7 100644
--- a/package/gstreamer/gst-plugins-base/Config.in
+++ b/package/gstreamer/gst-plugins-base/Config.in
@@ -87,6 +87,7 @@ config BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_PANGO
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR # pango -> libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # pango -> libglib2
+	depends on BR2_USE_MMU # pango -> glib2
 	select BR2_PACKAGE_PANGO
 
 comment "pango plugin needs a toolchain w/ C++, wchar, threads"
diff --git a/package/gstreamer1/gst1-plugins-base/Config.in b/package/gstreamer1/gst1-plugins-base/Config.in
index 55960ea..3b487c5 100644
--- a/package/gstreamer1/gst1-plugins-base/Config.in
+++ b/package/gstreamer1/gst1-plugins-base/Config.in
@@ -131,6 +131,7 @@ config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_PANGO
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR # pango -> libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # pango -> libglib2
+	depends on BR2_USE_MMU # pango -> libglib2
 	select BR2_PACKAGE_PANGO
 	help
 	  Pango-based text rendering and overlay
diff --git a/package/libgail/Config.in b/package/libgail/Config.in
index 4335bef..e997532 100644
--- a/package/libgail/Config.in
+++ b/package/libgail/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_LIBGAIL
 	bool "libgail"
 	depends on BR2_USE_WCHAR # pango -> libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # pango -> libglib2
+	depends on BR2_USE_MMU # pango -> libglib2
 	depends on BR2_PACKAGE_LIBGTK2
 	select BR2_PACKAGE_PANGO
 	help
diff --git a/package/webkit/Config.in b/package/webkit/Config.in
index 0486490..2b0addc 100644
--- a/package/webkit/Config.in
+++ b/package/webkit/Config.in
@@ -13,6 +13,7 @@ config BR2_PACKAGE_WEBKIT
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR # enchant -> libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # enchant -> libglib2
+	depends on BR2_USE_MMU # libgail -> pango -> libglib2
 	depends on BR2_PACKAGE_LIBGTK2
 	depends on BR2_PACKAGE_WEBKIT_ARCH_SUPPORTS
 	depends on !BR2_BINFMT_FLAT # icu
