From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 29 Nov 2018 21:22:18 +0100
Subject: [Buildroot] [git commit] toolchain: CodeSourcery AMD64 affected by
 PR20006
Message-ID: <20181129202131.BC16E88F4D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b51420742cffc3815ef09ef61a27ce66cd9905d9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/Config.in                                                  | 5 +++++
 .../toolchain-external-codesourcery-amd64/Config.in                  | 1 +
 2 files changed, 6 insertions(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index c2192a52b1..196612b8b0 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -69,6 +69,11 @@ comment "Toolchain Generic Options"
 config BR2_TOOLCHAIN_HAS_BINUTILS_BUG_19615
 	bool
 
+# https://sourceware.org/bugzilla/show_bug.cgi?id=20006
+# Affect toolchains built with binutils 2.26 (fixed in binutils 2.26.1).
+config BR2_TOOLCHAIN_HAS_BINUTILS_BUG_20006
+	bool
+
 # Atomic types can be:
 #  - never lock-free
 #  - sometimes lock-free
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-amd64/Config.in b/toolchain/toolchain-external/toolchain-external-codesourcery-amd64/Config.in
index 50c5a20019..9187333b95 100644
--- a/toolchain/toolchain-external/toolchain-external-codesourcery-amd64/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-codesourcery-amd64/Config.in
@@ -13,6 +13,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AMD64
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_7
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_6
 	select BR2_TOOLCHAIN_HAS_BINUTILS_BUG_19615 # based-on binutils-2.26
+	select BR2_TOOLCHAIN_HAS_BINUTILS_BUG_20006 # based-on binutils-2.26
 	help
 	  Sourcery CodeBench toolchain for the amd64 (x86_64)
 	  architectures, from Mentor Graphics. It uses gcc 6.2,
