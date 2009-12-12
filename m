From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 12 Dec 2009 01:29:23 +0100
Subject: [Buildroot] [git commit master] gcc: native toolchain needs
	BR2_HAVE_DEVFILES
Message-ID: <20091212002957.891C1777EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b06c9cb16c7409dd407d3362fd6301585d6d9d68
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Native toolchain doesn't make much sense without include / .a files.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/gcc/Config.in.2 |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/toolchain/gcc/Config.in.2 b/toolchain/gcc/Config.in.2
index 78208dc..d9ebfcd 100644
--- a/toolchain/gcc/Config.in.2
+++ b/toolchain/gcc/Config.in.2
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_GCC_TARGET
 	bool "native toolchain in the target filesystem"
+	depends on BR2_HAVE_DEVFILES
 	help
 	  If you want the target system to be able to run
 	  binutils/gcc and compile native code, say Y here.
@@ -12,3 +13,6 @@ config BR2_EXTRA_TARGET_GCC_CONFIG_OPTIONS
 	  Any additional target gcc options you may want to include....
 	  Including, but not limited to --disable-checking etc.
 	  Refer to */configure in your gcc sources.
+
+comment "native toolchain needs development files in target filesystem"
+	depends on !BR2_HAVE_DEVFILES
-- 
1.6.3.3
