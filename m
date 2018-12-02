From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  2 Dec 2018 15:04:16 +0100
Subject: [Buildroot] [PATCH 1/2] toolchain: add binutils bug 20765 to linaro
 Aarch64be
In-Reply-To: <cover.1543759351.git.yann.morin.1998@free.fr>
References: <cover.1543759351.git.yann.morin.1998@free.fr>
Message-ID: <698923c53dba1a744211581ff830d2294965ff69.1543759351.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This bug has been fixed on the 2.29 branch, but not 2.29 release has
been made since then, so consider only 2.30 to have the fix from our
point of view.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 toolchain/Config.in                                                  | 5 +++++
 .../toolchain-external-linaro-aarch64-be/Config.in                   | 1 +
 2 files changed, 6 insertions(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index bf8ed5bf5b..e6c0e51bcd 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -74,6 +74,11 @@ config BR2_TOOLCHAIN_HAS_BINUTILS_BUG_19615
 config BR2_TOOLCHAIN_HAS_BINUTILS_BUG_20006
 	bool
 
+# https://sourceware.org/bugzilla/show_bug.cgi?id=20765
+# Affect toolchains built with binutils 2.26..2.29 (fixed in binutils 2.30).
+config BR2_TOOLCHAIN_HAS_BINUTILS_BUG_20765
+	bool
+
 # Atomic types can be:
 #  - never lock-free
 #  - sometimes lock-free
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/Config.in b/toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/Config.in
index 9e7d2a6233..72d33140da 100644
--- a/toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/Config.in
@@ -10,6 +10,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_BE
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_10
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_7
 	select BR2_TOOLCHAIN_HAS_FORTRAN
+	select BR2_TOOLCHAIN_HAS_BINUTILS_BUG_20765
 	help
 	  Toolchain for the AArch64 Big Endian architecture, from
 	  http://www.linaro.org/engineering/armv8/
-- 
2.14.1
