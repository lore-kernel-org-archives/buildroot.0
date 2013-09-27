From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 27 Sep 2013 11:35:23 +0200
Subject: [Buildroot] [git commit] xinetd: needs mmu
Message-ID: <20130927101950.219D49B88F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5ce1fb3d25ab423c44525e1ae84505713830fa05
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Axel Lin <axel.lin@ingics.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/xinetd/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/xinetd/Config.in b/package/xinetd/Config.in
index 76fe603..7f3575c 100644
--- a/package/xinetd/Config.in
+++ b/package/xinetd/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_XINETD
 	bool "xinetd"
+	depends on BR2_USE_MMU # fork()
 	help
 	  xinetd is a secure replacement for inetd. It was originally written by
 	  panos at cs.colorado.edu.
