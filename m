From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed,  4 Feb 2015 01:34:19 +0100
Subject: [Buildroot] [PATCH 21/21] qt5webkit: add missing indirect
	dependency on atomics and !flat
In-Reply-To: <1423010059-23446-1-git-send-email-arnout@mind.be>
References: <1423010059-23446-1-git-send-email-arnout@mind.be>
Message-ID: <1423010059-23446-22-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/qt5/qt5webkit/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/qt5/qt5webkit/Config.in b/package/qt5/qt5webkit/Config.in
index 419e393..3507a9d 100644
--- a/package/qt5/qt5webkit/Config.in
+++ b/package/qt5/qt5webkit/Config.in
@@ -9,6 +9,8 @@ config BR2_PACKAGE_QT5WEBKIT
 	# This module does not support static linking
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
+	depends on BR2_ARCH_HAS_ATOMICS # icu
+	depends on !BR2_BINFMT_FLAT # icu
 	help
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
-- 
2.1.4
