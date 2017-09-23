From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 23 Sep 2017 22:15:36 +0200
Subject: [Buildroot] [git commit] package/mdadm: not available in static
	builds
Message-ID: <20170923201331.DAB408104A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9b7111a1e2d6a91a56e583707597f4f35aeea3bc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

http://git.neil.brown.name/?p=mdadm.git;a=commitdiff;h=7716570e6d906e7326f83d466f6ba73009649d03#patch9
added code to include dlfcn.h.

Fixes
http://autobuild.buildroot.net/results/163/163ad5a9f976662be8ca8664f91254f90fca8439/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/mdadm/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/mdadm/Config.in b/package/mdadm/Config.in
index e0d606b..61d631c 100644
--- a/package/mdadm/Config.in
+++ b/package/mdadm/Config.in
@@ -1,7 +1,12 @@
 config BR2_PACKAGE_MDADM
 	bool "mdadm"
+	depends on !BR2_STATIC_LIBS # dlfcn.h
 	depends on BR2_USE_MMU # fork()
 	help
 	  Utility for managing Linux Software RAID arrays.
 
 	  http://neil.brown.name/blog/mdadm
+
+comment "mdadm needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
+	depends on BR2_USE_MMU
