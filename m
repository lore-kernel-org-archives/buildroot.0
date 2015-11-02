From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 2 Nov 2015 20:59:08 +0100
Subject: [Buildroot] [git commit] x265: needs threads
Message-ID: <20151102195911.CCBE6818FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5968d99b997b605053c414e2993d30eaf72fb25c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes [1]:

  build/x265-1.8/source/common/threading.h:34:21: fatal error: pthread.h: No such file or directory

[1] http://autobuild.buildroot.net/results/261/26134a234be5a67914cde0fb81601f6860d943d2

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x265/Config.in |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/x265/Config.in b/package/x265/Config.in
index 4d202a9..15ae933 100644
--- a/package/x265/Config.in
+++ b/package/x265/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_X265
 	bool "x265"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  x265 is an open source free software and library for encoding video
 	  using the High Efficiency Video Coding (HEVC/H.265) standard. x265 is
@@ -19,5 +20,5 @@ config BR2_PACKAGE_X265_CLI
 
 endif
 
-comment "x265 needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
+comment "x265 needs a toolchain w/ C++, threads"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
