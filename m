From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 24 Jun 2020 21:57:43 +0200
Subject: [Buildroot] [git commit] arch/Config.in: add
 BR2_ARCH_NEEDS_GCC_AT_LEAST_10
Message-ID: <20200624195533.0EE77801B9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b92b727d6fa4a66df72494b7bb3dbac09196b047
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This new symbol will be used by architectures introduced with gcc 10.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 arch/Config.in             | 4 ++++
 package/gcc/Config.in.host | 1 +
 2 files changed, 5 insertions(+)

diff --git a/arch/Config.in b/arch/Config.in
index 94bd2150ca..0707c076e2 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -308,6 +308,10 @@ config BR2_ARCH_NEEDS_GCC_AT_LEAST_9
 	bool
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_8
 
+config BR2_ARCH_NEEDS_GCC_AT_LEAST_10
+	bool
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_9
+
 # The following string values are defined by the individual
 # Config.in.$ARCH files
 config BR2_ARCH
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 264428d06b..c7444e243b 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -39,6 +39,7 @@ config BR2_GCC_VERSION_8_X
 
 config BR2_GCC_VERSION_9_X
 	bool "gcc 9.x"
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_10
 	# or1k needs binutils >= 2.32
 	depends on !(BR2_or1k && BR2_BINUTILS_VERSION_2_31_X)
 	# powerpc spe support has been deprecated since gcc 8.x.
