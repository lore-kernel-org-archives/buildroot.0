From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 16 Mar 2016 09:18:26 +0100
Subject: [Buildroot] [git commit] jamvm: needs dynamic library support
Message-ID: <20160316081910.5B73881871@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cba44b10948a732a1eae841d1761638046c323c6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/931/931a005fab39f22bda0fd8c249f3e4d1f5eba4cc/
http://autobuild.buildroot.net/results/fa3/fa34334acd8d682e76444d9208463f364de96291/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/jamvm/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/jamvm/Config.in b/package/jamvm/Config.in
index 3b5ff3e..2cc97a1 100644
--- a/package/jamvm/Config.in
+++ b/package/jamvm/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_JAMVM
 	bool "jamvm"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_STATIC_LIBS
 	depends on BR2_arm || BR2_armeb || BR2_i386 || BR2_x86_64 \
 		|| BR2_mips || BR2_mipsel || BR2_powerpc
 	select BR2_PACKAGE_ZLIB
@@ -11,7 +12,7 @@ config BR2_PACKAGE_JAMVM
 
 	  http://jamvm.sf.net
 
-comment "jamvm needs a toolchain w/ threads"
+comment "jamvm needs a toolchain w/ threads, dynamic library"
 	depends on BR2_arm || BR2_armeb || BR2_i386 || BR2_x86_64 \
 		|| BR2_mips || BR2_mipsel || BR2_powerpc
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
