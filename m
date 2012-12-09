From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 9 Dec 2012 21:51:12 +0100
Subject: [Buildroot] [git commit] ccache: deprecate the target package
Message-ID: <20121209210012.8025F9A157@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=28acda4b63e9ef4d1203765c83117ffabb5750e0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since we have deprecated the capability of building a toolchain for
the target, it makes sense to also deprecate ccache for the target.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ccache/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/ccache/Config.in b/package/ccache/Config.in
index 30e6578..41ace52 100644
--- a/package/ccache/Config.in
+++ b/package/ccache/Config.in
@@ -2,6 +2,8 @@ config BR2_PACKAGE_CCACHE
 	bool "ccache"
 	# needs fork()
 	depends on BR2_USE_MMU
+	# We no longer support a toolchain on the target
+	depends on BR2_DEPRECATED
 	help
 	  ccache is a compiler cache. It speeds up recompilation by
 	  caching previous compilations and detecting when the same
