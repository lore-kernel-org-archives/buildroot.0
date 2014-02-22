From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Feb 2014 21:47:03 +0100
Subject: [Buildroot] [PATCH v2] distcc: deprecate package,
	only useful for development
Message-ID: <1393102023-4049-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since quite a while, we have deprecated, and then removed the support
to build a compiler on the target. Therefore, having a distcc package
for the package is quite useless, and this patch consequently marks it
as deprecated so it can be removed in a future version of Buildroot.

Fixes:

  http://autobuild.buildroot.net/results/16b/16be2138c8e5ba785fa2ad55b478dcd1b6fb5123/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---

Changes v1 -> v2:

 * Use BR2_DEPRECATED_SINCE_2014_02 instead of BR2_DEPRECATED. Thanks
   to Ryan Barnett for anticipating Thomas DS potential reaction to my
   mistake :-)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/distcc/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/distcc/Config.in b/package/distcc/Config.in
index 2c30a21..08e1ab3 100644
--- a/package/distcc/Config.in
+++ b/package/distcc/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_DISTCC
 	bool "distcc"
 	# needs fork()
 	depends on BR2_USE_MMU
+	depends on BR2_DEPRECATED_SINCE_2014_02
 	help
 	  Distributed compiler client and server.  Allows you to
 	  distribute compilation of C code across several machines
-- 
1.8.3.2
