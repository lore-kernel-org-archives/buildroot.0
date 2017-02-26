From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Feb 2017 23:22:28 +0100
Subject: [Buildroot] [PATCH] assimp: remove dead "depends on" dependency
Message-ID: <1488147748-9833-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX has been removed in commit
311bc137da2952445683413794f3ebc8e477c9ef ("toolchain: kill ADI
Blackfin toolchain"), so this "depends on" is useless.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/assimp/Config.in | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/assimp/Config.in b/package/assimp/Config.in
index 8fa6429..93020f7 100644
--- a/package/assimp/Config.in
+++ b/package/assimp/Config.in
@@ -4,11 +4,6 @@ config BR2_PACKAGE_ASSIMP
 	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=71124, that
 	# cause an infinite loop in gcc when building this package.
 	depends on !BR2_microblaze
-	# The ADI Blackfin toolchain does not build assimp properly,
-	# fails with "internal compiler error: in simplify_subreg, at
-	# simplify-rtx.c:5001". It builds fine with a mainline gcc for
-	# Blackfin.
-	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX
 	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_ZLIB
 	help
-- 
2.7.4
