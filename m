From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  9 Mar 2019 22:12:36 +0100
Subject: [Buildroot] [PATCH 1/1] package/mongodb: disable on powerpc64
Message-ID: <20190309211236.15682-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As stated in SConstruct, the altivec runtime test breaks
cross-compilation: "This checks for an altivec optimization we use in
full text search. Different versions of gcc appear to put output bytes
in different parts of the output vector produced by vec_vbpermq.  This
configure check looks to see which format the compiler produces. NOTE:
This breaks cross compiles, as it relies on checking runtime
functionality for the environment we're in."

Fixes:
 - http://autobuild.buildroot.org/results/162198617979a83b66f70ed6013251942ed04d67

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mongodb/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mongodb/Config.in b/package/mongodb/Config.in
index 4696eb7660..7df502add6 100644
--- a/package/mongodb/Config.in
+++ b/package/mongodb/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_MONGODB_ARCH_SUPPORTS
 	bool
 	# ARM needs LDREX/STREX, so ARMv6+
 	default y if BR2_arm && !BR2_ARM_CPU_ARMV4 && !BR2_ARM_CPU_ARMV5
-	default y if BR2_aarch64 || BR2_powerpc64 || BR2_x86_64
+	default y if BR2_aarch64 || BR2_x86_64
 
 config BR2_PACKAGE_MONGODB
 	bool "mongodb"
-- 
2.20.1
