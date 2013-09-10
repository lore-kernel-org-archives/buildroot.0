From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 10 Sep 2013 21:52:36 +0200
Subject: [Buildroot] [git commit] libunwind: needs threads
Message-ID: <20130910200702.C26389B6A9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d9b89e8a43b9c92653d62dedc1bea8d37a4112a9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/39a/39a32d323252e3d986fd9290108db7a496d429d9/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libunwind/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

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
