From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 26 Sep 2010 22:25:06 +0200
Subject: [Buildroot] [git commit master 1/1] hotplug: mark as deprecated
Message-ID: <20100926202614.BD2908B6B2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=91e32e23f01b2f47e5a8479996ff00c4c6f278a6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It's ancient (+5yrs), no upstream and stuff like this is better handled
through mdev/udev nowadays.

It will be removed after 2010.11 unless someone complains.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                   |    2 +-
 package/hotplug/Config.in |    1 +
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index 3d9f738..64f4b05 100644
--- a/CHANGES
+++ b/CHANGES
@@ -31,7 +31,7 @@
 	squashfs, strace, taglib, tcpdump, tiff, tn5250, udev,
 	udpcast, usbmount, usbutils, which, xlib_libX11, zlib
 
-	Deprecated packages: lzma
+	Deprecated packages: hotplug, lzma
 
 	Removed packages: dillo, libglib12, libgtk12, microwin,
 	pcmcia
diff --git a/package/hotplug/Config.in b/package/hotplug/Config.in
index 3c740a9..48f1d71 100644
--- a/package/hotplug/Config.in
+++ b/package/hotplug/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_HOTPLUG
 	bool "hotplug"
+	depends on BR2_DEPRECATED
 	help
 	  Plug in new devices and use them immediately.
 
-- 
1.7.1
