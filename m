From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 7 Feb 2015 21:24:20 +0100
Subject: [Buildroot] [git commit] qt5cinex: add missing indirect dependency
	on libegl
Message-ID: <20150207202910.AFC8E8046C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=eb54123ebcef0aa8c5bb26e915fbefa7c6addf0c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5cinex/Config.in |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/qt5cinex/Config.in b/package/qt5cinex/Config.in
index bc533d3..b273231 100644
--- a/package/qt5cinex/Config.in
+++ b/package/qt5cinex/Config.in
@@ -1,7 +1,7 @@
-comment "qt5cinex needs an OpenGL-capable backend"
+comment "qt5cinex needs an Open(E)GL-capable backend"
 	depends on BR2_PACKAGE_QT5
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
-	depends on !BR2_PACKAGE_QT5_GL_AVAILABLE
+	depends on !BR2_PACKAGE_QT5_GL_AVAILABLE || !BR2_PACKAGE_HAS_LIBEGL
 
 config BR2_PACKAGE_QT5CINEX
 	bool "qt5cinex"
@@ -11,6 +11,7 @@ config BR2_PACKAGE_QT5CINEX
 	select BR2_PACKAGE_QT5BASE_WIDGETS
 	select BR2_PACKAGE_QT5BASE_EGLFS
 	select BR2_PACKAGE_QT5GRAPHICALEFFECTS
+	depends on BR2_PACKAGE_HAS_LIBEGL # qt5base-eglfs
 	depends on BR2_PACKAGE_QT5_GL_AVAILABLE
 	# No comment needed for this option, it's an architecture
 	# dependency.
