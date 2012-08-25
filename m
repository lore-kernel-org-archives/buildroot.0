From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Aug 2012 15:44:12 +0200
Subject: [Buildroot] [git commit] distcc: only available on MMU platforms
Message-ID: <20120825204803.1A02299345@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1e7bbc6b33bf67c64887e896cbfce0b887870e23
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.org/results/3c1fa37c5b687767b53868f083910ca3f7dbcac0/build-end.log.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/distcc/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/distcc/Config.in b/package/distcc/Config.in
index 0b518c6..2c30a21 100644
--- a/package/distcc/Config.in
+++ b/package/distcc/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_DISTCC
 	bool "distcc"
+	# needs fork()
+	depends on BR2_USE_MMU
 	help
 	  Distributed compiler client and server.  Allows you to
 	  distribute compilation of C code across several machines
