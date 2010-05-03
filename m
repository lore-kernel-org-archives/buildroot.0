From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 3 May 2010 15:13:19 +0200
Subject: [Buildroot] [git commit master] ccache: fix ccache-target
	dependencies
Message-ID: <20100503131405.3AB318D579@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ccb58a730dfffb2d802230ebf6c83569657b4c1e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Ccache for the target doesn't make sense without a toolchain, so make
it depend on it.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/ccache/Config.in.2 |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/toolchain/ccache/Config.in.2 b/toolchain/ccache/Config.in.2
index f7af00d..6a6c789 100644
--- a/toolchain/ccache/Config.in.2
+++ b/toolchain/ccache/Config.in.2
@@ -2,6 +2,7 @@
 
 config BR2_PACKAGE_CCACHE_TARGET
 	bool "ccache"
+	depends on BR2_PACKAGE_GCC_TARGET
 	help
 	  ccache is a compiler cache. It speeds up recompilation of
 	  C/C++ code by caching previous compiles and detecting when
-- 
1.6.3.3
