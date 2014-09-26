From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 26 Sep 2014 21:36:43 +0200
Subject: [Buildroot] [PATCH 1/1] jamvm: bump to 2.0.0 (including mips
	big-endian support)
Message-ID: <1411760203-9478-1-git-send-email-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

This commit bumps jamvm to version 2.0.0. From the release notes:

    I'm pleased to announce a new release of JamVM.  JamVM 2.0.0 is the
    first release of JamVM with support for OpenJDK (in addition to GNU
    Classpath). Although IcedTea already includes JamVM with OpenJDK
    support, this has been based on periodic snapshots of the development
    tree.

    JamVM 2.0.0 supports OpenJDK 6, 7 and 8 (the latest). With OpenJDK 7 and
    8 this includes full support for JSR 292 (invokedynamic). JamVM 2.0.0
    with OpenJDK 8 also includes full support for Lambda expressions (JSR
    335), type annotations (JSR 308) and method parameter reflection.

    In addition to OpenJDK support, JamVM 2.0.0 also includes many
    bug-fixes, performance improvements and improved compatibility (from
    running the OpenJDK jtreg tests).

As this release now also supports MIPS big-endian targets, this commit
fixes bug #7010 (https://bugs.busybox.net/show_bug.cgi?id=7010)

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
---
Note: according to the README, powerpc64 is also supported, but needing
--with-libffi. This commit does not yet enable that support.

 package/jamvm/Config.in | 8 ++++----
 package/jamvm/jamvm.mk  | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/jamvm/Config.in b/package/jamvm/Config.in
index dbd0fbb..f480995 100644
--- a/package/jamvm/Config.in
+++ b/package/jamvm/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_JAMVM
 	bool "jamvm"
 	depends on BR2_INET_IPV6
-	depends on BR2_arm || BR2_armeb || BR2_i386 \
-		|| BR2_mipsel || BR2_powerpc || BR2_x86_64
+	depends on BR2_arm || BR2_armeb || BR2_i386 || BR2_x86_64 \
+		|| BR2_mips || BR2_mipsel || BR2_powerpc
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_CLASSPATH
 	help
@@ -12,6 +12,6 @@ config BR2_PACKAGE_JAMVM
 	  http://jamvm.sf.net
 
 comment "jamvm needs a toolchain w/ IPv6"
-	depends on BR2_arm || BR2_armeb || BR2_i386 \
-		|| BR2_mipsel || BR2_powerpc || BR2_x86_64
+	depends on BR2_arm || BR2_armeb || BR2_i386 || BR2_x86_64 \
+		|| BR2_mips || BR2_mipsel || BR2_powerpc
 	depends on !BR2_INET_IPV6
diff --git a/package/jamvm/jamvm.mk b/package/jamvm/jamvm.mk
index 53455c4..a2db513 100644
--- a/package/jamvm/jamvm.mk
+++ b/package/jamvm/jamvm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JAMVM_VERSION = 1.5.4
+JAMVM_VERSION = 2.0.0
 JAMVM_SITE = http://downloads.sourceforge.net/project/jamvm/jamvm/JamVM%20$(JAMVM_VERSION)
 JAMVM_LICENSE = GPLv2+
 JAMVM_LICENSE_FILES = COPYING
-- 
1.8.5.1
