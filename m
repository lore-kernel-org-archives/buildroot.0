From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Apr 2019 21:16:21 +0200
Subject: [Buildroot] [git commit] package/binutils: disable on nds32
Message-ID: <20190417191238.7548A8ED32@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b45a703078e6f3be096f24ac63848490d32d0d29
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream binutils does not yet have support for the nds32
architecture, so let's disable binutils for the target on this
architecture for the moment.

Fixes:

  http://autobuild.buildroot.net/results/1b18acb11db4d6c4198deb7385aff3d4d524c37e/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/binutils/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/binutils/Config.in b/package/binutils/Config.in
index e17a8ec65a..2bf7929ac8 100644
--- a/package/binutils/Config.in
+++ b/package/binutils/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_BINUTILS
 	bool "binutils"
-	depends on !BR2_nios2
+	depends on !BR2_nios2 && !BR2_nds32
 	depends on BR2_USE_WCHAR
 	help
 	  Install binutils on the target
@@ -21,5 +21,5 @@ config BR2_PACKAGE_BINUTILS_TARGET
 endif
 
 comment "binutils needs a toolchain w/ wchar"
-	depends on !BR2_nios2
+	depends on !BR2_nios2 && !BR2_nds32
 	depends on !BR2_USE_WCHAR
