From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 28 May 2016 16:47:22 +0200
Subject: [Buildroot] [PATCH] package/grantlee: disable for nios2 and
	microblaze
Message-ID: <1464446842-15225-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Disable grantlee due to a toolchain issue on nios2 and microblaze architecture [1].
Issue reproduced with binutils 2.26 and GCC 6

Fixes (microblaze):
http://autobuild.buildroot.net/results/091/091bf7df46d6057be44b8ca8653596bd84c38fbc

Fixes (nios2):
http://autobuild.buildroot.net/results/e05/e05280f1cc4f669b7e418161749290723179e987

[1] https://sourceware.org/bugzilla/show_bug.cgi?id=20173

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/grantlee/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/grantlee/Config.in b/package/grantlee/Config.in
index 97be721..af806b2 100644
--- a/package/grantlee/Config.in
+++ b/package/grantlee/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_GRANTLEE
 	depends on (BR2_PACKAGE_QT_ARCH_SUPPORTS_SCRIPT && BR2_PACKAGE_QT) || \
 		(BR2_PACKAGE_QT5_JSCORE_AVAILABLE && BR2_PACKAGE_QT5)
 	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_19405 # Qt GUI module
+	depends on !(BR2_microblaze || BR2_nios2) # https://sourceware.org/bugzilla/show_bug.cgi?id=20173
 	select BR2_PACKAGE_QT_STL if BR2_PACKAGE_QT
 	select BR2_PACKAGE_QT_SCRIPT if BR2_PACKAGE_QT
 	select BR2_PACKAGE_QT_GUI_MODULE if BR2_PACKAGE_QT
-- 
2.5.5
