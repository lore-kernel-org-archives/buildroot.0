From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Feb 2016 07:19:24 +0100
Subject: [Buildroot] [git commit] rt-tests: unavailable for static builds
Message-ID: <20160201224700.52E027FAE2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1160ba631cf94b5afbea4bfa588298b946340792
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/a6f/a6f6502e55fd68803f3ff8b4b76cce6601e101db/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rt-tests/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/rt-tests/Config.in b/package/rt-tests/Config.in
index db5e0a0..4c57c0f 100644
--- a/package/rt-tests/Config.in
+++ b/package/rt-tests/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_RT_TESTS
 	bool "rt-tests"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
+	depends on !BR2_STATIC_LIBS # dlopen
 	help
 	  Set of utilities for testing the real-time behaviour of a
 	  Linux system.
@@ -26,6 +27,6 @@ comment "rt-tests may not work on MIPS with an external uClibc toolchain"
 	depends on BR2_TOOLCHAIN_EXTERNAL_UCLIBC
 	depends on BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 
-comment "rt-tests needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+comment "rt-tests needs a toolchain w/ threads, dynamic library"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
 	depends on BR2_USE_MMU
