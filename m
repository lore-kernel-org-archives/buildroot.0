From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 10 Sep 2013 15:17:41 -0300
Subject: [Buildroot] [PATCH] libunwind: needs threads
Message-ID: <1378837061-28568-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/39a/39a32d323252e3d986fd9290108db7a496d429d9/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libunwind/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libunwind/Config.in b/package/libunwind/Config.in
index 4f130f0..110ea90 100644
--- a/package/libunwind/Config.in
+++ b/package/libunwind/Config.in
@@ -1,8 +1,12 @@
 config BR2_PACKAGE_LIBUNWIND
 	bool "libunwind"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_arm || BR2_armeb || BR2_mips || BR2_mipsel || BR2_mips64 || \
 		BR2_mips64el || BR2_powerpc || BR2_sh || BR2_sh64 || BR2_i386 || BR2_x86_64
 	help
 	  C API to determine the call-chain of a program.
 
 	  http://www.nongnu.org/libunwind/index.html
+
+comment "libunwind requires a toolchain with thread support"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
-- 
1.8.1.5
