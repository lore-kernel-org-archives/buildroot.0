From: Mason <slash.tmp@free.fr>
Date: Mon, 9 Oct 2017 22:03:53 +0200
Subject: [Buildroot] [PATCH 6/6] toolchain-external: bump version of Linaro
 AArch64 toolchain to 2017.08
In-Reply-To: <d0aa1248-6dab-90a6-c405-838953afedc9@sigmadesigns.com>
References: <d0aa1248-6dab-90a6-c405-838953afedc9@sigmadesigns.com>
Message-ID: <a591dd49-1531-0549-f18e-109494fded35@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Romain Naour <romain.naour@gmail.com>

GDB has been updated to 8.0 version in the release.

https://releases.linaro.org/components/toolchain/binaries/6.4-2017.08

Tested with qemu_aarch64_virt_defconfig.

6.4-2017.08 includes several patches for glibc 2.23 mitigating
some of the "stack clash" vulnerabilities reported by Qualys.

https://www.qualys.com/2017/06/19/stack-clash/stack-clash.txt
https://git.linaro.org/toolchain/glibc.git/log/?h=linaro/2.23/master

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 0365f41c874e9d22a73153d43e96c90e19bc1ea6)
Signed-off-by: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
---
 .../toolchain-external-linaro-aarch64/Config.in                   | 2 +-
 .../toolchain-external-linaro-aarch64.hash                        | 4 ++--
 .../toolchain-external-linaro-aarch64.mk                          | 8 ++++----
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in b/toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in
index caa5ed340af9..5f66f5666298 100644
--- a/toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in
@@ -1,5 +1,5 @@
 config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64
-	bool "Linaro AArch64 2017.02"
+	bool "Linaro AArch64 2017.08"
 	depends on BR2_aarch64
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on !BR2_STATIC_LIBS
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-aarch64/toolchain-external-linaro-aarch64.hash b/toolchain/toolchain-external/toolchain-external-linaro-aarch64/toolchain-external-linaro-aarch64.hash
index 2379290943f6..2360280e9568 100644
--- a/toolchain/toolchain-external/toolchain-external-linaro-aarch64/toolchain-external-linaro-aarch64.hash
+++ b/toolchain/toolchain-external/toolchain-external-linaro-aarch64/toolchain-external-linaro-aarch64.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 e8d1dba8712e3f3994faf742d5c5dff7deba69f94e9655b1e673df7f26b0908b  gcc-linaro-6.3.1-2017.02-i686_aarch64-linux-gnu.tar.xz
-sha256 10670e1c5d2ab77b937a26cc7f2a22e8eb6cb223e2df7c763f02ce63339e66bc  gcc-linaro-6.3.1-2017.02-x86_64_aarch64-linux-gnu.tar.xz
+sha256 6365480ab93e30185ffd33070b9332e0caa2c3c0813dd71bfbc83d300b76b4c9  gcc-linaro-6.4.1-2017.08-i686_aarch64-linux-gnu.tar.xz
+sha256 f507d071c6969665e26c595d6d952d7b18eb11609a71cb6debbafb55d700522a  gcc-linaro-6.4.1-2017.08-x86_64_aarch64-linux-gnu.tar.xz
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-aarch64/toolchain-external-linaro-aarch64.mk b/toolchain/toolchain-external/toolchain-external-linaro-aarch64/toolchain-external-linaro-aarch64.mk
index ff3d3dbf337b..6053ea78a6e4 100644
--- a/toolchain/toolchain-external/toolchain-external-linaro-aarch64/toolchain-external-linaro-aarch64.mk
+++ b/toolchain/toolchain-external/toolchain-external-linaro-aarch64/toolchain-external-linaro-aarch64.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-TOOLCHAIN_EXTERNAL_LINARO_AARCH64_VERSION = 2017.02
-TOOLCHAIN_EXTERNAL_LINARO_AARCH64_SITE = https://releases.linaro.org/components/toolchain/binaries/6.3-$(TOOLCHAIN_EXTERNAL_LINARO_AARCH64_VERSION)/aarch64-linux-gnu
+TOOLCHAIN_EXTERNAL_LINARO_AARCH64_VERSION = 2017.08
+TOOLCHAIN_EXTERNAL_LINARO_AARCH64_SITE = https://releases.linaro.org/components/toolchain/binaries/6.4-$(TOOLCHAIN_EXTERNAL_LINARO_AARCH64_VERSION)/aarch64-linux-gnu
 
 ifeq ($(HOSTARCH),x86)
-TOOLCHAIN_EXTERNAL_LINARO_AARCH64_SOURCE = gcc-linaro-6.3.1-$(TOOLCHAIN_EXTERNAL_LINARO_AARCH64_VERSION)-i686_aarch64-linux-gnu.tar.xz
+TOOLCHAIN_EXTERNAL_LINARO_AARCH64_SOURCE = gcc-linaro-6.4.1-$(TOOLCHAIN_EXTERNAL_LINARO_AARCH64_VERSION)-i686_aarch64-linux-gnu.tar.xz
 else
-TOOLCHAIN_EXTERNAL_LINARO_AARCH64_SOURCE = gcc-linaro-6.3.1-$(TOOLCHAIN_EXTERNAL_LINARO_AARCH64_VERSION)-x86_64_aarch64-linux-gnu.tar.xz
+TOOLCHAIN_EXTERNAL_LINARO_AARCH64_SOURCE = gcc-linaro-6.4.1-$(TOOLCHAIN_EXTERNAL_LINARO_AARCH64_VERSION)-x86_64_aarch64-linux-gnu.tar.xz
 endif
 
 $(eval $(toolchain-external-package))
-- 
2.14.2
