From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 7 Feb 2015 21:25:05 +0100
Subject: [Buildroot] [git commit] qt5webkit: add missing indirect dependency
	on atomics and !flat
Message-ID: <20150207202910.B7A8B8046C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=675897d3599097cdac4b1c66608ec3b92c068a02
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt5webkit/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

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
