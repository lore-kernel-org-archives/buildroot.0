From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 2 Oct 2016 21:32:30 +0200
Subject: [Buildroot] [git commit] efibootmgr: fix reverse dependency from
	efivar
Message-ID: <20161002193246.71948802AE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=93b83232d58995d9786017f132a657f00fde154e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

efivar minimum gcc version dependency changed from 4.7 to 4.9 in the
last efivar bump, so this must be reflected in efibootmgr Config.in as
well.

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/efibootmgr/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/efibootmgr/Config.in b/package/efibootmgr/Config.in
index 2c5c07f..988bf6d 100644
--- a/package/efibootmgr/Config.in
+++ b/package/efibootmgr/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_EFIBOOTMGR
 	bool "efibootmgr"
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 # efivar
 	depends on BR2_TOOLCHAIN_USES_GLIBC # efivar
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # efivar
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # efivar
 	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS && \
 		!BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII # efivar
 	select BR2_PACKAGE_EFIVAR
@@ -14,9 +14,9 @@ config BR2_PACKAGE_EFIBOOTMGR
 
 	  https://github.com/rhinstaller/efibootmgr
 
-comment "efibootmgr requires a glibc toolchain w/ headers >= 3.12, gcc >= 4.7"
+comment "efibootmgr requires a glibc toolchain w/ headers >= 3.12, gcc >= 4.9"
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 || \
 		!BR2_TOOLCHAIN_USES_GLIBC || \\
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS && \
 		!BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
