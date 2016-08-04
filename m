From: Romain Naour <romain.naour@gmail.com>
Date: Thu,  4 Aug 2016 23:55:25 +0200
Subject: [Buildroot] [PATCH] package/oprofile: disable for m68k
Message-ID: <1470347725-12601-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As for Xtensa [1] and Microblaze [2], disable m68k due to the lack of
memory barrier operations.

Fixes:
http://autobuild.buildroot.net/results/1cc/1cc761d8a5715d0a2c6eaacfde7e44b225da1b36

[1] c45979c732cb610ad5d54e23dd7d4d49e519d45b
[2] b71bdd68562f82db9d5515de1ca4a33789c05cb9

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/oprofile/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/oprofile/Config.in b/package/oprofile/Config.in
index 9014d9f..b372aa2 100644
--- a/package/oprofile/Config.in
+++ b/package/oprofile/Config.in
@@ -8,7 +8,7 @@ config BR2_PACKAGE_OPROFILE
 	depends on !BR2_nios2 # binutils
 	depends on BR2_USE_WCHAR # binutils
 	# no memory barrier functions
-	depends on !BR2_xtensa && !BR2_microblaze
+	depends on !BR2_xtensa && !BR2_microblaze && !BR2_m68k
 	# libpfm4 is needed on PowerPC, and requires thread support
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_powerpc
 	help
-- 
2.5.5
