From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed,  4 Feb 2015 01:34:18 +0100
Subject: [Buildroot] [PATCH 20/21] qt5cinex: add missing indirect dependency
	on libegl
In-Reply-To: <1423010059-23446-1-git-send-email-arnout@mind.be>
References: <1423010059-23446-1-git-send-email-arnout@mind.be>
Message-ID: <1423010059-23446-21-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/qt5cinex/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

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
-- 
2.1.4
