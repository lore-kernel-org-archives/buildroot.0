From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 21 Sep 2019 21:22:19 +0200
Subject: [Buildroot] [git commit] package/liburcu: bump to version 0.11.1
Message-ID: <20190921192313.BE0FE8EFF5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2cb05c00476951927557e477341744f569d7db15
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Add hash for license files
- RISC-V is supported since version 0.11.0 and
  https://github.com/urcu/userspace-rcu/commit/fdfad81006c2c964781b616f0a75578507be809c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/liburcu/Config.in    |  2 +-
 package/liburcu/liburcu.hash | 12 ++++++++----
 package/liburcu/liburcu.mk   |  2 +-
 3 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/package/liburcu/Config.in b/package/liburcu/Config.in
index 11a1e1a093..7d29642084 100644
--- a/package/liburcu/Config.in
+++ b/package/liburcu/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
 	depends on BR2_arm || BR2_armeb || BR2_aarch64 || BR2_aarch64_be || \
 		BR2_i386 || BR2_mips || BR2_mips64 || BR2_mipsel || \
 		BR2_mips64el || BR2_nios2 || BR2_powerpc || BR2_powerpc64 || \
-		BR2_powerpc64le || BR2_sparc64 || BR2_x86_64
+		BR2_powerpc64le || BR2_riscv || BR2_sparc64 || BR2_x86_64
 	depends on BR2_USE_MMU # fork() in test
 
 config BR2_PACKAGE_LIBURCU
diff --git a/package/liburcu/liburcu.hash b/package/liburcu/liburcu.hash
index 01ce51aabd..5c2f7e52a8 100644
--- a/package/liburcu/liburcu.hash
+++ b/package/liburcu/liburcu.hash
@@ -1,4 +1,8 @@
-# http://www.lttng.org/files/urcu/userspace-rcu-0.10.2.tar.bz2.sha1
-sha1  70ac938acdc738bee7e2e1f462a7991a25ba2439  userspace-rcu-0.10.2.tar.bz2
-# Locally generated
-sha256 b3f6888daf6fe02c1f8097f4a0898e41b5fe9975e121dc792b9ddef4b17261cc  userspace-rcu-0.10.2.tar.bz2
+# http://www.lttng.org/files/urcu/userspace-rcu-0.11.1.tar.bz2.sha256
+sha256 92b9971bf3f1c443edd6c09e7bf5ff3b43531e778841f16377a812c8feeb3350  userspace-rcu-0.11.1.tar.bz2
+
+# Hash for license files
+sha256 36b6d3fa47916943fd5fec313c584784946047ec1337a78b440e5992cb595f89  lgpl-2.1.txt
+sha256 8ef8121eddd2fc0779d94331a1d0f1ead9c796343d845e564cd8c8c4ae3d6f6e  lgpl-relicensing.txt
+sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  gpl-2.0.txt
+sha256 e8c070cb093be4b2eaf938a5f1c11621163b2d9cfa2790460cf925d81e442fa7  LICENSE
diff --git a/package/liburcu/liburcu.mk b/package/liburcu/liburcu.mk
index 8ddfb3fb84..217e90a1b1 100644
--- a/package/liburcu/liburcu.mk
+++ b/package/liburcu/liburcu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBURCU_VERSION = 0.10.2
+LIBURCU_VERSION = 0.11.1
 LIBURCU_SITE = http://lttng.org/files/urcu
 LIBURCU_SOURCE = userspace-rcu-$(LIBURCU_VERSION).tar.bz2
 LIBURCU_LICENSE = LGPL-2.1+ (library), MIT-like (few source files listed in LICENSE), GPL-2.0+ (test), GPL-3.0 (few *.m4 files)
