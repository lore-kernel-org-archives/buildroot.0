From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 20 Mar 2021 23:40:56 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] toolchain: introduce
 BR2_TOOLCHAIN_HAS_BINUTILS_BUG_21464
Message-ID: <20210320221838.61B3B87C78@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=52e6dd31084ea7f144394b33c5df0202129a4c5c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

The OpenRISC binutils is affected by a linker bug (binutils bug 21464)
for which no workaround exists. This causes build breakage in a number
of packages, so this commit introduces a
BR2_TOOLCHAIN_HAS_BINUTILS_BUG_21464 option to identify this bug. As
all binutils versions are affected, this option is true whenever the
configuration targets OpenRISC.

The bug was already reported and it's been recently updated:

  https://sourceware.org/bugzilla/show_bug.cgi?id=21464

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 227cefef41f4edd4eaae3c2068fb41d236370f29)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/Config.in | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 5611e5c6d5..a6fe982445 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -81,6 +81,12 @@ config BR2_TOOLCHAIN_HAS_BINUTILS_BUG_19615
 config BR2_TOOLCHAIN_HAS_BINUTILS_BUG_20006
 	bool
 
+# https://sourceware.org/bugzilla/show_bug.cgi?id=21464
+# Affect toolchains built with binutils 2.31.1, still not fixed.
+config BR2_TOOLCHAIN_HAS_BINUTILS_BUG_21464
+	bool
+	default y if BR2_or1k
+
 # Atomic types can be:
 #  - never lock-free
 #  - sometimes lock-free
