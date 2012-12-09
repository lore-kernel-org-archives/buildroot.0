From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  9 Dec 2012 19:13:57 +0100
Subject: [Buildroot] [PATCH 2/8] ccache: deprecate the target package
In-Reply-To: <cover.1355076808.git.thomas.petazzoni@free-electrons.com>
References: <cover.1355076808.git.thomas.petazzoni@free-electrons.com>
Message-ID: <7f267429ccc8c8e1615e9d6cf5016be1ac51e77e.1355076808.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since we have deprecated the capability of building a toolchain for
the target, it makes sense to also deprecate ccache for the target.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ccache/Config.in |    2 ++
 1 file changed, 2 insertions(+)

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
-- 
1.7.9.5
