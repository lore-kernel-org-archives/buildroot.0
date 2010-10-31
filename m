From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 31 Oct 2010 21:34:18 +0100
Subject: [Buildroot] [git commit master 1/1] toolchain/gcc: fix objective C
	suppor
Message-ID: <20101031203436.7681F8D5E2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=2c37dbf7d148d252c84d13fa1c9beadcc008d7fe
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We've had objective C support in the tree for many years, but somehow
the BR2_GCC_CROSS_OBJC option (similar to the other BR2_GCC_CROSS_*
options) has disappeared.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/gcc/Config.in |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/toolchain/gcc/Config.in b/toolchain/gcc/Config.in
index 8d761c3..ccf1572 100644
--- a/toolchain/gcc/Config.in
+++ b/toolchain/gcc/Config.in
@@ -56,6 +56,12 @@ config BR2_EXTRA_GCC_CONFIG_OPTIONS
 	help
 	  Any additional gcc configure options you may want to include....
 
+config BR2_GCC_CROSS_OBJC
+	bool "Objective-C cross-compiler support"
+	depends on !BR2_avr32
+	help
+	  Build an Objective-C cross-compiler
+
 config BR2_GCC_CROSS_FORTRAN
 	bool "Fortran cross-compiler support"
 	depends on !BR2_avr32
-- 
1.7.1
