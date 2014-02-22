From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Feb 2014 19:29:57 +0100
Subject: [Buildroot] [PATCH] distcc: deprecate package,
	only useful for development
Message-ID: <1393093797-12770-1-git-send-email-thomas.petazzoni@free-electrons.com>
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
 package/distcc/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/distcc/Config.in b/package/distcc/Config.in
index 2c30a21..0bf36b1 100644
--- a/package/distcc/Config.in
+++ b/package/distcc/Config.in
@@ -2,6 +2,8 @@ config BR2_PACKAGE_DISTCC
 	bool "distcc"
 	# needs fork()
 	depends on BR2_USE_MMU
+	# development tool on target, deprecated
+	depends on BR2_DEPRECATED
 	help
 	  Distributed compiler client and server.  Allows you to
 	  distribute compilation of C code across several machines
-- 
1.8.3.2
