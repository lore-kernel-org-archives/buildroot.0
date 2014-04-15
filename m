From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Apr 2014 23:46:34 +0200
Subject: [Buildroot] [git commit] libatomic_ops: introduce a
	BR2_PACKAGE_LIBATOMIC_ARCH_SUPPORTS hidden option
Message-ID: <20140416170059.D1E2F9C80F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f4897a9eb3a09a7363cba885b6b9289ae08a7994
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In preparation to the introduction of packages that select
libatomic_ops, this commit adds an hidden
BR2_PACKAGE_LIBATOMIC_ARCH_SUPPORTS option which allows to easily
depend on the architectures that libatomic_ops is available for.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libatomic_ops/Config.in |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/package/libatomic_ops/Config.in b/package/libatomic_ops/Config.in
index 0d05eea..f0a55a4 100644
--- a/package/libatomic_ops/Config.in
+++ b/package/libatomic_ops/Config.in
@@ -1,5 +1,9 @@
+config BR2_PACKAGE_LIBATOMIC_ARCH_SUPPORTS
+	bool
+	default y if BR2_arm || BR2_armeb || BR2_aarch64 || BR2_i386 || BR2_sparc || BR2_powerpc || BR2_x86_64
+
 config BR2_PACKAGE_LIBATOMIC_OPS
 	bool "libatomic_ops"
-	depends on BR2_arm || BR2_armeb || BR2_aarch64 || BR2_i386 || BR2_sparc || BR2_powerpc || BR2_x86_64
+	depends on BR2_PACKAGE_LIBATOMIC_ARCH_SUPPORTS
 	help
 	  Atomic operations library
