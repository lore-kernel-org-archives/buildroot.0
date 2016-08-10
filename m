From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Aug 2016 22:27:28 +0200
Subject: [Buildroot] [git commit] armadillo: propagate clapack dependency
Message-ID: <20160810202928.97715818DF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4babfd3497b20450d34d5e6ef8840d9afc3f8d06
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 7b75d8c3fa7b234c948ff37c4f14467900083036 added a new dependency
to the clapack package, but forgot to propagate it to the reverse
dependencies, which in this case are just the armadillo package. This
commit fixes that.

Fixes:

  http://autobuild.buildroot.net/results/f34ad4f0cf094fa31b7dc18522e9eedfc5c2c940/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/armadillo/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/armadillo/Config.in b/package/armadillo/Config.in
index 1f3f356..9483f18 100644
--- a/package/armadillo/Config.in
+++ b/package/armadillo/Config.in
@@ -3,6 +3,7 @@ comment "armadillo needs a toolchain w/ C++"
 	depends on !(BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el)
 	depends on !BR2_powerpc
 	depends on !BR2_bfin
+	depends on !BR2_m68k_cf
 
 comment "armadillo needs a glibc toolchain w/ C++"
 	depends on BR2_powerpc
@@ -14,6 +15,7 @@ config BR2_PACKAGE_ARMADILLO
 	depends on !(BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el) # clapack
 	depends on !BR2_powerpc || BR2_TOOLCHAIN_USES_GLIBC # clapack
 	depends on !BR2_bfin # clapack
+	depends on !BR2_m68k_cf # clapack
 	select BR2_PACKAGE_CLAPACK
 	help
 	  Armadillo: An Open Source C++ Linear Algebra Library for
