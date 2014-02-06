From: Ryan Barnett <ryanbarnett3@gmail.com>
Date: Thu,  6 Feb 2014 23:56:56 +0100
Subject: [Buildroot] [PATCH 1/2] dmraid: disable on ARC arch
Message-ID: <1391727417-12293-1-git-send-email-rjbarnet@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The ARC compiler has an internal failure while compiling this package
so disable this package for this architecture.

Fixes:
  http://autobuild.buildroot.net/results/ef6/ef6a0e2d382ae202bb8f0e9fc9f5e48c90119faf

Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
---
 package/dmraid/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/dmraid/Config.in b/package/dmraid/Config.in
index 028b46c..2f0c5b4 100644
--- a/package/dmraid/Config.in
+++ b/package/dmraid/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_DMRAID
 	bool "dmraid"
 	depends on BR2_LARGEFILE
 	depends on BR2_USE_MMU # lvm2
+	depends on !BR2_arc
 	select BR2_PACKAGE_LVM2
 	help
 	  dmraid discovers, activates, deactivates and displays properties
@@ -13,3 +14,4 @@ config BR2_PACKAGE_DMRAID
 comment "dmraid needs a toolchain w/ largefile"
 	depends on BR2_USE_MMU
 	depends on !BR2_LARGEFILE
+	depends on !BR2_arc
-- 
1.8.3.2
