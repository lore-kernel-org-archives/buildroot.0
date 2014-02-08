From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 8 Feb 2014 22:51:10 +0100
Subject: [Buildroot] [git commit] dmraid: disable on ARC arch
Message-ID: <20140208215953.253639C8FC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=262a4c0bf7fb64d632ae6d40c22a62380c0af65f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The ARC compiler has an internal failure while compiling this package
so disable this package for this architecture.

Fixes:
  http://autobuild.buildroot.net/results/ef6/ef6a0e2d382ae202bb8f0e9fc9f5e48c90119faf

[Peter: add comment explaining why]
Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dmraid/Config.in |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/dmraid/Config.in b/package/dmraid/Config.in
index 028b46c..bfdd89b 100644
--- a/package/dmraid/Config.in
+++ b/package/dmraid/Config.in
@@ -2,6 +2,8 @@ config BR2_PACKAGE_DMRAID
 	bool "dmraid"
 	depends on BR2_LARGEFILE
 	depends on BR2_USE_MMU # lvm2
+	# triggers gcc ice
+	depends on !BR2_arc
 	select BR2_PACKAGE_LVM2
 	help
 	  dmraid discovers, activates, deactivates and displays properties
@@ -13,3 +15,4 @@ config BR2_PACKAGE_DMRAID
 comment "dmraid needs a toolchain w/ largefile"
 	depends on BR2_USE_MMU
 	depends on !BR2_LARGEFILE
+	depends on !BR2_arc
