From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu,  8 Oct 2020 22:06:11 +0200
Subject: [Buildroot] [PATCH 1/1] package/botan: update architectures
Message-ID: <20201008200611.548512-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- aarch64, powerpc64le and s390x are supported since version 2.5.0 and
  https://github.com/randombit/botan/commit/5f55f0eac95cd6f1c2962aef261af285bf37bfb6
- sparc64 is supported since version 2.5.0 and
  https://github.com/randombit/botan/commit/7e6aea7a9bff0714756aff5c7470c5c55cb31e0c
- riscv is supported since version 2.8.0 and
  https://github.com/randombit/botan/commit/b9aafd67002be96bf00eea4e7791804693ba4b1f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/botan/Config.in | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/package/botan/Config.in b/package/botan/Config.in
index a242a38efc..95367b9000 100644
--- a/package/botan/Config.in
+++ b/package/botan/Config.in
@@ -1,9 +1,15 @@
 config BR2_PACKAGE_BOTAN_ARCH_SUPPORTS
 	bool
-	default y if BR2_arm || BR2_armeb || BR2_i386 || BR2_m68k    || \
-		BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el || \
-		BR2_powerpc || BR2_powerpc64 || BR2_sparc || BR2_sh  || \
-		BR2_x86_64
+	default y if BR2_aarch64 || BR2_aarch64_be
+	default y if BR2_arm || BR2_armeb
+	default y if BR2_i386 || BR2_x86_64
+	default y if BR2_m68k
+	default y if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
+	default y if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
+	default y if BR2_riscv
+	default y if BR2_sparc || BR2_sparc64
+	default y if BR2_s390x
+	default y if BR2_sh
 
 config BR2_PACKAGE_BOTAN
 	bool "botan"
-- 
2.28.0
