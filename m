From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 7 Oct 2011 21:31:40 +0200
Subject: [Buildroot] [git commit] lsof: no longer needs rpc support in
	toolchain
Message-ID: <20111008114727.434498E29C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=21f91bbba5dda53625e14f20e6f551f9cc268aed
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/lsof/Config.in |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/package/lsof/Config.in b/package/lsof/Config.in
index 22b7f5e..cc7512c 100644
--- a/package/lsof/Config.in
+++ b/package/lsof/Config.in
@@ -1,12 +1,8 @@
 config BR2_PACKAGE_LSOF
 	bool "lsof"
-	depends on BR2_INET_RPC
 	help
 	  lsof (LiSt Open Files)
 	  The lsof tool lists information about files opened by
 	  processes.
 
 	  ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/
-
-comment "lsof requires a toolchain with RPC support"
-	depends on !BR2_INET_RPC
