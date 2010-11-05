From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 5 Nov 2010 14:34:29 +0100
Subject: [Buildroot] [git commit master 1/1] sfdisk: mark as deprecated
Message-ID: <20101105133442.43B778DBB0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=2b9e2fb4eb34aff57ca1fd6ca18b18dc6c29cf61
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We're using an ancient uclibc specific snapshot, and should rather focus
on moving our util-linux package forward.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                  |    2 +-
 package/sfdisk/Config.in |    1 +
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index 7e841aa..94d13d3 100644
--- a/CHANGES
+++ b/CHANGES
@@ -64,7 +64,7 @@
 	xkeyboard-config, xlib_libX11, xserver_xorg-server, xstroke,
 	xterm, xvkbd, zlib
 
-	Deprecated packages: hotplug, lzma, ng-spice-rework
+	Deprecated packages: hotplug, lzma, ng-spice-rework, sfdisk
 
 	Removed packages: dillo, libglib12, libgtk12, microwin,
 	pcmcia
diff --git a/package/sfdisk/Config.in b/package/sfdisk/Config.in
index d7b8fb4..c5b84be 100644
--- a/package/sfdisk/Config.in
+++ b/package/sfdisk/Config.in
@@ -1,4 +1,5 @@
 config BR2_PACKAGE_SFDISK
 	bool "sfdisk"
+	depends on BR2_DEPRECATED
 	help
 	  Partition table manipulator for Linux.
-- 
1.7.1
