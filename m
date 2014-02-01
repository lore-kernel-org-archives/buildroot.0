From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 1 Feb 2014 12:05:37 +0100
Subject: [Buildroot] [git commit] gstreamer{,
	1}: use more sensible kconfig names
Message-ID: <20140201124728.62CDA9C727@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f33e25403d73ee3344b2b94e55e7a7a0aa4369e8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The gstreamer / gstreamer1 names are not directly obvious to outsiders, so
spell out the fact that they are about the 0.10 and 1.x versions.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer/gstreamer/Config.in   |    4 ++--
 package/gstreamer1/gstreamer1/Config.in |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/gstreamer/gstreamer/Config.in b/package/gstreamer/gstreamer/Config.in
index 75f8fda..b833c96 100644
--- a/package/gstreamer/gstreamer/Config.in
+++ b/package/gstreamer/gstreamer/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_GSTREAMER
-	bool "gstreamer"
+	bool "gstreamer 0.10"
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	depends on BR2_USE_MMU # glib2
@@ -31,6 +31,6 @@ config BR2_PACKAGE_GSTREAMER_PLUGIN_REGISTRY
 
 endif
 
-comment "gstreamer needs a toolchain w/ wchar, threads"
+comment "gstreamer 0.10 needs a toolchain w/ wchar, threads"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/gstreamer1/gstreamer1/Config.in b/package/gstreamer1/gstreamer1/Config.in
index 8c8f165..22dc426 100644
--- a/package/gstreamer1/gstreamer1/Config.in
+++ b/package/gstreamer1/gstreamer1/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_GSTREAMER1
-	bool "gstreamer1"
+	bool "gstreamer 1.x"
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	depends on BR2_USE_MMU # glib2
@@ -50,6 +50,6 @@ config BR2_PACKAGE_GSTREAMER1_INSTALL_TOOLS
 
 endif
 
-comment "gstreamer1 needs a toolchain w/ wchar, threads"
+comment "gstreamer 1.x needs a toolchain w/ wchar, threads"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
