From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Aug 2012 10:56:12 +0200
Subject: [Buildroot] [git commit] cups: uses fork(),
	only available on MMU platforms
Message-ID: <20120826090843.C8441993DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9241fb6794cae1cad66d83ac3dfcfe243bc5566b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/6db1eb27387696bfa6b4d8ffb30eff00a2f842d0/build-end.log.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cups/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/cups/Config.in b/package/cups/Config.in
index 0176423..dc1c2ed 100644
--- a/package/cups/Config.in
+++ b/package/cups/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_CUPS
 	bool "cups"
+	# needs fork()
+	depends on BR2_USE_MMU
 	help
 	  The Common Unix Printing System
 
