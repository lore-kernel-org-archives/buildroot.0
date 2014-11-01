From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Nov 2014 18:19:57 +0100
Subject: [Buildroot] [git commit] package/mono: add threads dependency
Message-ID: <20141101172049.333B7B2AD1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0a73638d1a813f71de872a3531ad7a222dd26e44
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch adds a dependency on BR2_TOOLCHAIN_HAS_THREADS to the mono
package, in order to fix the following autobuilder failures:

  http://autobuild.buildroot.net/results/ece/ece1051cb9238735130b29f76d90a4994058345a/
  http://autobuild.buildroot.net/results/658/65850774d4c6b875cb6ebbf461dcc48cf8208f4f/
  http://autobuild.buildroot.net/results/5d5/5d5074aa73e167099410d244a18114dbced348d1/

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mono/Config.in |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/mono/Config.in b/package/mono/Config.in
index f8f4895..cc015e6 100644
--- a/package/mono/Config.in
+++ b/package/mono/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_MONO
 	bool "mono"
 	depends on BR2_PACKAGE_MONO_ARCH_SUPPORTS
 	depends on BR2_INET_IPV6
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_MONO_45 if !BR2_PACKAGE_MONO_20 && !BR2_PACKAGE_MONO_40
 	help
 	  An open source, cross-platform, implementation of C#
@@ -36,5 +37,5 @@ config BR2_PACKAGE_MONO_45
 
 endif
 
-comment "mono needs a toolchain w/ IPv6"
-	depends on !BR2_INET_IPV6
+comment "mono needs a toolchain w/ IPv6, threads"
+	depends on !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS
