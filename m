From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 28 Jun 2018 22:15:55 +0200
Subject: [Buildroot] [git commit] toolchain-external-linaro-aarch64-be: new
 package
Message-ID: <20180628201800.AC96D83678@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=680047e3b77ae8ff7cdcc9bca65be1b7677a433e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds a new package for the Linaro external toolchain for
the AArch64 Big Endian architecture.

https://releases.linaro.org/components/toolchain/binaries/7.3-2018.05

Signed-off-by: Ofer Heifetz <oferh@marvell.com>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 toolchain/toolchain-external/Config.in                   |  6 ++++++
 .../toolchain-external-linaro-aarch64-be/Config.in       | 15 +++++++++++++++
 .../Config.in.options                                    |  9 +++++++++
 .../toolchain-external-linaro-aarch64-be.hash            |  3 +++
 .../toolchain-external-linaro-aarch64-be.mk              | 16 ++++++++++++++++
 5 files changed, 49 insertions(+)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 6759e5cefa..273910699f 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -15,6 +15,9 @@ comment "glibc toolchains only available with shared lib support"
 source "toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in"
 source "toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/Config.in"
 
+# Aarch64 big-endian
+source "toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/Config.in"
+
 # ARC
 source "toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in"
 
@@ -110,6 +113,9 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 source "toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in.options"
 source "toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/Config.in.options"
 
+# Aarch64 big-endian
+source "toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/Config.in.options"
+
 # ARC
 source "toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in.options"
 
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/Config.in b/toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/Config.in
new file mode 100644
index 0000000000..9e7d2a6233
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/Config.in
@@ -0,0 +1,15 @@
+config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_BE
+	bool "Linaro AArch64 BE 2018.05"
+	depends on BR2_aarch64_be
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on !BR2_STATIC_LIBS
+	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_TOOLCHAIN_HAS_SSP
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_10
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_7
+	select BR2_TOOLCHAIN_HAS_FORTRAN
+	help
+	  Toolchain for the AArch64 Big Endian architecture, from
+	  http://www.linaro.org/engineering/armv8/
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/Config.in.options b/toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/Config.in.options
new file mode 100644
index 0000000000..d44750ff08
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/Config.in.options
@@ -0,0 +1,9 @@
+if BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_BE
+
+config BR2_TOOLCHAIN_EXTERNAL_PREFIX
+	default "aarch64_be-linux-gnu"
+
+config BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL
+	default "toolchain-external-linaro-aarch64-be"
+
+endif
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/toolchain-external-linaro-aarch64-be.hash b/toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/toolchain-external-linaro-aarch64-be.hash
new file mode 100644
index 0000000000..f93642ecaa
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/toolchain-external-linaro-aarch64-be.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 412da19c1d1bff0f3172bc19fd2c024207d8d716dbe7a8dad4bf9e3d6b71d149  gcc-linaro-7.3.1-2018.05-i686_aarch64_be-linux-gnu.tar.xz
+sha256 277c1483f8dbd6007c945ffeb706fa1ba1da8ec1c397cf5cf1e29c25081426e5  gcc-linaro-7.3.1-2018.05-x86_64_aarch64_be-linux-gnu.tar.xz
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/toolchain-external-linaro-aarch64-be.mk b/toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/toolchain-external-linaro-aarch64-be.mk
new file mode 100644
index 0000000000..7a01151bf1
--- /dev/null
+++ b/toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/toolchain-external-linaro-aarch64-be.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# toolchain-external-linaro-aarch64-be
+#
+################################################################################
+
+TOOLCHAIN_EXTERNAL_LINARO_AARCH64_BE_VERSION = 2018.05
+TOOLCHAIN_EXTERNAL_LINARO_AARCH64_BE_SITE = https://releases.linaro.org/components/toolchain/binaries/7.3-$(TOOLCHAIN_EXTERNAL_LINARO_AARCH64_BE_VERSION)/aarch64_be-linux-gnu
+
+ifeq ($(HOSTARCH),x86)
+TOOLCHAIN_EXTERNAL_LINARO_AARCH64_BE_SOURCE = gcc-linaro-7.3.1-$(TOOLCHAIN_EXTERNAL_LINARO_AARCH64_BE_VERSION)-i686_aarch64_be-linux-gnu.tar.xz
+else
+TOOLCHAIN_EXTERNAL_LINARO_AARCH64_BE_SOURCE = gcc-linaro-7.3.1-$(TOOLCHAIN_EXTERNAL_LINARO_AARCH64_BE_VERSION)-x86_64_aarch64_be-linux-gnu.tar.xz
+endif
+
+$(eval $(toolchain-external-package))
