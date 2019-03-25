From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 25 Mar 2019 17:23:17 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/mongodb: disable
 on powerpc64
Message-ID: <20190325162536.AB8E381E4B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=335165f718f97807df52e49c40f0b6a1ec8686d0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f9fd1931410ec7f68e0f310efb9c5f616bb73ea8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
