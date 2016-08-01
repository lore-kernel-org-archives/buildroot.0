From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Aug 2016 22:08:16 +0200
Subject: [Buildroot] [git commit] package/xenomai: introduce a
	BR2_PACKAGE_XENOMAI_ARCH_SUPPORTS option
Message-ID: <20160801200926.8EC8F81F4D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ad3dcf0050787061f8a6cf5b07760811a4404daa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Introduce BR2_PACKAGE_XENOMAI_ARCH_SUPPORTS to hold the
architectures than can build and use Xenomai on the target.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/xenomai/Config.in | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/xenomai/Config.in b/package/xenomai/Config.in
index d4c8a89..a4a2795 100644
--- a/package/xenomai/Config.in
+++ b/package/xenomai/Config.in
@@ -1,13 +1,17 @@
-comment "xenomai needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+config BR2_PACKAGE_XENOMAI_ARCH_SUPPORTS
+	bool
+	default y
 	depends on BR2_i386 || BR2_x86_64 || BR2_arm || \
 		   BR2_bfin || BR2_powerpc || BR2_sh4
 
+comment "xenomai needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_PACKAGE_XENOMAI_ARCH_SUPPORTS
+
 config BR2_PACKAGE_XENOMAI
 	bool "Xenomai Userspace"
+	depends on BR2_PACKAGE_XENOMAI_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_i386 || BR2_x86_64 || BR2_arm || \
-		BR2_bfin || BR2_powerpc || BR2_sh4
 	help
 	  Real-Time Framework for Linux
 	  http://www.xenomai.org
