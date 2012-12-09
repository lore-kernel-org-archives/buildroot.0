From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 9 Dec 2012 21:49:45 +0100
Subject: [Buildroot] [git commit] ccache: uses fork(),
	therefore only usable on MMU platforms
Message-ID: <20121209210012.5D1F49A157@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b5b4f09f293b64b2d4345170e847cbdd14e1f330
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.org/results/2ba0eb693d24ac4ed9979762db234bfff1952c69/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ccache/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/ccache/Config.in b/package/ccache/Config.in
index 4a37973..30e6578 100644
--- a/package/ccache/Config.in
+++ b/package/ccache/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_CCACHE
 	bool "ccache"
+	# needs fork()
+	depends on BR2_USE_MMU
 	help
 	  ccache is a compiler cache. It speeds up recompilation by
 	  caching previous compilations and detecting when the same
