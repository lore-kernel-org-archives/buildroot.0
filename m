From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 Jul 2017 23:15:11 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] toolchain: CodeSourcery
	AMD64 affected by PR19615
Message-ID: <20170720055506.48AAE800CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=31477ee2799019aa93e28fb4fd50d394afae7a57
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 73143ab89472504f70f556550ce2d16d489bfbab)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/toolchain-common.in                                        | 5 +++++
 .../toolchain-external-codesourcery-amd64/Config.in                  | 1 +
 2 files changed, 6 insertions(+)

diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index 96d5709..38baaa9 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -7,6 +7,11 @@ source "package/gdb/Config.in.host"
 
 comment "Toolchain Generic Options"
 
+# https://sourceware.org/bugzilla/show_bug.cgi?id=19615
+# Affect toolchains built with binutils 2.26 (fixed in binutils 2.26.1).
+config BR2_TOOLCHAIN_HAS_BINUTILS_BUG_19615
+	bool
+
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=64735
 # exception_ptr, nested_exception, and future from libstdc++ are not
 # available for architectures not supporting always lock-free atomic
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-amd64/Config.in b/toolchain/toolchain-external/toolchain-external-codesourcery-amd64/Config.in
index 32d79eb..101e227 100644
--- a/toolchain/toolchain-external/toolchain-external-codesourcery-amd64/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-codesourcery-amd64/Config.in
@@ -11,6 +11,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AMD64
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_7
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_6
+	select BR2_TOOLCHAIN_HAS_BINUTILS_BUG_19615 # based-on binutils-2.26
 	help
 	  Sourcery CodeBench toolchain for the amd64 (x86_64)
 	  architectures, from Mentor Graphics. It uses gcc 6.2,
