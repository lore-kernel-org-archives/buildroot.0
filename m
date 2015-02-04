From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed,  4 Feb 2015 01:34:05 +0100
Subject: [Buildroot] [PATCH 07/21] grantlee: add missing indirect dependency
	on jscore available
In-Reply-To: <1423010059-23446-1-git-send-email-arnout@mind.be>
References: <1423010059-23446-1-git-send-email-arnout@mind.be>
Message-ID: <1423010059-23446-8-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/grantlee/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

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
-- 
2.1.4
