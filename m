From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Oct 2017 09:18:19 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] toolchain-external: bump
	version of Linaro AArch64 toolchain to 2017.08
Message-ID: <20171016071851.6662581090@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=842dbd20f0462c460e483e87c76e467da6e6f262
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

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
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../toolchain-external-linaro-aarch64/Config.in                   | 2 +-
 .../toolchain-external-linaro-aarch64.hash                        | 4 ++--
 .../toolchain-external-linaro-aarch64.mk                          | 8 ++++----
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in b/toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in
index caa5ed3..5f66f56 100644
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
index 2379290..2360280 100644
--- a/toolchain/toolchain-external/toolchain-external-linaro-aarch64/toolchain-external-linaro-aarch64.hash
+++ b/toolchain/toolchain-external/toolchain-external-linaro-aarch64/toolchain-external-linaro-aarch64.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 e8d1dba8712e3f3994faf742d5c5dff7deba69f94e9655b1e673df7f26b0908b  gcc-linaro-6.3.1-2017.02-i686_aarch64-linux-gnu.tar.xz
-sha256 10670e1c5d2ab77b937a26cc7f2a22e8eb6cb223e2df7c763f02ce63339e66bc  gcc-linaro-6.3.1-2017.02-x86_64_aarch64-linux-gnu.tar.xz
+sha256 6365480ab93e30185ffd33070b9332e0caa2c3c0813dd71bfbc83d300b76b4c9  gcc-linaro-6.4.1-2017.08-i686_aarch64-linux-gnu.tar.xz
+sha256 f507d071c6969665e26c595d6d952d7b18eb11609a71cb6debbafb55d700522a  gcc-linaro-6.4.1-2017.08-x86_64_aarch64-linux-gnu.tar.xz
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-aarch64/toolchain-external-linaro-aarch64.mk b/toolchain/toolchain-external/toolchain-external-linaro-aarch64/toolchain-external-linaro-aarch64.mk
index ff3d3db..6053ea7 100644
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
