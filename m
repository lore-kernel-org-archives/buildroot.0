From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 Dec 2013 00:06:02 +0100
Subject: [Buildroot] [git commit] oprofile: disable on xtensa
Message-ID: <20131230230705.DCA149C2A2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c45979c732cb610ad5d54e23dd7d4d49e519d45b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Missing memory barrier definition. Fixes
http://autobuild.buildroot.net/results/df7/df797a81111fa15de9337adefca05cbac156d0b2/.

Also, add nios2 to the dependencies comment while at it.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/oprofile/Config.in |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/oprofile/Config.in b/package/oprofile/Config.in
index 2f223c0..075e9ea 100644
--- a/package/oprofile/Config.in
+++ b/package/oprofile/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_OPROFILE
 	select BR2_PACKAGE_LIBPFM4 if BR2_powerpc
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_aarch64 && !BR2_nios2 # binutils
+	depends on !BR2_xtensa
 	# libpfm4 is needed on PowerPC, and requires thread support
 	depends on BR2_TOOLCHAIN_HAS_THREADS || !BR2_powerpc
 	help
@@ -25,7 +26,8 @@ config BR2_PACKAGE_OPROFILE
 	  libraries, and applications.
 
 comment "oprofile needs a toolchain w/ C++"
-	depends on BR2_USE_MMU && !BR2_aarch64
+	depends on BR2_USE_MMU
+	depends on !BR2_aarch64 && !BR2_nios2 && !BR2_xtensa
 	depends on !BR2_INSTALL_LIBSTDCPP
 
 comment "oprofile needs a toolchain w/ threads on PPC"
