From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 10 Aug 2020 16:45:39 +0200
Subject: [Buildroot] [git commit] package/libabseil-cpp: make check-package
 happy
Message-ID: <20200810144010.A2AC3829FE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=32c8fa8522cff21d0845bb1c2199fc1e958a527e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The "depends on" must be after the "default" properties.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/677751258

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libabseil-cpp/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libabseil-cpp/Config.in b/package/libabseil-cpp/Config.in
index 5e20a82856..8018e7b264 100644
--- a/package/libabseil-cpp/Config.in
+++ b/package/libabseil-cpp/Config.in
@@ -2,7 +2,6 @@
 # architectures that are supported, and for which ucontext is used.
 config BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
 	bool
-	depends on BR2_TOOLCHAIN_HAS_UCONTEXT
 	default y if BR2_aarch64 || BR2_aarch64_be
 	default y if BR2_arm || BR2_armeb
 	default y if BR2_i386
@@ -10,6 +9,7 @@ config BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
 	default y if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
 	default y if BR2_riscv
 	default y if BR2_x86_64
+	depends on BR2_TOOLCHAIN_HAS_UCONTEXT
 
 config BR2_PACKAGE_LIBABSEIL_CPP
 	bool "libabseil-cpp"
