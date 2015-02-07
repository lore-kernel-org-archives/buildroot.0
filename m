From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 7 Feb 2015 21:06:18 +0100
Subject: [Buildroot] [git commit] grantlee: add missing indirect dependency
	on jscore available
Message-ID: <20150207202910.30A4D8046C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=63c20b1a9da12e3ea9896bb9f2f7480873ce3b1e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/grantlee/Config.in |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/grantlee/Config.in b/package/grantlee/Config.in
index 6227d7f..01ddacd 100644
--- a/package/grantlee/Config.in
+++ b/package/grantlee/Config.in
@@ -1,7 +1,8 @@
 config BR2_PACKAGE_GRANTLEE
 	bool "grantlee"
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # Qt Script
-	depends on (BR2_PACKAGE_QT_ARCH_SUPPORTS_SCRIPT && BR2_PACKAGE_QT) || BR2_PACKAGE_QT5
+	depends on (BR2_PACKAGE_QT_ARCH_SUPPORTS_SCRIPT && BR2_PACKAGE_QT) || \
+		(BR2_PACKAGE_QT5_JSCORE_AVAILABLE && BR2_PACKAGE_QT5)
 	select BR2_PACKAGE_QT_STL if BR2_PACKAGE_QT
 	select BR2_PACKAGE_QT_SCRIPT if BR2_PACKAGE_QT
 	select BR2_PACKAGE_QT_GUI_MODULE if BR2_PACKAGE_QT
@@ -14,4 +15,5 @@ config BR2_PACKAGE_GRANTLEE
 
 comment "grantlee needs a toolchain with NPTL"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
-	depends on BR2_PACKAGE_QT_ARCH_SUPPORTS_SCRIPT || BR2_PACKAGE_QT5
+	depends on (BR2_PACKAGE_QT_ARCH_SUPPORTS_SCRIPT && BR2_PACKAGE_QT) || \
+		(BR2_PACKAGE_QT5_JSCORE_AVAILABLE && BR2_PACKAGE_QT5)
