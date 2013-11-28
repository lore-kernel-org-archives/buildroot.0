From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 28 Nov 2013 15:57:17 +0000
Subject: [Buildroot] [PATCH 2/2] qt5quick1: Disable on non-supported
	platforms
In-Reply-To: <1385654237-36389-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1385654237-36389-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1385654237-36389-4-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package selects BR2_PACKAGE_QT5SCRIPT which is not supported on
certain platforms. To prevent this behaviour we use the same solution as
we applied for BR2_PACKAGE_QT5SCRIPT

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/qt5/qt5quick1/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/qt5/qt5quick1/Config.in b/package/qt5/qt5quick1/Config.in
index 9cb97a6..735f552 100644
--- a/package/qt5/qt5quick1/Config.in
+++ b/package/qt5/qt5quick1/Config.in
@@ -12,6 +12,7 @@ config BR2_PACKAGE_QT5QUICK1
 	depends on BR2_PACKAGE_HAS_OPENGL_EGL
 	depends on BR2_PACKAGE_HAS_OPENGL_ES
 	depends on BR2_PACKAGE_QT5JSBACKEND_AVAILABLE
+	depends on BR2_PACKAGE_QT_ARCH_SUPPORTS_WEBKIT
 	help
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
-- 
1.7.1
