From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 3 Jan 2016 21:51:15 +0100
Subject: [Buildroot] [git commit] package/tremor: select libogg package
Message-ID: <20160103210633.6F2E2822FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2565b56a11213f14239f7dc7b212855b9987d648
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

tremor depends on libogg package but doesn't select it
in Config.in. so libogg build is trigged at Makefile level.

Since 28f67899e54f15c6e48484ea2976c3e431756bcb, the build
stop if a package build is trigged at Makefile level without
being selected at Config.in level.

Fixes:
http://autobuild.buildroot.net/results/0da/0da3265f0f1e499f5d34ed32b0d13a2eda53f976

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tremor/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/tremor/Config.in b/package/tremor/Config.in
index 6125926..1a478c4 100644
--- a/package/tremor/Config.in
+++ b/package/tremor/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_TREMOR
 	bool "tremor (fixed point vorbis decoder)"
+	select BR2_PACKAGE_LIBOGG
 	help
 	  Tremor is a fixed point implementation of an Ogg Vorbis
 	  decoder. It provides a decoding API similar to libvorbis,
