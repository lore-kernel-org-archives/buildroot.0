From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 21 Sep 2019 11:17:37 +0200
Subject: [Buildroot] [PATCH 1/1] package/liburcu: update supported
 architectures
Message-ID: <20190921091737.25486-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- aarch64_be is supported since version 0.10.0 and
  https://github.com/urcu/userspace-rcu/commit/d1c678425415ed986d0101d5d9ab228b160b2fc3
- m68k is supported since version 0.10.0 and
  https://github.com/urcu/userspace-rcu/commit/2748bd6c7b5732f79cea82eba175b91a35d6833f
- mips is supported since version 0.7.4 and
  https://github.com/urcu/userspace-rcu/commit/e1259cb17954e4e03954ba7376d3ed61649116cd
- nios2 is supported since version 0.10.0 and
  https://github.com/urcu/userspace-rcu/commit/859050b3088aa3f0cb59d7f51ce24b9a0f18faa5
- powerpc64 is supported
- sparc64 is supported

Build tested:
                      br-m68k-68040-full [15/44]: OK
                 br-mips32r6-el-hf-glibc [17/44]: OK
                      br-mips64-n64-full [18/44]: OK
                 br-mips64r6-el-hf-glibc [19/44]: OK
                      br-mipsel-o32-full [20/44]: OK
                          br-nios2-glibc [21/44]: OK
             br-powerpc64le-power8-glibc [24/44]: OK
               br-powerpc64-power7-glibc [25/44]: OK
                        br-sparc64-glibc [30/44]: OK
                       linaro-aarch64-be [35/44]: OK

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/liburcu/Config.in | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/liburcu/Config.in b/package/liburcu/Config.in
index 2598181ad1..11a1e1a093 100644
--- a/package/liburcu/Config.in
+++ b/package/liburcu/Config.in
@@ -1,7 +1,10 @@
 config BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
 	bool
 	default y
-	depends on BR2_arm || BR2_armeb || BR2_aarch64 || BR2_i386 || BR2_powerpc || BR2_x86_64
+	depends on BR2_arm || BR2_armeb || BR2_aarch64 || BR2_aarch64_be || \
+		BR2_i386 || BR2_mips || BR2_mips64 || BR2_mipsel || \
+		BR2_mips64el || BR2_nios2 || BR2_powerpc || BR2_powerpc64 || \
+		BR2_powerpc64le || BR2_sparc64 || BR2_x86_64
 	depends on BR2_USE_MMU # fork() in test
 
 config BR2_PACKAGE_LIBURCU
-- 
2.23.0
