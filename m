From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 22 Jun 2019 21:38:23 +0200
Subject: [Buildroot] [git commit] arch: add BR2_ARCH_NEEDS_GCC_AT_LEAST_9
Message-ID: <20190622194128.125C4802D9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=16951722d7c257383aaf736dd492b2d301be9875
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This new symbol will be used by architectures introduced with gcc 9 and
by external toolchains based on gcc 9.

[1] https://gcc.gnu.org/gcc-9/changes.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 arch/Config.in             | 4 ++++
 package/gcc/Config.in.host | 1 +
 2 files changed, 5 insertions(+)

diff --git a/arch/Config.in b/arch/Config.in
index db1199c6a2..d8d841b1a2 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -301,6 +301,10 @@ config BR2_ARCH_NEEDS_GCC_AT_LEAST_8
 	bool
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_7
 
+config BR2_ARCH_NEEDS_GCC_AT_LEAST_9
+	bool
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_8
+
 # The following string values are defined by the individual
 # Config.in.$ARCH files
 config BR2_ARCH
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 758c843ffe..66c59c66c4 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -75,6 +75,7 @@ config BR2_GCC_VERSION_7_X
 
 config BR2_GCC_VERSION_8_X
 	bool "gcc 8.x"
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_9
 	# Broken or unsupported architectures
 	depends on !BR2_csky
 	depends on !BR2_or1k
