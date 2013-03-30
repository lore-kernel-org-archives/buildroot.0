From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 30 Mar 2013 20:46:54 +0100
Subject: [Buildroot] [git commit] gtest: needs mmu
Message-ID: <20130330194755.1D9799B3BF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f19928597b8e1c71b6546e69e76ec3896849c4be
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/ed2026b98d0cdded8d8ee4d5c86823142a5bdab9/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gtest/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/gtest/Config.in b/package/gtest/Config.in
index c50b5f7..5c065d6 100644
--- a/package/gtest/Config.in
+++ b/package/gtest/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_GTEST
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_MMU # fork()
 	help
 	  Google's framework for writing C++ tests on a variety of
 	  platforms (Linux, Mac OS X, Windows, Cygwin, Windows CE, and
