From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  9 Dec 2012 19:13:56 +0100
Subject: [Buildroot] [PATCH 1/8] ccache: uses fork(),
	there only usable on MMU platforms
In-Reply-To: <cover.1355076808.git.thomas.petazzoni@free-electrons.com>
References: <cover.1355076808.git.thomas.petazzoni@free-electrons.com>
Message-ID: <af11bb3bb397ca7a580f200d117fa68953811297.1355076808.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

  http://autobuild.buildroot.org/results/2ba0eb693d24ac4ed9979762db234bfff1952c69/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ccache/Config.in |    2 ++
 1 file changed, 2 insertions(+)

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
-- 
1.7.9.5
