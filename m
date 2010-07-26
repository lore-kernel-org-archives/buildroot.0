From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 27 Jul 2010 00:52:13 +0200
Subject: [Buildroot] [git commit master 1/1] Deprecate pcmcia and microwin
	packages
Message-ID: <20100726225419.433CB82DC3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e475cf0309f11078202ade5019fcf49f58a60eed
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It isn't worth the effort to convert these packages to the new package
infrastructure since they are deprecated.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                    |    2 +-
 package/microwin/Config.in |    2 ++
 package/pcmcia/Config.in   |    2 ++
 3 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index 73fb6eb..660fa1c 100644
--- a/CHANGES
+++ b/CHANGES
@@ -34,7 +34,7 @@
 
 	Removed packages: modutils, portage, rxvt
 
-	Deprecated packages: dillo, libglib12, libgtk12
+	Deprecated packages: dillo, libglib12, libgtk12, microwin, pcmcia
 
 	Issues resolved (http://bugs.uclibc.org):
 
diff --git a/package/microwin/Config.in b/package/microwin/Config.in
index 5445f6a..35a0370 100644
--- a/package/microwin/Config.in
+++ b/package/microwin/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_MICROWIN
 	bool "microwin"
+	# Old, unmaintained graphics stack
+	depends on BR2_DEPRECATED
 	help
 	 Microwindows Graphical User Interface for small and
 	 embedded enviroments.
diff --git a/package/pcmcia/Config.in b/package/pcmcia/Config.in
index fe26fa3..de1e33b 100644
--- a/package/pcmcia/Config.in
+++ b/package/pcmcia/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_PCMCIA
 	bool "pcmcia"
 	depends on BR2_PACKAGE_LINUX
+	# The website says it's deprecated after 2.4.x kernels
+	depends on BR2_DEPRECATED
 	help
 	  PCMCIA tools for Linux.
 
-- 
1.7.1
