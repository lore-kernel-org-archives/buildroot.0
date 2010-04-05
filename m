From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 5 Apr 2010 13:48:10 +0200
Subject: [Buildroot] [git commit master] gcc: hide shared libgcc option if
	BR2_PREFER_STATIC_LIB is enabled
Message-ID: <20100405131722.B10D47FA2B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=6cdcc4d7d8134f4b60f0eb9039090f9ad4c38366
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Shared libgcc without shared libs doesn't make much sense.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/gcc/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/toolchain/gcc/Config.in b/toolchain/gcc/Config.in
index ed0c108..97d5eb7 100644
--- a/toolchain/gcc/Config.in
+++ b/toolchain/gcc/Config.in
@@ -153,6 +153,7 @@ config BR2_INSTALL_FORTRAN
 
 config BR2_GCC_SHARED_LIBGCC
 	bool "Build/install a shared libgcc?"
+	depends on !BR2_PREFER_STATIC_LIB
 	default y
 	depends on !BR2_sparc && !BR2_sparc64
 	help
-- 
1.6.3.3
