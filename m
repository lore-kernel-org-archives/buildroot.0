From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 22 Feb 2014 21:57:32 +0100
Subject: [Buildroot] [git commit] distcc: deprecate package,
	only useful for development
Message-ID: <20140222210313.1C4B79056B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=35787b822dad01c837893b5c3fa9c25b72f0da4c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since quite a while, we have deprecated, and then removed the support
to build a compiler on the target. Therefore, having a distcc package
for the package is quite useless, and this patch consequently marks it
as deprecated so it can be removed in a future version of Buildroot.

Fixes:

  http://autobuild.buildroot.net/results/16b/16be2138c8e5ba785fa2ad55b478dcd1b6fb5123/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/distcc/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

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
